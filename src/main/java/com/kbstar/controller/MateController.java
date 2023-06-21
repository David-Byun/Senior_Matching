package com.kbstar.controller;

import com.kbstar.dto.Mate;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.MateReviewAllDto;
import com.kbstar.dto.MateReviewDto;
import com.kbstar.exception.ErrorCode;
import com.kbstar.exception.UserException;
import com.kbstar.service.MateService;
import com.kbstar.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/mate")
public class MateController {

    private final MateService service;
    private final BCryptPasswordEncoder encoder;

    @Value("${uploadimgdir}")
    String uploadimgdir;

    @GetMapping("/review/{mateId}")
    public String mateReview(Model model, @PathVariable("mateId") int mateId) {
        List<MateReviewDto> mateReviewList = service.findByMateId(mateId);
        Mate foundMate = service.findById(mateId);
        System.out.println("foundMate = " + foundMate.toString());
        int sum = 0;
        int avg = 0;
        for (MateReviewDto mate : mateReviewList) {
            sum = mate.getRate() + sum;
        }
        if (sum != 0) {
            avg = Math.round(sum / mateReviewList.size());
        }
        System.out.println("foundMate = " + foundMate.getImg());
        model.addAttribute("mateReviewList", mateReviewList);
        model.addAttribute("mate", foundMate);
        model.addAttribute("avg", avg);
        System.out.println("avg = " + avg);
        model.addAttribute("countReview", mateReviewList.size());
        return "match/matereview";
    }

    @PostMapping("/review")
    public String register(MateReview mateReview) {
        service.registerMateReview(mateReview);
        return "redirect:/mate/review/" + mateReview.getMateId();
    }

    @GetMapping("/all")
    public String allMate(Model model) {
        List<MateReviewAllDto> mates = service.findAllMates();
        model.addAttribute("mates", mates);
        return "match/allmate";
    }


    @RequestMapping("/signin")
    public String mateSignin(Model model, HttpSession session) {
        model.addAttribute("center", "mateSignin");
        return "index";
    }

    @GetMapping("/profile/{id}")
    public String mateProfile(Model model, HttpSession session, @PathVariable String id) throws Exception {
        Mate mate = service.get(id);
        model.addAttribute("loginmate", mate);
        model.addAttribute("center", "mateProfile");
        return "index";
    }

    @RequestMapping("/login")
    public String mateLogin(Model model, HttpSession session) {
        model.addAttribute("center", "mateLogin");
        return "index";
    }

    @Valid
    @RequestMapping("/signinimpl")
    public String mateSignImpl(Mate mate, Model model, HttpSession session) throws Exception {
        Mate signMate = null;
        try {
            mate.setPassword(encoder.encode(mate.getPassword()));
            System.out.println("mate.getEmail() = " + mate.getEmail());
            service.register(mate);
            signMate = service.get(mate.getEmail());
            session.setMaxInactiveInterval(100000);
            session.setAttribute("loginmate",signMate);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            throw new UserException(ErrorCode.SENIOR_NOT_FOUND);
        }
    }

    @GetMapping("/login?logout")
    public String loginMate(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/loginimpl")
    public String mateLoginImpl(Model model, String email, String password, HttpSession session) {
        Mate mate = null;
        try {
            mate = service.get(email);
            if (mate != null && encoder.matches(password, mate.getPassword())) {
                session.setMaxInactiveInterval(100000);
                session.setAttribute("loginmate", mate);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("시스템 장애 잠시 후 다시 로그인 하세요.");
        }
        return "redirect:/shop";
    }

    @RequestMapping("/update")
    public String mateUpdate(Model model, Mate mate) throws Exception {
        mate.setPassword(encoder.encode(mate.getPassword()));
        service.modify(mate);
        return "redirect:/";
    }

    @RequestMapping("/updateImpl")
    public String updateImpl(Model model, Mate mate) throws Exception {
        MultipartFile mf =  mate.getImgName();
        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        if (imgname.equals("") || imgname == null) {
            service.modify(mate);
        } else {
            mate.setImg(imgname);
            service.modify(mate);
            FileUploadUtil.saveFile(mf, uploadimgdir);
            //이미지 저장 디렉토리에 이미지를 저장한다.
            //우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        }
        return "redirect:/";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        service.remove(String.valueOf(id));
        return "redirect:/";
    }

}

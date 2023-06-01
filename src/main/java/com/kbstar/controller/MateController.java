package com.kbstar.controller;

import com.kbstar.dto.Mate;
import com.kbstar.exception.ErrorCode;
import com.kbstar.exception.UserException;
import com.kbstar.service.MateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MateController {

    private final MateService service;
    private final BCryptPasswordEncoder encoder;


    @RequestMapping("/mate/signin")
    public String mateSignin(Model model, HttpSession session) {
        model.addAttribute("center", "mateSignin");
        return "index";
    }

    @GetMapping("/mate/profile/{id}")
    public String mateProfile(Model model, HttpSession session, @PathVariable String id) throws Exception {
        Mate mate = service.get(id);
        model.addAttribute("loginmate", mate);
        model.addAttribute("center", "mateProfile");
        return "index";
    }


    @RequestMapping("/mate/login")
    public String mateLogin(Model model, HttpSession session) {
        model.addAttribute("center", "mateLogin");
        return "index";
    }


    @Valid
    @RequestMapping("/mate/signinimpl")
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

    @GetMapping("/mate/login?logout")
    public String loginMate(HttpSession session){
        session.invalidate();
        if (session != null) {

            log.info("===================로그아웃 세션 제거 완료 ===================");
        }
        return "redirect:/login";
    }

    @RequestMapping("/mate/loginimpl")
    public String mateLoginImpl(Model model, String email, String password, HttpSession session) {
        String nextPage = "loginfail";
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

    @RequestMapping("/mate/update")
    public String mateUpdate(Model model, Mate mate) throws Exception {
        mate.setPassword(encoder.encode(mate.getPassword()));
        service.modify(mate);
        return "redirect:/";
    }

}

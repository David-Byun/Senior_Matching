package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Member;
import com.kbstar.dto.SeniorSignInDto;
import com.kbstar.exception.ErrorCode;
import com.kbstar.exception.UserException;
import com.kbstar.service.CartService;
import com.kbstar.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    private final CartService cartService;
    private final BCryptPasswordEncoder encoder;

    @Valid
    @RequestMapping("/signinimpl")
    public String signinimpl(@Valid SeniorSignInDto seniorSignInDto, Model model, HttpSession session) throws Exception {
        Member member = seniorSignInDto.toEntity();
        member.setValid(1);
        Member signinMember = null;
        System.out.println("member = " + member.toString());
        try {
            member.setPassword(encoder.encode(member.getPassword()));
            System.out.println("member.getEmail() = " + member.getEmail());
            memberService.register(member);
            signinMember = memberService.get(member.getEmail());
            session.setMaxInactiveInterval(100000);
            session.setAttribute("loginmember",signinMember);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            throw new UserException(ErrorCode.SENIOR_NOT_FOUND);
        }
    }

    @GetMapping("/login?logout")
    public String logoutSenior(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String email, String password, HttpSession session) {
        Member member = null;
        try {
            member = memberService.get(email);
            List<Item> items = cartService.myCart(member.getId());
            if (!items.isEmpty()) {
                session.setAttribute("mycart", 1);
            }
            if (member != null && encoder.matches(password, member.getPassword())) {
                session.setMaxInactiveInterval(100000);// 한 session의 제한시간
                session.setAttribute("loginmember", member); //session에 logincust라는 이름으로 cust를 넣어줌 --> login을 메모리에 제한시간만큼 유지
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("시스템 장애 잠시 후 다시 로그인 하세요.");
        }
        return "redirect:/";
    }

    @RequestMapping("/memberdetail")
    public String memberdetail(Model model) {
        model.addAttribute("center", "memberdetail");
        return "index";
    }

    @RequestMapping("/memberdetailUpdate")
    public String memberdetailUpdate(Model model, Member member) throws Exception {
        member.setPassword(encoder.encode(member.getPassword()));
        memberService.modify(member);
        return "redirect:/";
    }

}

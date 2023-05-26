package com.kbstar.kakaologin;

import com.kbstar.dto.Member;
import com.kbstar.service.MateService;
import com.kbstar.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class KaKaoController {

    private final KaKaoService ks;
    private final MemberService service;

    @GetMapping("/kakao")
    public String getCI(@RequestParam String code, Model model, HttpSession session) throws Exception {

        String access_token = ks.getToken(code);
        Member member = ks.getUserInfo(access_token);
        Member foundMember = service.get(member.getEmail());
        if (foundMember == null) {
            service.register(member);
        }
        session.setAttribute("loginmember", member);
        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
        return "redirect:/";
    }

}
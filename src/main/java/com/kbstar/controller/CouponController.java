package com.kbstar.controller;

import com.kbstar.dto.Member;
import com.kbstar.dto.MyCouponDto;
import com.kbstar.service.CouponService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CouponController {

    private final CouponService couponService;

    @GetMapping("/mycoupon")
    public String mycoupon(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("loginmember");
        List<MyCouponDto> couponList = couponService.getMyCoupon(member.getId());
        model.addAttribute("couponList", couponList);
        model.addAttribute("center", "mycoupon");
        return "index";
    }
}

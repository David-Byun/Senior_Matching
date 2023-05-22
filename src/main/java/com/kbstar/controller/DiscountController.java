package com.kbstar.controller;

import com.kbstar.dto.Discount;
import com.kbstar.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class DiscountController {
    private final DiscountService service;

    @PostMapping("/discount")
    public int Discount(Discount discount, HttpSession session) {
        session.setAttribute("mycoupon", 1000);
        System.out.println("discount = " + discount);
        return discount.getAmount();
    }
    
}

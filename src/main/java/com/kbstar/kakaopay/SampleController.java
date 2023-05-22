package com.kbstar.kakaopay;

import lombok.Setter;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Log
@Controller
public class SampleController {

    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;


    @GetMapping("/kakaoPay")
    public String kakaoPayGet(Model model) {
        model.addAttribute("center", "kakaoPay");
        return "index";
    }

    @PostMapping("/kakaoPay")
    public String kakaoPay(int price, int cnt, HttpSession session) {
        log.info("========price===========" + price);
        log.info("========cnt===========" + cnt);
        log.info("kakaoPay post............................................");
        return "redirect:" + kakaopay.kakaoPayReady(price, cnt);
    }

    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, int price, int cnt) {
        log.info("========price===========" + price);
        log.info("========cnt===========" + cnt);
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, price, cnt));
        model.addAttribute("center", "kakaoPaySuccess");
        return "index";
    }
}


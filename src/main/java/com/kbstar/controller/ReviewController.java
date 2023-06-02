package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.dto.ReviewSearch;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping("/reviewimpl")
    public String reviewimpl(@Valid ItemReview itemReview, Model model, HttpSession session) throws Exception {
        try {
            reviewService.register(itemReview);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }

        model.addAttribute("rreview", itemReview);
        return "redirect:/shop";
    }

    @RequestMapping("/reviewsearch")
    public String reviewsearch(Model model, ReviewSearch rs) throws Exception {

        List<ItemReview> list = null;
        try {
            list = reviewService.search(rs);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }
        model.addAttribute("rs", rs);
        model.addAttribute("reviewlist", list);
        model.addAttribute("center", "reviewall");
        return "index";
    }

}

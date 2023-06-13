package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.MateReviewSearch;
import com.kbstar.dto.ReviewSearch;
import com.kbstar.service.MateReviewService;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@Slf4j
public class MateReviewController {

    @Autowired
    MateReviewService matereviewService;

    @RequestMapping("/matereviewimpl")
    public String matereviewimpl(@Valid MateReview mateReview, Model model, HttpSession session) throws Exception {
        try {
            matereviewService.register(mateReview);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }

        model.addAttribute("review", mateReview);
        return "redirect:/mate";
    }


    @RequestMapping("/matereviewsearch")
    public String matereviewsearch(Model model, MateReviewSearch ms) throws Exception {

        List<MateReview> list = null;
        try {
            list = matereviewService.search(ms);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }
        model.addAttribute("ms", ms);
        model.addAttribute("matereviewlist", list);
        model.addAttribute("center", "matereviewall");
        return "index";
    }

}

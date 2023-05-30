package com.kbstar.controller;

import com.kbstar.dto.*;

import com.kbstar.service.OrderMatchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class MatchController {

    @Autowired
    private final OrderMatchService orderMatchService;

    public MatchController(OrderMatchService orderMatchService) {
//        @RequiredArgsConstructor 을 대체
        this.orderMatchService = orderMatchService;
    }

    @RequestMapping("/ordermatchimpl")
    public String ordermatchImpl(OrderMatch orderMatch, MatchSearch ms, HttpSession session, Model model) throws Exception {
//         ********** member회원가입 진행 후 하단의 세선 반영 추가 필요 **********
//        Member user = (Member) session.getAttribute("loginmember");
//        orderMatch.setMemberId(user.getId());
        orderMatch.setMemberId(202);
        orderMatchService.register(orderMatch);
        List<Mate> mateList = orderMatchService.myMateByDate(ms);

        System.out.println("mateList.get(1).getName().toString() = " + mateList.get(1).getName().toString());

        model.addAttribute("mlist", mateList);
        model.addAttribute("center","matchlist");
        return "index";
    }

//    @RequestMapping("/matchlist")
//    public String myMateByDate(HttpSession session, MatchSearch ms, Model model) throws Exception {
//        List<Mate> mateList = orderMatchService.myMateByDate(ms);
//
//        System.out.println("mateList.get(1).getName().toString() = " + mateList.get(1).getName().toString());
//
//        model.addAttribute("mlist", mateList);
//        model.addAttribute("center","matchlist");
//        return "index";
//    }




//    @GetMapping("/{memberId}")
//    @RequestMapping("/matchlist")
//    public ModelAndView myMateByDate(HttpSession session, MatchSearch ms, Model model) throws Exception {
//        //date별로 뽑은 mate 내역 보여주기 myMateByDate
////        session.setAttribute("memberId",202);
//        List<Mate> mateList = orderMatchService.myMateByDate(ms);
//        System.out.println("modelAndView ========================== " + mateList.get(1).getName().toString());
////        ModelAndView modelAndView = new ModelAndView("matchlist");
////        modelAndView.addObject("mlist", mateList);
////        modelAndView.addObject("center", "matchlist");
//        ModelAndView modelAndView = new ModelAndView("index");
//        modelAndView.addObject("mlist", mateList);
//        modelAndView.addObject("center", "matchlist");
////        model.addAttribute("mlist", mateList);
//        return modelAndView;
//    }

}

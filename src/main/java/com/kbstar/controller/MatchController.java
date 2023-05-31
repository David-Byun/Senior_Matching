package com.kbstar.controller;

import com.kbstar.dto.*;

import com.kbstar.service.MatchService;
import com.kbstar.service.OrderMatchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class MatchController {

    @Autowired
    private final OrderMatchService orderMatchService;

    @Autowired
    private final MatchService matchService;

    public MatchController(OrderMatchService orderMatchService, MatchService matchService) {
//        @RequiredArgsConstructor 을 대체
        this.orderMatchService = orderMatchService;
        this.matchService = matchService;
    }

    String dir = "match/";

    @RequestMapping("/ordermatch")
    public String match(Model model, HttpSession session) {
        model.addAttribute("center", dir+"ordermatch");
        return "index";
    }

    @RequestMapping("/ordermatchimpl")
    public String ordermatchImpl(OrderMatch orderMatch, MatchSearch ms, HttpSession session, Model model) throws Exception {
//         ********** member회원가입 진행 후 하단의 세선 반영 추가 필요 **********
//        Member user = (Member) session.getAttribute("loginmember");
//        orderMatch.setMemberId(user.getId());

        orderMatch.setMemberId(202);
        orderMatchService.register(orderMatch);
        int omId = orderMatch.getId();
        List<Mate> mateList = orderMatchService.myMateByDate(ms);

        model.addAttribute("omId", omId);
        model.addAttribute("mlist", mateList);
        model.addAttribute("center",dir+"matchlist");
        return "index";
    }

    @RequestMapping("/matchoffer")
    public String matchoffer(Integer omId, HttpSession session,Integer mateId, Model model)throws Exception{

        log.info("====================="+orderMatchService.get(omId));
        OrderMatch om = orderMatchService.get(omId);
//        log.info("====================" + om.getStartDate());
        matchService.register(om);
        model.addAttribute("center",dir+"matchoffer");
        return "index";
    }
}

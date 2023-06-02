package com.kbstar.controller;

import com.kbstar.dto.*;

import com.kbstar.service.MatchService;
import com.kbstar.service.OrderMatchService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @RequestMapping("/order")
    public String order(Model model, HttpSession session) {
        model.addAttribute("center", dir+"order");
        return "index";
    }

    @RequestMapping("/orderimpl")
    public String orderImpl(OrderMatch orderMatch, MatchSearch ms, HttpSession session, Model model) throws Exception {
// ordermatch 신청서 입력 및 내용에 따라 맞는 mate 리스트 추출해서 보여주기

//        Member user = (Member) session.getAttribute("loginmember");
//        orderMatch.setMemberId(user.getId());

        int memberId = 1000;

        orderMatch.setMemberId(memberId);
        orderMatchService.register(orderMatch);
        int omId = orderMatch.getId();
        List<Mate> mateList = orderMatchService.myMateByDate(ms);

        model.addAttribute("omId", omId);
        model.addAttribute("mlist", mateList);
        model.addAttribute("center",dir+"mateselection");
        return "index";
    }

    @RequestMapping("/offer")
    public String offer(Integer omId, HttpSession session,Integer mateId, Model model)throws Exception{
        // 추천된 mate 리스트에서 하나를 선택해서 match 테이블에 데이터 입력
        OrderMatch om = orderMatchService.get(omId);
        Match match = new Match(om);
        matchService.register(match);
        match.setStatus("매칭대기");
        match.setMateId(mateId);
        matchService.update(match);
        model.addAttribute("center",dir+"offer");
        return "index";
    }


    @RequestMapping("/listformember")
    public String listformember(Model model, HttpSession session) throws Exception {

//        Member user = (Member) session.getAttribute("loginmember");
//        int memberId = user.getId();

        int memberId = 1000;

        List<Match> list = matchService.findByMemberId(memberId);
        model.addAttribute("mlist",list);
        model.addAttribute("center", dir+"listformember");
        return "index";
    }

    @RequestMapping("/listformate")
    public String listformate(Model model, HttpSession session) throws Exception {

//        Mate user = (Mate) session.getAttribute("loginmate");
//        int mateId = user.getId();
        int mateId = 2000;
        List<Match> list = matchService.findByMateId(mateId);

        model.addAttribute("mlist",list);
        model.addAttribute("center", dir+"listformate");
        return "index";
    }

    @RequestMapping("/yestomatch/{id}")
    public String yestomatch(Model model, HttpSession session,@PathVariable int id) throws Exception {
        System.out.println("id =====* " + id);
        Match match = matchService.get(id);
        match.setStatus("매칭완료");
        matchService.update(match);
        return "redirect:/listformate";
    }

    @RequestMapping("/payformatch/{id}")
    public String payformatch(Model model, HttpSession session,@PathVariable int id) throws Exception {
        System.out.println("id =====* " + id);
        Match match = matchService.get(id);
        match.setStatus("결제완료");
        matchService.update(match);
        return "redirect:/listformate";
    }



    }

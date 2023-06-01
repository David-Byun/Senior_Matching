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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
// ordermatch 신청서 입력 및 내용에 따라 맞는 mate 리스트 추출해서 보여주기

//        Member user = (Member) session.getAttribute("loginmember");
//        orderMatch.setMemberId(user.getId());

        Random random = new Random();
        int rdId = random.nextInt(1000);
        orderMatch.setMemberId(rdId);
        
        orderMatchService.register(orderMatch);
        int omId = orderMatch.getId();
        List<Mate> mateList = orderMatchService.myMateByDate(ms);

        model.addAttribute("omId", omId);
        model.addAttribute("mlist", mateList);
        model.addAttribute("center",dir+"matchlist");
        return "index";
    }

    @RequestMapping("/matchoffer")
    public String matchoffer(Integer omId, HttpSession session,Match match,Integer mateId, Model model)throws Exception{
        // 추천된 mate 리스트에서 하나를 선택해서 match 테이블에 데이터 입력
        OrderMatch om = orderMatchService.get(omId);
        matchService.register(om);
        match.setStatus("매칭대기");
        match.setMateId(mateId);
        matchService.update(match);
        model.addAttribute("center",dir+"matchoffer");
        return "index";
    }


    @RequestMapping("/ordermatchlist")
    public String ordermatchlist(Model model, HttpSession session) throws Exception {

//        Member user = (Member) session.getAttribute("loginmember");
//        int memberId = user.getId();

//        Random random = new Random();
//        int memberId = random.nextInt(1000);
        int memberId = 1000;

        List<Match> list = matchService.findByMemberId(memberId);
        model.addAttribute("mlist",list);
        model.addAttribute("center", dir+"ordermatchlist");
        return "index";
    }

    @RequestMapping("/matchofferlist")
    public String matchofferlist(Model model, HttpSession session) throws Exception {

//        Mate user = (Mate) session.getAttribute("loginmate");
//        int mateId = user.getId();

//        Random random = new Random();
//        int mateId = random.nextInt(1000);
        int mateId = 2000;
        List<Match> list = matchService.findByMateId(mateId);
        model.addAttribute("mlist",list);
        model.addAttribute("center", dir+"matchofferlist");
        return "index";
    }

    @RequestMapping("/yestomatchoffer/{id}")
    public String yestomatchoffer(Model model, HttpSession session,@PathVariable int id) throws Exception {
        System.out.println("id =====* " + id);
        Match match = matchService.get(id);
        match.setStatus("매칭완료");
        System.out.println("match.getStatus() = " + match.getStatus());
        System.out.println("match.getStatus() = " + match.getStartDate());
        matchService.update(match);
        System.out.println("match.getStatus() = " + match.getStatus());
        System.out.println("match.getStatus() = " + match.getStartDate());
        return "redirect:/matchofferlist";
    }

    }

package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Reserve;
import com.kbstar.mapper.OrderMatchMapper;
import com.kbstar.service.OrderMatchService;
import com.kbstar.service.ReserveService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/match")
public class MatchController {

    @Autowired
    private final OrderMatchService orderMatchService;

}

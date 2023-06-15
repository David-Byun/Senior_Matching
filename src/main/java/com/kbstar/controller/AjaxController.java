package com.kbstar.controller;

import com.kbstar.dto.Mate;
import com.kbstar.service.MateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api")
public class AjaxController {

    private final MateService mateService;

    @PostMapping("/profile")
    public Mate mateProfile(@RequestParam int id, Model model) throws Exception {
        Mate mate = mateService.findById(id);
        return mate;
    }
}

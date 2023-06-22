package com.kbstar.controller;

import com.kbstar.dto.*;
import com.kbstar.service.MatchService;
import com.kbstar.service.OrderMatchService;
import com.kbstar.util.PdfUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@Slf4j
public class MatchImplController {

    @Autowired
    private final OrderMatchService orderMatchService;

    @Autowired
    private final MatchService matchService;

    @Autowired
    PdfUtil pdfUtil;

    public MatchImplController(OrderMatchService orderMatchService, MatchService matchService) {
//        @RequiredArgsConstructor 을 대체
        this.orderMatchService = orderMatchService;
        this.matchService = matchService;
    }

    String dir = "match/";
    @PostMapping("/generatepdf")
    public Object generatePdf(MatchId id) throws Exception {
        System.out.println("id.getId() = " + id.getId());
        int objId = id.getId();
        Match obj = matchService.get(objId);
        pdfUtil.createPdf(obj);
        JSONObject success = new JSONObject();
        success.put("message", "success");
        return success;
    }

}

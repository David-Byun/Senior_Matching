package com.kbstar.Match;

import com.kbstar.dto.Match;
import com.kbstar.service.MatchService;
import com.kbstar.util.PdfUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class generatePdfTests {
    @Autowired
    MatchService service;
    @Autowired
    PdfUtil pdfServiceImpl;

    @Test
    void contextLoads() throws Exception {
        Match match = service.get(118);
        try{
            pdfServiceImpl.createPdf(match);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}

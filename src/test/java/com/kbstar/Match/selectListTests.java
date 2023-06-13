package com.kbstar.Match;

import com.kbstar.dto.Match;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class selectListTests {

    @Autowired
    MatchService service;
    @Test
    void contextLoads() throws Exception {

        int memberId = 1000;
        List<Match> list = service.findByMemberId(memberId);

        for (Match obj:list
             ) {
            log.info(String.valueOf(obj.getPayDate()));
        }
    }
}

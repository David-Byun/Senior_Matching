package com.kbstar.Match;

import com.kbstar.dto.Match;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class selectOneTests {

    @Autowired
    MatchService service;
    @Test
    void contextLoads() throws Exception {

        Match result = service.get(500);
            log.info("result ====================================================" +result.getStartDate());
        service.findByMemberId(1000);
        log.info("result ====================================================" +result.getStartDate());
    }
}

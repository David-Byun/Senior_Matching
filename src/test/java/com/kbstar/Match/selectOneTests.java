package com.kbstar.Match;

import com.kbstar.dto.Match;
import com.kbstar.dto.MatchSearch;
import com.kbstar.dto.Mate;
import com.kbstar.service.MatchService;
import com.kbstar.service.OrderMatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class selectOneTests {

    @Autowired
    MatchService service;
    @Test
    void contextLoads() throws Exception {

        Match result = service.get(500);
            log.info("result ====================================================" +result.getStartDate());
    }
}

package com.kbstar.Match;

import com.kbstar.dto.Match;
import com.kbstar.dto.OrderMatch;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class registerTests {

    @Autowired
    MatchService service;
    @Test
    void contextLoads() throws Exception {
        OrderMatch om = new OrderMatch(202, "20150101", "20150102", "요양", "강남구", "F", "19940531");
        Match match = new Match(om);
        service.register(match);
            log.info("result ====================================================" +match.getStartDate());
            match.setMateId(500);
            match.setStatus("매칭대기");
            service.update(match);
    }
}

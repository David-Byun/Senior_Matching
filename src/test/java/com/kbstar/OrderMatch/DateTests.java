package com.kbstar.OrderMatch;

import com.kbstar.dto.MatchSearch;
import com.kbstar.dto.Mate;
import com.kbstar.service.OrderMatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@SpringBootTest
class DateTests {

    @Autowired
    OrderMatchService orderMatchService;
    @Test
    void contextLoads() throws Exception {

        MatchSearch ms = new MatchSearch("2023-05-25", "2023-05-26");
        List<Mate> result = orderMatchService.myMateByDate(ms);
        for (Mate obj:result
             ) {
            log.info("result ====================================================" +obj.getName());
        }
    }
}

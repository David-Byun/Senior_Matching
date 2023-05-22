package com.kbstar.reserve;

import com.kbstar.dto.Reserve;
import com.kbstar.dto.Review;
import com.kbstar.service.ReserveService;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    ReserveService service;
    @Test
    void contextLoads() {
        Reserve test = new Reserve(101, 202);
        try {
            service.register(test);

            List<Reserve> result = service.get();
            log.info(result.toString());

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

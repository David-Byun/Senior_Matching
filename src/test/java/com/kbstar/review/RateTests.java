package com.kbstar.review;

import com.kbstar.dto.Review;
import com.kbstar.dto.ReviewRate;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@SpringBootTest
@Slf4j
class RateTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    ReviewService service;
    @Test
    void contextLoads() throws Exception {
        List<ReviewRate> list = service.rateAll();
        log.info(list.toString());
    }
}

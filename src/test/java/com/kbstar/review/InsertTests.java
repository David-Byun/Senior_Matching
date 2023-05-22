package com.kbstar.review;

import com.kbstar.dto.Member;
import com.kbstar.dto.Review;
import com.kbstar.service.MemberService;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    ReviewService service;
    @Test
    void contextLoads() {
        Review test = new Review(999, 888, "굿", "짱", 5);
        try {
            service.register(test);
            log.info("=================test================="+test.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

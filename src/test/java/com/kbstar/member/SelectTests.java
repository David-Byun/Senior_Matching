package com.kbstar.member;

import com.kbstar.dto.Member;
import com.kbstar.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class SelectTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    MemberService memberService;
    @Test
    void contextLoads() {
        try {
            memberService.get();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

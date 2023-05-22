package com.kbstar.member;

import com.kbstar.dto.Member;
import com.kbstar.service.MemberService;
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
    MemberService memberService;
    @Test
    void contextLoads() {
        Member test = new Member("bbb@naver.com","박말숙","11111");
        try {
            test.setPassword(encoder.encode(test.getPassword()));
            memberService.register(test);
            log.info("=================test================="+test.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

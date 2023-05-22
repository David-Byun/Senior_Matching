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
class SelectOneTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    MemberService memberService;
    @Test
    void contextLoads() {
        try {

            Member result = memberService.get("bbb@naver.com");
            log.info(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

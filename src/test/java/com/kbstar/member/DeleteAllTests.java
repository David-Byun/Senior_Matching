package com.kbstar.member;

import com.kbstar.dto.Member;
import com.kbstar.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@SpringBootTest
@Slf4j
class DeleteAllTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    MemberService service;
    @Test
    void contextLoads() throws Exception {
        List<Member> memberList = service.get();
        try {
            for (Member obj:memberList) {
                service.remove(obj.getMemberId());
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

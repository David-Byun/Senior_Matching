package com.kbstar.reserve;

import com.kbstar.dto.Reserve;
import com.kbstar.service.MemberService;
import com.kbstar.service.ReserveService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@Slf4j
@SpringBootTest
class SelectTests {
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    ReserveService service;
    @Test
    void contextLoads() {
        try {
            List<Reserve> result = service.get();
            log.info(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

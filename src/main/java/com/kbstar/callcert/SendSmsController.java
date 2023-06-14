package com.kbstar.callcert;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RequestMapping("/sendSMS")
@RestController
public class SendSmsController {

    @PostMapping
    public String sendSMS(String phoneNumber) {

        Random rand  = new Random(); //랜덤숫자 생성하기 !!
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
//        certifiedPhoneNumber.certifiedPhoneNumber(phoneNumber, numStr);
        return numStr;
    }
}

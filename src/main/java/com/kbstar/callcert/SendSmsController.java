package com.kbstar.callcert;

import lombok.RequiredArgsConstructor;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Random;

@RequestMapping("/sendSMS")
@RestController
@RequiredArgsConstructor
public class SendSmsController {

    private final SendSmsService sendSmsService;

    @PostMapping
    public String sendSMS(String phoneNumber) throws CoolsmsException {

        Random rand  = new Random(); //랜덤숫자 생성하기 !!
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        System.out.println("numStr = " + numStr);
        sendSmsService.certifiedPhoneNumber(phoneNumber, numStr);
        return numStr;
    }
}

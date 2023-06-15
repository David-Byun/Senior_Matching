package com.kbstar.callcert;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class SendSmsService {

    @Value("${coolsms.key}")
    String apiKey;

    @Value("${coolsms.secret}")
    String apiSecret;
    public void certifiedPhoneNumber(String phoneNumber, String numStr) throws CoolsmsException {

        String api_key = apiKey;
        String api_secret = apiSecret;
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<>();
        params.put("to", phoneNumber);
        params.put("from", "01024602729");
        params.put("type", "SMS");
        params.put("text", "휴대폰 인증번호를 확인하세요 : ["+numStr+"]");
        params.put("app_version", "test app 1.2"); // application name and version
        JSONObject obj = coolsms.send(params);
        System.out.println(obj.toString());

    }

}

package com.kbstar.callcert;

import com.google.firebase.messaging.Message;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class SendSmsService {
    public void certifiedPhoneNumber(String phoneNumber, String numStr) {

        String api_key = "###발급받은키";
        String api_secret = "##발급받은키입력";
//        Message coolsms = new Message(api_key, api_secret);


        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);
        params.put("from", "###본인의 휴대폰번호####");
        params.put("type", "SMS");
//        params.put("text", " + 작성할내용 "["+numStr+"]" +내용 ");
        params.put("app_version", "test app 1.2"); // application name and version
//        JSONObject obj = (JSONObject) coolsms.send(params);
//        System.out.println(obj.toString());



    }

}

package com.kbstar.controller;

import com.kbstar.dto.Msg;
import com.kbstar.util.ChatbotUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
public class ChatbotController {
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/chatbotme") // 특정 Id에게 전송
    public void chatbotme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws IOException {
        String target = msg.getSendid();
        String txt = msg.getContent1();
        //NCP Chatbot 연동.......
        String result = ChatbotUtil.chat(txt);
        msg.setContent1(result);
        template.convertAndSend("/chsend/"+target,msg);
    }
}

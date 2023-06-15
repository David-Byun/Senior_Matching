package com.kbstar.gpt;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat-gpt/question")
public class ChatGptController {
    private final ChatgptService chatGptService;
    @PostMapping
    public String sendQuestion(@RequestBody String question) {
        String result = chatGptService.sendMessage(question);
        log.info("========= result ========= {}", result);
        return chatGptService.sendMessage(question);
    }

}

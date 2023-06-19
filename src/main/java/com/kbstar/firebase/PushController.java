package com.kbstar.firebase;

import com.kbstar.dto.FCMNotificationRequestDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PushController {
    private final FCMNotificationService fcmNotificationService;

    @PostMapping("/notification")
    public String sendNotificationByToken(FCMNotificationRequestDto requestDto) {
        fcmNotificationService.sendNotificationByToken(requestDto);
        return "redirect:/marketing";
    }
}

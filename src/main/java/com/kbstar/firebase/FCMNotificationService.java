package com.kbstar.firebase;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.kbstar.dto.FCMNotificationRequestDto;
import com.kbstar.dto.FirebaseToken;
import com.kbstar.mapper.FirebaseMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
public class FCMNotificationService {

    private final FirebaseMessaging firebaseMessaging;
    private final FirebaseMapper firebaseMapper;

    public void sendNotificationByToken(FCMNotificationRequestDto requestDto) {

        List<FirebaseToken> allTokens = firebaseMapper.findAllChrome();

        for (FirebaseToken token : allTokens) {
            Notification notification = new Notification(requestDto.getTitle(), requestDto.getBody());

            Message message = Message.builder()
                    .setToken(token.getToken())
                    .setNotification(notification)
                    .build();

            try {
                firebaseMessaging.send(message);
            } catch (FirebaseMessagingException e) {
                log.info("=============에러 발생============={}", e.getMessage());
                throw new RuntimeException(e);
            }
        }
    }

}

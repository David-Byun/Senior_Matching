package com.kbstar.firebase;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;
import com.kbstar.dto.FirebaseToken;
import com.kbstar.dto.NotificationRequest;
import com.kbstar.mapper.FirebaseMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.concurrent.ExecutionException;

import static org.apache.velocity.tools.struts.StrutsUtils.getToken;

@Service
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseMapper firebaseMapper;
    public void register(FirebaseToken firebaseToken) {

        firebaseMapper.register(firebaseToken);
    }

    public Optional<FirebaseToken> findByToken(String token) {
        Optional<FirebaseToken> foundToken = firebaseMapper.findByToken(token);
        return foundToken;
    }

}

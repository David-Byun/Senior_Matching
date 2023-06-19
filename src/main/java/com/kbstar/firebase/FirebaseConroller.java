package com.kbstar.firebase;

import com.kbstar.dto.FirebaseToken;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping
public class FirebaseConroller {
    private final FirebaseService firebaseService;


    @PostMapping("/token")
    public void putToken(FirebaseToken firebaseToken) {
        Optional<FirebaseToken> byToken = firebaseService.findByToken(firebaseToken.getToken());
        if (byToken.isEmpty()) {
            firebaseService.register(firebaseToken);
        }
    }
}

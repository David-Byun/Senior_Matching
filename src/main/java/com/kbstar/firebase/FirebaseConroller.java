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
    public void putToken(@RequestParam String token) {
        Optional<FirebaseToken> byToken = firebaseService.findByToken(token);
        if (byToken.isPresent()) {
            if (byToken.get().getToken() == token) {
                firebaseService.register(token);
            }
        }
    }
}

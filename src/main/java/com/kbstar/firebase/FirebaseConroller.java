package com.kbstar.firebase;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping
public class FirebaseConroller {
    private final FirebaseService firebaseService;

    @PostMapping("/token")
    public void putToken(@RequestParam String token) {
        firebaseService.register(token);
    }

}

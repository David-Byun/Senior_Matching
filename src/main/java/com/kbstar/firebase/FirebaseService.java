package com.kbstar.firebase;

import com.kbstar.dto.FirebaseToken;
import com.kbstar.mapper.FirebaseMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseMapper firebaseMapper;
    public void register(String token) {

        firebaseMapper.register(token);
    }

    public Optional<FirebaseToken> findByToken(String token) {
        Optional<FirebaseToken> foundToken = firebaseMapper.findByToken(token);
        return foundToken;
    }

}

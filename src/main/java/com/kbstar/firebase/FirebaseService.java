package com.kbstar.firebase;

import com.kbstar.dto.FirebaseToken;
import com.kbstar.mapper.FirebaseMapper;
import lombok.RequiredArgsConstructor;
import org.apache.el.parser.Token;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseMapper firebaseMapper;
    public void register(String token) {
        firebaseMapper.register(token);
    }

    public List<FirebaseToken> getAllTokens() {
        firebaseMapper.getAll();

    }
}

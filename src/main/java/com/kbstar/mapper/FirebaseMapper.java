package com.kbstar.mapper;

import com.kbstar.dto.FirebaseToken;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface FirebaseMapper {
    void register(String token);

    Optional<FirebaseToken> findByToken(String token);
}

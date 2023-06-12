package com.kbstar.mapper;

import com.kbstar.dto.FirebaseToken;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FirebaseMapper {
    void register(String token);
    List<FirebaseToken> getAll();
}

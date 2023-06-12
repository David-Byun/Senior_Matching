package com.kbstar.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FirebaseMapper {
    void register(String token);
}

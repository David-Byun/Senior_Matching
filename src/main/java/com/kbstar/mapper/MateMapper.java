package com.kbstar.mapper;

import com.kbstar.dto.Mate;
import com.kbstar.dto.Member;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MateMapper extends ShopMapper<String, Mate> {
}

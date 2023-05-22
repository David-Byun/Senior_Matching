package com.kbstar.mapper;

import com.kbstar.dto.Item;
import com.kbstar.dto.Reserve;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReserveMapper extends ShopMapper<Integer,Reserve> {
    List<Item> findByUserId(int memberId);
}

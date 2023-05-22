package com.kbstar.mapper;

import com.kbstar.dto.Discount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DiscountMapper {
    Discount getDiscount(String code);
}

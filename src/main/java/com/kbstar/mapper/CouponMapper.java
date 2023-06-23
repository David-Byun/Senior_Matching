package com.kbstar.mapper;

import com.kbstar.dto.MyCouponDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CouponMapper {
    List<MyCouponDto> getMyCoupon(int id);
}

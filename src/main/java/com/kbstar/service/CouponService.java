package com.kbstar.service;

import com.kbstar.dto.MyCouponDto;
import com.kbstar.mapper.CouponMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CouponService {

    private final CouponMapper couponMapper;

    public List<MyCouponDto> getMyCoupon(int id) {
        return couponMapper.getMyCoupon(id);
    }

}

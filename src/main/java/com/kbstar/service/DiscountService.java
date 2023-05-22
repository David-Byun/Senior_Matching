package com.kbstar.service;

import com.kbstar.dto.Discount;
import com.kbstar.mapper.DiscountMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DiscountService {
    private final DiscountMapper mapper;

    public String getDiscount(String code) {
        Discount discount = mapper.getDiscount(code);
        return null;
    }
}

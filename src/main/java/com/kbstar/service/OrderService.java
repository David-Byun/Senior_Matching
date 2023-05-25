package com.kbstar.service;

import com.kbstar.dto.OrderMall;
import com.kbstar.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderMapper mapper;

    public void insert(OrderMall orderMall) {
        mapper.insert(orderMall);
    }

    public List<OrderMall> getOrder(int memberId) {
        return mapper.getOrder(memberId);
    }
}

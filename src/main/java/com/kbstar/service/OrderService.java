package com.kbstar.service;

import com.kbstar.dto.Order;
import com.kbstar.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderMapper mapper;

    public void insert(Order order) {
        mapper.insert(order);
    }

    public List<Order> getOrder(int memberId) {
        return mapper.getOrder(memberId);
    }
}

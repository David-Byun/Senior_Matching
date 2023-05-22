package com.kbstar.mapper;

import com.kbstar.dto.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMapper {

    void insert(Order order);

    List<Order> getOrder(int memberId);
}

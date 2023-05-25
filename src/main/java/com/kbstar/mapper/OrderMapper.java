package com.kbstar.mapper;

import com.kbstar.dto.OrderMall;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMapper {

    void insert(OrderMall orderMall);

    List<OrderMall> getOrder(int memberId);
}

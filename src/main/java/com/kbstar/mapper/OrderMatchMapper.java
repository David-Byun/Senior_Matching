package com.kbstar.mapper;

import com.kbstar.dto.MatchSearch;
import com.kbstar.dto.Mate;
import com.kbstar.dto.OrderMatch;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMatchMapper extends ShopMapper<Integer, OrderMatch> {
    List<OrderMatch> findByMemberId(int memberId);
    List<Mate> findByDate(MatchSearch ms);
}

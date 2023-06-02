package com.kbstar.mapper;

import com.kbstar.dto.Match;
import com.kbstar.dto.MatchSearch;
import com.kbstar.dto.Mate;
import com.kbstar.dto.OrderMatch;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MatchMapper extends ShopMapper<Integer, Match> {

    List<Match> findByMemberId(int memberId);
    List<Match> findByMateId(int mateId);
    void matchInserted(Match match);
}

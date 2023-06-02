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

    //1단계 ( status:매칭대기, id 부터 status 까지 )
    void matchInserted(Match match);
    //2단계 ( status:매칭완료 or 매칭취소(거절) )
    Match IsmatchOk(Integer k);
    //3단계 ( status:결제완료, )
    Match matchPaid(Integer k);
    //현재 매칭 단계 확인

}

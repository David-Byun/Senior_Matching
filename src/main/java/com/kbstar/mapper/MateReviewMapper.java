package com.kbstar.mapper;

import com.kbstar.dto.*;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MateReviewMapper extends ShopMapper<Integer, MateReview> {

    List<MateReview> search(MateReviewSearch rs);

    List<ReviewRate> rate(Integer k);
    List<ReviewRate> rateAll();

    List<MateReview> getByMateId(Integer k);
}

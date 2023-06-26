package com.kbstar.mapper;

import com.kbstar.dto.Mate;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.MateReviewAllDto;
import com.kbstar.dto.MateReviewDto;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MateMapper extends ShopMapper<String, Mate> {
    List<MateReviewDto> findByMateId(int mateId);

    Mate findById(int mateId);

    void register(MateReview mateReview);


    List<MateReviewAllDto> findAllMates();

    List<MateReviewAllDto> getAllMates(String orderKind);
}

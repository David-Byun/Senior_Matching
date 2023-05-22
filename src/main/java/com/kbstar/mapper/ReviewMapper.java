package com.kbstar.mapper;

import com.kbstar.dto.Review;
import com.kbstar.dto.ReviewRate;
import com.kbstar.dto.ReviewSearch;
import com.kbstar.frame.ShopMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReviewMapper extends ShopMapper<Integer, Review> {

    List<Review> search(ReviewSearch rs);

    List<ReviewRate> rate(Integer k);
    List<ReviewRate> rateAll();

    List<Review> getByItemId(Integer k);
}

package com.kbstar.service;


import com.kbstar.dto.ItemReview;
import com.kbstar.dto.ReviewRate;
import com.kbstar.dto.ReviewSearch;
import com.kbstar.mapper.ReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReviewService implements ShopService<Integer, ItemReview>{

    @Autowired
    ReviewMapper reviewMapper;

    @Override
    public void register(ItemReview itemReview) throws Exception {
        reviewMapper.insert(itemReview);
    }

    @Override
    public void remove(Integer k) throws Exception {
        reviewMapper.delete(k);
    }

    @Override
    public void modify(ItemReview itemReview) throws Exception {
        reviewMapper.update(itemReview);
    }

    @Override
    public ItemReview get(Integer k) throws Exception {
        return reviewMapper.select(k);
    }

    @Override
    public List<ItemReview> get() throws Exception {
        return reviewMapper.selectall();
    }

    public List<ItemReview> search(ReviewSearch rs) throws Exception {
        return reviewMapper.search(rs);
    }

    public List<ReviewRate> rate(Integer k) throws Exception{
        return reviewMapper.rate(k);
    }

    public List<ReviewRate> rateAll() throws Exception{
        return reviewMapper.rateAll();
    }

    public List<ItemReview> getByItemId(Integer k) throws  Exception{
        return reviewMapper.getByItemId(k);
    }
}

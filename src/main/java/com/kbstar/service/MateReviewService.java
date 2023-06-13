package com.kbstar.service;


import com.kbstar.dto.*;
import com.kbstar.mapper.MateReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MateReviewService implements ShopService<Integer, MateReview>{

    @Autowired
    MateReviewMapper matereviewMapper;

    @Override
    public void register(MateReview mateReview) throws Exception {
        matereviewMapper.insert(mateReview);
    }

    @Override
    public void remove(Integer k) throws Exception {
        matereviewMapper.delete(k);
    }

    @Override
    public void modify(MateReview mateReview) throws Exception {
        matereviewMapper.update((MateReview) matereviewMapper);
    }

    @Override
    public MateReview get(Integer k) throws Exception {
        return matereviewMapper.select(k);
    }

    @Override
    public List<MateReview> get() throws Exception {
        return matereviewMapper.selectall();
    }

    public List<MateReview> search(MateReviewSearch ms) throws Exception {
        return matereviewMapper.search(ms);
    }

    public List<ReviewRate> rate(Integer k) throws Exception{
        return matereviewMapper.rate(k);
    }

    public List<ReviewRate> rateAll() throws Exception{
        return matereviewMapper.rateAll();
    }

    public List<MateReview> getByMateId(Integer k) throws  Exception{
        return matereviewMapper.getByMateId(k);
    }
}

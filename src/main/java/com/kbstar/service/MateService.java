package com.kbstar.service;

import com.kbstar.dto.Mate;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.MateReviewAllDto;
import com.kbstar.dto.MateReviewDto;
import com.kbstar.mapper.MateMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MateService implements ShopService<String, Mate>{

    @Autowired
    MateMapper mapper;

    @Override
    public void register(Mate mate) throws Exception {
        mapper.insert(mate);
    }

    @Override
    public void remove(String k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Mate mate) throws Exception {
        mapper.update(mate);
    }

    @Override
    public Mate get(String k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Mate> get() throws Exception {
        return mapper.selectall();
    }

    public List<MateReviewDto> findByMateId(int mateId) {
        return mapper.findByMateId(mateId);
    }


    public Mate findById(int mateId) {
        return mapper.findById(mateId);
    }

    public void registerMateReview(MateReview mateReview) {
        mapper.register(mateReview);
    }

    public List<MateReviewAllDto> findAllMates() {
        return mapper.findAllMates();
    }

    public List<MateReviewAllDto> getAllMates(String orderKind) {
        return mapper.getAllMates(orderKind);
    }

}

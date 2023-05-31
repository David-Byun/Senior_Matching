package com.kbstar.service;

import com.kbstar.dto.Match;
import com.kbstar.dto.OrderMatch;
import com.kbstar.mapper.MatchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MatchService {
    @Autowired
    MatchMapper mapper;

    public void register(OrderMatch om) throws Exception {
        mapper.matchInserted(om);
    }

    public Match IsmatchOk(Integer k) throws Exception {
        return mapper.IsmatchOk(k);
    }
    public Match matchPaid(Integer k) throws Exception {
        return mapper.matchPaid(k);
    }


    public Match get(Integer k) throws Exception {
        return mapper.select(k);
    }


    public List<Match> get() throws Exception {
        return mapper.selectall();
    }
}

package com.kbstar.service;

import com.kbstar.dto.Match;
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

    public void register(Match match) throws Exception {
        mapper.matchInserted(match);
    }
    public void update(Match match) throws Exception{
        mapper.update(match);
    }
    public Match get(Integer k) throws Exception {
        return mapper.select(k);
    }
    public List<Match> get() throws Exception {
        return mapper.selectall();
    }
    public List<Match> findByMemberId(Integer k) throws Exception {
        return mapper.findByMemberId(k);
    }
    public List<Match> findByMateId(Integer k) throws Exception {
        return mapper.findByMateId(k);
    }
}

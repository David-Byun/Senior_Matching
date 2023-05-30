package com.kbstar.service;

import com.kbstar.dto.MatchSearch;
import com.kbstar.dto.Mate;
import com.kbstar.dto.OrderMatch;
import com.kbstar.mapper.OrderMatchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Slf4j
public class OrderMatchService implements ShopService<Integer, OrderMatch> {


    @Autowired
    public OrderMatchMapper orderMatchMapper;
    @Override
    public void register(OrderMatch orderMatch) throws Exception {
        orderMatchMapper.insert(orderMatch);
    }

    @Override
    public void remove(Integer k) throws Exception {
        orderMatchMapper.delete(k);
    }

    @Override
    public void modify(OrderMatch orderMatch) throws Exception {
        orderMatchMapper.update(orderMatch);
    }

    @Override
    public OrderMatch get(Integer k) throws Exception {
        return orderMatchMapper.select(k);
    }

    @Override
    public List<OrderMatch> get() throws Exception {
        return orderMatchMapper.selectall();
    }

    public List<OrderMatch> myOrderMatch(Integer k) throws Exception{
        return orderMatchMapper.findByMemberId(k);
    }

    public List<Mate> myMateByDate(MatchSearch ms)throws Exception{
        return orderMatchMapper.findByDate(ms);
    }
}

package com.kbstar.service;


import com.kbstar.dto.Item;
import com.kbstar.dto.Reserve;
import com.kbstar.mapper.ReserveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReserveService implements ShopService<Integer, Reserve> {
    @Autowired
    ReserveMapper reserveMapper;

    @Override
    public void register(Reserve reserve) throws Exception {
        reserveMapper.insert(reserve);
    }

    @Override
    public void remove(Integer k) throws Exception {
        reserveMapper.delete(k);
    }

    @Override
    public void modify(Reserve reserve) throws Exception {
    }

    @Override
    public Reserve get(Integer k) throws Exception {
        return reserveMapper.select(k);
    }

    @Override
    public List<Reserve> get() throws Exception {
        return reserveMapper.selectall();
    }

    public List<Item> myReserve(int memberId) throws Exception {
        return reserveMapper.findByUserId(memberId);
    }

}

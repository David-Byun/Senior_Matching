package com.kbstar.service;

import com.kbstar.dto.Reserve;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ShopService<K,V> {
    /*
    * 등록 및 가입 진행
    * argument : Object
    * return : null
    * */
    @Transactional
    public void register(V v) throws Exception;
    @Transactional
    public void remove(K k) throws Exception;
    @Transactional
    public void modify(V v) throws Exception;

//    @Transactional 는 데이터 조작이 없는 select는 제외 대신
    @Transactional( readOnly = true )
    public V get(K k) throws Exception;

    @Transactional( readOnly = true )
    public List<V> get() throws Exception;

}

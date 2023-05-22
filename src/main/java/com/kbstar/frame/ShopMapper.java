package com.kbstar.frame;


import java.util.List;

public interface ShopMapper<K,V> {

//    테스트 입니다.
    public void insert(V v) throws Exception;

    public void delete(K k) throws Exception;

    public void update(V v) throws Exception;

    public V select(K k) throws Exception;

    public List<V> selectall() throws Exception;


}

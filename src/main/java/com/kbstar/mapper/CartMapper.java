package com.kbstar.mapper;

import com.kbstar.dto.Cart;
import com.kbstar.dto.Item;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CartMapper {
    void addCart(Cart cart);

    List<Item> findByUserId(int memberId);

    List<Cart> findByItemId(int itemId);

    void increaseCnt(int memberId, int itemId);

    void deleteItem(int memberId, int itemId);

    void deleteCart(int memberId);
    Cart getCart(int memberId, int itemId);
}

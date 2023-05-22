package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Item;
import com.kbstar.exception.ErrorCode;
import com.kbstar.exception.ItemException;
import com.kbstar.exception.UserException;
import com.kbstar.mapper.ItemMapper;
import jdk.jshell.spi.ExecutionControl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ItemService {

    private final ItemMapper itemMapper;

    public Page<Item> getAllItems(int pageNo){
        PageHelper.startPage(pageNo, 10);
        Page<Item> allItems = itemMapper.getAllItems();
        if (allItems.isEmpty()) {
            throw new ItemException(ErrorCode.ITEM_NOT_FOUND);
        }
        return allItems;
    }

    public Item getItemById(Integer id) {
        Item item = itemMapper.getItemById(id).orElseThrow(() -> new UserException(ErrorCode.ITEM_NOT_FOUND));
        return item;
    }
}

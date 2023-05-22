package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface ItemMapper {
    Page<Item> getAllItems();

    Optional<Item> getItemById(Integer id);
}

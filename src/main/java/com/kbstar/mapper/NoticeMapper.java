package com.kbstar.mapper;

import com.kbstar.dto.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    List<Notice> getAllNotice();
}

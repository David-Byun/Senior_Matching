package com.kbstar.service;

import com.kbstar.dto.Notice;
import com.kbstar.mapper.NoticeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeMapper noticeMapper;

    public List<Notice> getAllNotice() {
        return noticeMapper.getAllNotice();
    }

}

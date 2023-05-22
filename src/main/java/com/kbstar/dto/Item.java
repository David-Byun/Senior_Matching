package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private int id;
    private int registerId; // 0516 효선 추가 (rate 별점 기능 수정 중 item 샘플 데이터에 포함되어 있어 추가, 문제 시 알려주세요)
    private String name;
    private String img;
    private String content;
    private int price;
    private String itemSize;
    private String color;
    private int isValid;
    private Date rdate;
    private Date udate;

    //mybatis
    private int cnt;
}

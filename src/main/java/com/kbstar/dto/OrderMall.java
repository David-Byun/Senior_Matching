package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderMall {
    private int id;
    private int memberId;
    private int price;
    private Date rdate;
    private String name;
    private String zipcode;
    private String addr;
    private String tel;
    private int cnt;

}

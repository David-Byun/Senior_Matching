package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Order {
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

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
public class OrderMatch {
    private int id;
    private int memberId;
    private Date startDate;
    private Date endDate;
    private String service;
    private String area;
    private String objectGender;
    private String objectBirth;
    private Date Rdate;
}

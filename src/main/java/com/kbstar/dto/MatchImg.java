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
public class MatchImg {
    private int id;
    private int memberId;
    private int mateId;
    private String startDate;
    private String endDate;
    private String service;
    private String area;
    private String objectGender;
    private String objectBirth;
    private String status;
    private int price;
    private String payment;
    private Date payDate;
    private String mateImg;
    private String mateName;
    private int mateRate;
}

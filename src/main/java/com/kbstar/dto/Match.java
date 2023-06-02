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
public class Match {
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
    private String payDate;


    public Match(OrderMatch om) {
        this.memberId = om.getMemberId();
        this.startDate = om.getStartDate();
        this.endDate = om.getEndDate();
        this.service = om.getService();
        this.area = om.getService();
        this.objectGender = om.getObjectGender();
        this.objectBirth = om.getObjectBirth();
    }
}

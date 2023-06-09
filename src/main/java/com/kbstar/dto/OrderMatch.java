package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderMatch {
    private int id;
    private int memberId;
    private String startDate;
    private String endDate;
    private String service;
    private String area;
    private String objectGender;
    private String objectBirth;
    private String Rdate;

    public OrderMatch(int memberId, String startDate, String endDate, String service, String area, String objectGender, String objectBirth) {
        this.memberId = memberId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.service = service;
        this.area = area;
        this.objectGender = objectGender;
        this.objectBirth = objectBirth;
    }
}

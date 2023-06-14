package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MateReviewAllDto {
    private int id;
    private int avgRate;
    private int sum;
    private String name;
    private String email;
    private int jobPeriod;
    private String license;
    private String img;
    private String area;

}

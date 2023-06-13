package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MateReview {
    private int id;
    private int rate;
    private String content;
    private String img;
    private int mateId;
    private int memberId;
}

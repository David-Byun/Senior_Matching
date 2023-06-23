package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MyCouponDto {
    private int id;
    private int memberId;
    private int num;
    private int amount;
    private String admComment;

    public MyCouponDto(int memberId, int num, int amount, String admComment) {
        this.memberId = memberId;
        this.num = num;
        this.amount = amount;
        this.admComment = admComment;
    }
}

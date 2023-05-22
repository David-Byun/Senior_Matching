package com.kbstar.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reserve {
    private int id;
    private int memberId;
    private int itemId;

    public Reserve(int memberId, int itemId) {
        this.memberId = memberId;
        this.itemId = itemId;
    }
}

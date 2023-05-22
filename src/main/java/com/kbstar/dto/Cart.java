package com.kbstar.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Cart {
    private int id;
    private int memberId;
    private int itemId;
    private int cnt;
    private LocalDateTime rdate;

    public Cart(int userId, int itemId, int cnt) {
        this.memberId = userId;
        this.itemId = itemId;
        this.cnt = cnt;
    }
}

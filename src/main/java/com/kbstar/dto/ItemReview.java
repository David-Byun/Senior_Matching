package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemReview {
    private int id;
    private int userId;
    private int itemId;
    private String title;
    private String review;
    private int rate;

    public ItemReview(int userId, int itemId, String title, String review, int rate) {
        this.userId = userId;
        this.itemId = itemId;
        this.title = title;
        this.review = review;
        this.rate = rate;
    }
}

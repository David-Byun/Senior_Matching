package com.kbstar.dto;

import lombok.*;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemReview {
    private int id;
    private int memberId;
    private String name;
    private int itemId;
    private String title;
    private String review;
    private int rate;

    public ItemReview(int id, int memberId, String name, int itemId, String title, String review, int rate) {
        this.id = id;
        this.memberId = memberId;
        this.name = name;
        this.itemId = itemId;
        this.title = title;
        this.review = review;
        this.rate = rate;
    }
}

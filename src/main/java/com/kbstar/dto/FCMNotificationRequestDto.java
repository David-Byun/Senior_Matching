package com.kbstar.dto;

import lombok.*;

@Getter
@NoArgsConstructor
@Setter
@AllArgsConstructor
public class FCMNotificationRequestDto {
    private String title;
    private String body;
    private String image;

    @Builder
    public FCMNotificationRequestDto(String title, String body) {
        this.title = title;
        this.body = body;
    }
}
package com.kbstar.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
public class NotificationRequest {
    private String title;
    private String message;

    @Builder
    public NotificationRequest(String title, String message) {
        this.title = title;
        this.message = message;
    }
}

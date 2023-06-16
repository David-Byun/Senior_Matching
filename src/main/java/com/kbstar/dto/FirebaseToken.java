package com.kbstar.dto;

import lombok.*;
import org.joda.time.DateTime;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FirebaseToken {
    private int id;
    private String token;
    private String web;
    private DateTime rdate;

    public FirebaseToken(String token, String web) {
        this.token = token;
        this.web = web;
    }
}

package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joda.time.DateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FirebaseToken {
    private int id;
    private String token;
    private DateTime rdate;
}

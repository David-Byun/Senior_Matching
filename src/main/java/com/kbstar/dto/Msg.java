package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Msg {
    private String sendid;
    private String receiveid;
    private String content1;
}

package com.kbstar.dto;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cal {
    private String title;
    private String start;
    private String end;
    private String div;
    private String url;
}
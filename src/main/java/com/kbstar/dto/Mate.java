package com.kbstar.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Mate {
    private int id;
    private String email;
    private String name;
    private String password;
    private String img;
    private String area;
    private int jobPeriod;
    private String license;
    private String valid;

    public Mate(String email, String name, String password,String area, int jobPeriod, String license) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.area = area;
        this.jobPeriod = jobPeriod;
        this.license = license;
    }

    @Builder
    public Mate(String email, String name, String password) {
        this.email = email;
        this.name = name;
        this.password = password;
    }
}

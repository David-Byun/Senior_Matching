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

    public Mate(int id, String name, String img, int jobPeriod, String license) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.jobPeriod = jobPeriod;
        this.license = license;
    }
}

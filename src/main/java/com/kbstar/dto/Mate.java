package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
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

    private MultipartFile imgName;

    public Mate(int id, String email, String name, String password, String img, String area, int jobPeriod, String license) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.img = img;
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

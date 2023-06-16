package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@ToString
public class Member {
    private int id;
    @Email
    @NotEmpty
    private String email;
    @NotEmpty
    private String name;
    private String tel;
    private String password;
    private String disease;
    private String birth;
    private String addr;
    private Date rdate;
    private int valid;

    @Builder
    public Member(String email, String name, String password) {
        this.email = email;
        this.name = name;
        this.password = password;
    }

    public Member(int id, String email, String name, String password, String birth, String addr,int valid, String tel) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.birth = birth;
        this.addr = addr;
        this.valid = valid;
        this.tel = tel;
    }
}

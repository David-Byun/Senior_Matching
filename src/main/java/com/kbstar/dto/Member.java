package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {
    private int id;
    @Email
    @NotEmpty
    private String email;
    @NotEmpty
    private String name;

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
}

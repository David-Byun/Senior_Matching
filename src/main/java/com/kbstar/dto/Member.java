package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
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
    private String memberId;
    @NotEmpty
    private String name;
    @Size(min=5, max=10, message="최소 5개 최대 10개 입니다.")
    @NotEmpty
    private String password;
    private Date rdate;
    private int valid;

    public Member(String memberId, String name, String password) {
        this.memberId = memberId;
        this.name = name;
        this.password = password;
    }
}

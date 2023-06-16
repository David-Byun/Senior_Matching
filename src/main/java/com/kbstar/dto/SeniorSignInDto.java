package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SeniorSignInDto {

    @Email
    @NotEmpty
    private String email;
    @NotEmpty
    private String name;

    private String password;
    private String birth;
    private String tel;
    private String postcode;
    private String address;
    private String detailAddress;
    private String extraAddress;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .name(name)
                .password(password)
                .birth(birth)
                .tel(tel)
                .addr(postcode + "/" + address + "/" + detailAddress)
                .build();
    }


}
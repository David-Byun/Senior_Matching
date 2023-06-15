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
    private String disease;
    private String birth;
    private String sample6_postcode;
    private String sample6_address;
    private String sample6_detailAddress;
    private String sample6_extraAddress;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .name(name)
                .password(password)
                .disease(disease)
                .birth(birth)
                .addr(sample6_postcode + "/" + sample6_address + "/" + sample6_detailAddress + "/" + sample6_extraAddress)
                .build();
    }


}
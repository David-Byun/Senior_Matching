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
    private String addr;
    private String mainAddress;
    private String detailAddress;
    private String extraAddress;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .name(name)
                .password(password)
                .disease(disease)
                .birth(birth)
                .addr(mainAddress + "/" + detailAddress + "/" + extraAddress)
                .build();
    }


}
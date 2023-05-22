package com.kbstar.exception;

import lombok.Getter;

@Getter
public class ErrorResponse {

    private final String responseCode;
    private final String responseMessage;

    public ErrorResponse(ErrorCode code) {
        this.responseCode = code.getResponseCode();
        this.responseMessage = code.getResponseMessage();
    }
}

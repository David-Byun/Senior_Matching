package com.kbstar.exception;

import lombok.Getter;

@Getter
public class ChatException extends RuntimeException {

    private final ErrorCode code;

    public ChatException(ErrorCode code) {
        this.code = code;
    }
}

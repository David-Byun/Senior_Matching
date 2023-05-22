package com.kbstar.exception;

import lombok.Getter;

@Getter
public class ContentException extends RuntimeException{
    private final ErrorCode code;

    public ContentException(ErrorCode code) {
        this.code = code;
    }
}

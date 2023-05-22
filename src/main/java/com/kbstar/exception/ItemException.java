package com.kbstar.exception;

import lombok.Getter;

@Getter
public class ItemException extends RuntimeException{
    private final ErrorCode code;

    public ItemException(ErrorCode code) {
        this.code = code;
    }
}

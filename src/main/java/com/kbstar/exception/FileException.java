package com.kbstar.exception;

import lombok.Getter;

@Getter
public class FileException extends RuntimeException{

    private final ErrorCode code;

    public FileException(ErrorCode code) {
        this.code = code;
    }
}

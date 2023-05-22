package com.kbstar.exception;

import lombok.Getter;

@Getter
public class UserException extends RuntimeException {
    private final ErrorCode code;

    /**
     * Constructs a new runtime exception with {@code null} as its
     * detail message.  The cause is not initialized, and may subsequently be
     * initialized by a call to {@link #initCause}.
     */
    public UserException(ErrorCode code) {
        this.code = code;
    }
}

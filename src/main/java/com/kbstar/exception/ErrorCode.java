package com.kbstar.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    //Common
    SENIOR_NOT_FOUND("S0001", "요청하신 유저를 찾을 수 없어요!"),
    CONTENT_LIST_NOT_FOUND( "C0001", "컨텐츠 리스트가 없어요!"),
    CONTENT_ONE_NOT_FOUND("C0002", "해당 컨텐츠가 없어요!"),
    CHATROOM_NOT_FOUND( "C0003", "해당 채팅방을 조회할 수 없어요"),
    PASSWORD_NOT_VALID("L0001", "비밀번호가 틀려요!"),
    FILE_UPLOAD_FAIL("F0001", "파일 업로드가 실패했어요"),
    SERVER_ERROR("S0001", "에러가 발생했어요"),
    ITEM_NOT_FOUND("I0001", "요청하신 상품을 찾을 수 없어요");

    private final String responseCode;
    private final String responseMessage;

}

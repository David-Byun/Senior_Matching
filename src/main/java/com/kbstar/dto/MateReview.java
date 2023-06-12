package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.joda.time.DateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MateReview {
    private int id;
    private int rate;
    private String content;
    private int mateId;
    private int memberId;
    private DateTime rdate;

    public MateReview(int id, int rate, String content, int mateId, int memberId) {
        this.id = id;
        this.rate = rate;
        this.content = content;
        this.mateId = mateId;
        this.memberId = memberId;
    }
}

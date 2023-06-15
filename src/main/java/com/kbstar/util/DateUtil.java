package com.kbstar.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String getDateStr(String str){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        date.setDate(date.getDate()+1);
        String datestr = format.format(date);
        return datestr;
    }
}
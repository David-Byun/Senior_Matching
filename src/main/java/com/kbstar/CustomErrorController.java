package com.kbstar;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomErrorController {
    // Exception 발생 시 동작되는 클래스
    // springboot에서 기본적으로 제공
    @ExceptionHandler(Exception.class)
    public String except(Exception e, Model model){
        e.printStackTrace();
        model.addAttribute("msg",e.getMessage());
        model.addAttribute("center","error/error_page1");
        return "index";
    }



}
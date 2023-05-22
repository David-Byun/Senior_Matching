package com.kbstar.controller;

import com.kbstar.dto.Question;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;

@Controller
public class MailController {

    @Value("${mail}")
    String mail;

    @Value("${password}")
    String pwd;

    @RequestMapping("/sendEmail")
    public String sendEmail(HttpServletRequest request, HttpServletResponse response, Question question) throws Exception{

        System.out.println("mail = " + mail);
        System.out.println("pwd = " + pwd);

        //메일 관련 정보
        String host = "smtp.naver.com";
        final String username = mail; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
        final String password = pwd; //네이버 이메일 비밀번호를 작성
        int port=465;

        //메일 내용
        String recipient = mail; //메일을 발송할 이메일 주소를 기재해 줍니다.
        String subject = question.getName() + " : 제품 관련 문의 드립니다.";    //메일 발송시 제목을 작성
        String body = question.getMsg(); //메일 발송시 내용 작성

        Properties props = System.getProperties();

        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug

        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(mail));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);

        return "redirect:/";
    }
}

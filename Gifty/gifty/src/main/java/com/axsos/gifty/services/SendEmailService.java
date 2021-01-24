package com.axsos.gifty.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

@Service
public class SendEmailService {

    @Autowired
    private JavaMailSender javaMailSender;
    public void sendEmail(String to, String body, String topic){
        System.out.println("**before sending ");
        SimpleMailMessage simpleMailMessage= new SimpleMailMessage();
        simpleMailMessage.setTo(to);
      simpleMailMessage.setSubject(topic);
      simpleMailMessage.setText(body);
      javaMailSender.send(simpleMailMessage);
        System.out.println("**after sending **");

    }

}
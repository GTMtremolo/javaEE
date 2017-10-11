package com.controller;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail implements Runnable{

    String to, header, content;
    
    final String user = "crustyratspam@gmail.com";
    final String pass = "CrustyRatSpam!";

    public SendMail() {
    }

    public SendMail(String to, String header, String content) {
        this.to = to;
        this.header = header;
        this.content = content;
    }
    
    //Return true if email is sent
    public boolean send(String to, String header, String content) {
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(header);
            message.setText(content);

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            return false;
        }

    }

    @Override
    public void run() {
        send(to, header, content);
    }
}

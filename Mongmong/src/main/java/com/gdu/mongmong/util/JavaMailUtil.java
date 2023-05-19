package com.gdu.mongmong.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@PropertySource(value={"classpath:application.properties"})
@Component
public class JavaMailUtil {

  @Autowired
  private Environment env;
  
  public void sendJavaMail(String to, String title, String content) {
    
    try {
      
      Properties properties = new Properties();
      properties.put("mail.smtp.host", env.getProperty("spring.mail.host"));
      properties.put("mail.smtp.port", env.getProperty("spring.mail.port"));
      properties.put("mail.smtp.auth", env.getProperty("spring.mail.properties.mail.smtp.auth"));
      properties.put("mail.smtp.starttls.enable", env.getProperty("spring.mail.properties.mail.smtp.starttls.enable"));
     
      MimeMessage message = new MimeMessage(Session.getInstance(properties, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(env.getProperty("spring.mail.username"), env.getProperty("spring.mail.password"));
        }
      }));

      message.setFrom( new InternetAddress(env.getProperty("spring.mail.username"), "사이트관리자") );
      message.setRecipient( Message.RecipientType.TO, new InternetAddress(to) );
      message.setSubject(title);
      message.setContent(content, "text/html; charset=UTF-8");
      
      Transport.send(message);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
  }
  
}
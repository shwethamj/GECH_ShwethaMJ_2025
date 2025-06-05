package com.springSecurityDemo.springSecurityDemo.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
	
	private JavaMailSender mailSender;
	private TemplateEngine templateEngine;
	
	public EmailService(JavaMailSender mailSender, TemplateEngine templateEngine) {
		super();
		this.mailSender = mailSender;
		this.templateEngine = templateEngine;
	}

	public void sendEmail(String to, String email, String password, String name ) throws MessagingException {
		Context context = new Context();
		
		context.setVariable("name",name);
		context.setVariable("username",email);
		context.setVariable("password",password);
		 // Construct login URL (adjust base URL as needed)
	    String loginUrl = "http://localhost:8080/login";  // or your domain: https://myapp.com/login
	    context.setVariable("loginUrl", loginUrl);
		
		String htmlbody =  templateEngine.process("registration_email", context);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message,true);
		
		helper.setTo(to);
		helper.setSubject("Your Account Login Detail");
		helper.setText(htmlbody,true);
		
		mailSender.send(message);
	}
}
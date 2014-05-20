package bephit.model;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  
import org.apache.commons.lang.StringUtils;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Component("emailSender")
public class EmailSender {

	
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngine velocityEngine;

	public static final String TEMPLATE_NAME = "sample_template.vm";

	
	public void sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject) {
		
		sendEmail(toEmailAddresses, fromEmailAddress, subject, null, null);
	}

	public void sendEmailWithAttachment(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String attachmentPath, final String attachmentName) {
		sendEmail(toEmailAddresses, fromEmailAddress, subject, attachmentPath,
				attachmentName);
	}

	private void sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String attachmentPath, final String attachmentName)
	{
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception 
			{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				String participantName = "Deemsys123"; // select from databse
				String fromName = "Suresh"; // get from Mail settings Table
				model.put("toName", participantName);
				model.put("fromName", fromName);
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME, "UTF-8",
						model);
				message.setText(body, true);
				if (!StringUtils.isBlank(attachmentPath)) 
				{
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);
				}
			}
		};
		this.mailSender.send(preparator);
	}

	// Password Sending starts
	public void password_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String Firstname, final String Username, final String Password) {
		/*Properties props=new Properties();
		  Session session = Session.getDefaultInstance(props,  
				   new javax.mail.Authenticator() {  
				   protected PasswordAuthentication getPasswordAuthentication() {  
				   return new PasswordAuthentication("ashaswathi15@gmail.com","santhadu");//change accordingly  
				   }  
				  });  	*/	 
		 /* props.put("mail.smtp.host", "smtp.gmail.com");  
		  props.put("mail.smtp.socketFactory.port", "465");  
		  props.put("mail.smtp.socketFactory.class",  
		            "javax.net.ssl.SSLSocketFactory");  
		  props.put("mail.smtp.auth", "true");  
		  props.put("mail.smtp.port", "465");*/  
		// System.out.println("hello123");
		pswd_sendEmail(toEmailAddresses, fromEmailAddress, subject, Firstname,
				Username, Password);
	}

	private void pswd_sendEmail(final String toEmailAddresses,
			final String fromEmailAddress, final String subject,
			final String Firstname, final String Username, final String Password) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{
			public void prepare(MimeMessage mimeMessage) throws Exception
			{    
				
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage,
						true);
				message.setTo(toEmailAddresses);
				message.setFrom(new InternetAddress(fromEmailAddress));
				message.setSubject(subject);
				// Pass values to Template
				Map<String, String> model = new HashMap<String, String>();
				model.put("firstName", Firstname);
				model.put("userName", Username);
				model.put("password", Password);
				model.put("fromName","Deemsys");
				
				
				// Pass values to Template End
				String body = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "templates/" + TEMPLATE_NAME, "UTF-8",
						model);
				message.setText(body, true);
				/*if (!StringUtils.isBlank(attachmentPath)) {
					FileSystemResource file = new FileSystemResource(
							attachmentPath);
					message.addAttachment(attachmentName, file);*/
			
			}
		};
		
		this.mailSender.send(preparator);
	}
	// Password Sending ends

}

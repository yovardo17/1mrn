package co.edu.ufps.imrmtp.capaNegocio.utilidades;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
	
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;
 
	public static void generateAndSendEmail(String subject, String emailTo, String emailCC, String msg) 
			throws AddressException, MessagingException {
 
		// Step1		
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");		
 
		// Step2		
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
		
		
		if (emailCC!=null){
			if (!emailCC.equals("")) generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(emailCC));
		}
		
		generateMailMessage.setSubject(subject);
		String emailBody = msg;
		generateMailMessage.setContent(emailBody, "text/html; charset=UTF-8" );		
		generateMailMessage.setFrom(new InternetAddress("info@foristom.org"));
 
		// Step3		
		Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		//transport.connect("smtp.gmail.com", "foristom@gmail.com", "5ImrmpT5");
		transport.connect("mail.foristom.org", "info@foristom.org", "5ImrmpT5");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}
}

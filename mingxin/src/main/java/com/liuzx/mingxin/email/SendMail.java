package com.liuzx.mingxin.email;

import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Component;

@Component
public class SendMail {
	public static String userName = "mingxincaifu@163.com";
	public static String code = "mingxin8cai8fu88";
	private Session session;

	@PostConstruct
	public void init() {
		if (session != null) {
			return;
		}
		Properties prop = new Properties();
		prop.put("mail.host", "smtp.163.com");
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.auth", true);
		// 使用java发送邮件5步骤
		// 1.创建sesssion
		session = Session.getInstance(prop);
		// 开启session的调试模式，可以查看当前邮件发送状态
		session.setDebug(true);
	}

	public void sendEmail(Message msg) throws MessagingException {
		// 2.通过session获取Transport对象（发送邮件的核心API）
		Transport ts = session.getTransport();
		// 3.通过邮件用户名密码链接
		ts.connect(userName, code);
		// 4.创建邮件
		// 5.发送电子邮件
		ts.sendMessage(msg, msg.getAllRecipients());
	}

	// public static MimeMessage createSimpleMail(Session session) throws
	// AddressException, MessagingException {
	// // 创建邮件对象
	// MimeMessage mm = new MimeMessage(session);
	// // 设置发件人
	// mm.setFrom(new InternetAddress(userName));
	// // 设置收件人
	// mm.setRecipient(Message.RecipientType.TO, new
	// InternetAddress("1071040755@qq.com"));
	// // 设置抄送人
	// // mm.setRecipient(Message.RecipientType.CC, new
	// // InternetAddress(userName));
	//
	// mm.setSubject("密码重置");
	// mm.setContent("您好！\r\n \t 您的重置密码是dsfsdf,30分钟内有效，请您登录铭鑫财富修改密码！",
	// "text/html;charset=utf-8");
	// return mm;
	// }

	public MimeMessage createResetPwMail(String newPw, String toEmail) throws AddressException, MessagingException {
		// 创建邮件对象
		MimeMessage mm = new MimeMessage(session);
		// 设置发件人
		mm.setFrom(new InternetAddress(userName));
		// 设置收件人
		mm.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		// 设置抄送人
		// mm.setRecipient(Message.RecipientType.CC, new
		// InternetAddress(userName));

		mm.setSubject("重置密码-铭鑫财富");

		// MimeMultipart类是一个容器类，包含MimeBodyPart类型的对象
		Multipart mainPart = new MimeMultipart();
		MimeBodyPart messageBodyPart = new MimeBodyPart();// 创建一个包含HTML内容的MimeBodyPart
		// 设置HTML内容
		messageBodyPart.setContent(createHtmlMessage(newPw), "text/html; charset=utf-8");
		mainPart.addBodyPart(messageBodyPart);
		mm.setContent(mainPart);
		return mm;
	}

	public String createHtmlMessage(String newPw) {
		StringBuffer demo = new StringBuffer();
		demo.append(
				"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">")
				.append("<html>").append("<head>")
				.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">")
				.append("<title>重置密码</title>").append("<style type=\"text/css\">")
				.append(".test{font-family:\"Microsoft Yahei\";font-size: 18px;}").append("</style>").append("</head>")
				.append("<body>").append("<span>您好</span>").append("<br>").append("&nbsp;&nbsp;&nbsp;&nbsp;")
				.append("您的重置密码是 ").append(newPw).append(",30分钟内有效且只能使用登录一次，请您登录<a href=\"http://mx168.sh.cn\">铭鑫财富</a>修改密码！")
				.append("</body>").append("</html>");
		return demo.toString();
	}
}

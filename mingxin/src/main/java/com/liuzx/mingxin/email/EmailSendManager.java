package com.liuzx.mingxin.email;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.*; 
import javax.mail.internet.*;
import javax.activation.*;
//import javax.activation.DataHandler;
//import javax.activation.FileDataSource;
//import javax.mail.Authenticator;
//import javax.mail.BodyPart;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Multipart;
//import javax.mail.Part;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Store;
//import javax.mail.Transport;
//import javax.mail.internet.AddressException;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMultipart;

/**
 * 简单发送邮件
 * 
 */
public class EmailSendManager {
	// 邮件通信会话
	Session session;
	// 邮件接收处理对象
	Store store;

	// 连接邮件发送的账号与密码
	String username = "1071040755@qq.com";
	private String passwd = "star@1215";
	private String receiveHost = "imap.qq.com";
	private String sendHost = "smtp.qq.com";

	/**
	 * 邮件配置参数和连接接收邮件服务器
	 * 
	 * @throws MessagingException
	 */
	private void init() throws MessagingException {
		Properties properties = new Properties();
		// 设置发送和接收协议
		properties.put("mail.transport.protocal", "smtp");
		properties.put("mail.store.protocal", "imap");
		// 设置ssl的端口
		properties.setProperty("mail.imap.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.setProperty("mail.imap.socketFactory.fallback", "false");
		properties.setProperty("mail.imap.port", "993");
		properties.setProperty("mail.imap.socketFactory.port",
				"993");
		/*
						 * properties.put("mail.imap.port", "993");
						 * properties.put("mail.smtp.port", "465");
						 */
		// smtp认证
		properties.put("mail.smtp.auth", "true");
		// 设置发送和接收处理类
		properties.put("mail.transport.class", "com.sun.mail.smtp.SMTPTransport");
		properties.put("mail.imap.class", "com.sun.mail.imap.IMAPStore");
		// 设置发送邮件服务器
		properties.put("mail.smtp.host", sendHost);
		// 获取邮件通信会话
		Authenticator auth = new MailAuthenticator();
		session = Session.getDefaultInstance(properties, auth);
		session.setDebug(true);
//		// 获取接收邮件对象
//		store = session.getStore("imap");
//		// 连接接收邮件服务器
//		store.connect(receiveHost, null, null);
	}

	/**
	 * 关闭邮件接收服务器
	 * 
	 * @throws MessagingException
	 * @throws IOException
	 */
	public void close() throws MessagingException, IOException {
		store.close();

	}

	/**
	 * 创建一封简单的邮件
	 * 
	 * @param fromAddr
	 * @param toAddr
	 * @return
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public Message createResetPwMessage(String toAddr,String userNickName,String newPw) throws AddressException, MessagingException {
		// 建立一封邮件
		MimeMessage message = new MimeMessage(session);
		// 设置发送者和接收者
		message.setFrom(new InternetAddress(username));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddr));
		// 设置主题
		message.setSubject("铭鑫财富--重置密码");
		// 设置日期
		message.setSentDate(new Date(System.currentTimeMillis()));
		StringBuffer sb = new StringBuffer();
		sb.append("亲爱的"+userNickName);
//		sb.append("/r/n");
		sb.append("   您的重置密码是 "+newPw+ ",有效时间30分钟，请尽快登录并修改密码！");
//		sb.append("/r/n");
		// 设置正文
		message.setText(sb.toString());
		return message;
	}

	/**
	 * 创建一封简单的邮件
	 * 
	 * @param fromAddr
	 * @param toAddr
	 * @return
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public Message createSimpleMessage(String fromAddr, String toAddr) throws AddressException, MessagingException {
		// 建立一封邮件
		MimeMessage message = new MimeMessage(session);
		// 设置发送者和接收者
		message.setFrom(new InternetAddress(fromAddr));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddr));
		// 设置主题
		message.setSubject("使用JAVAMAIL发送邮件");
		// 设置日期
		message.setSentDate(new Date(System.currentTimeMillis()));
		// 设置正文
		message.setText("今天是2015-6-12，离职一个周，准备下一份工作");
		return message;
	}

	public Message createComplexMessage(String fromAddr, String toAddr) throws AddressException, MessagingException {
		// 建立一封邮件
		MimeMessage message = new MimeMessage(session);
		// 设置发送者和接收者
		message.setFrom(new InternetAddress(fromAddr));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddr));
		// 设置主题
		message.setSubject("使用JAVAMAIL发送邮件");
		// 设置日期
		message.setSentDate(new Date(System.currentTimeMillis()));
		// 设置正文
		Multipart mp = createMultiPart();
		message.setContent(mp);
		return message;
	}

	/**
	 * 创建复杂的正文
	 * 
	 * @return
	 * @throws MessagingException
	 */
	private Multipart createMultiPart() throws MessagingException {
		// TODO Auto-generated method stub
		Multipart multipart = new MimeMultipart();

		// 第一块
		BodyPart bodyPart1 = new MimeBodyPart();
		bodyPart1.setText("创建复杂的邮件，此为正文部分");
		multipart.addBodyPart(bodyPart1);

		// 第二块 以附件形式存在
		MimeBodyPart bodyPart2 = new MimeBodyPart();
		// 设置附件的处理器
		FileDataSource attachFile = new FileDataSource(ClassLoader.getSystemResource("attach.txt").getFile());
		DataHandler dh = new DataHandler(attachFile);
		bodyPart2.setDataHandler(dh);
		bodyPart2.setDisposition(Part.ATTACHMENT);
		bodyPart2.setFileName("test");
		multipart.addBodyPart(bodyPart2);

		return multipart;
	}

	/**
	 * 发送邮件
	 * 
	 * @param message
	 * @throws MessagingException
	 */
	public void send(Message message) throws MessagingException {
		Transport.send(message);
	}

	public static void main(String[] args) {
		EmailSendManager sendReceiveMessage = new EmailSendManager();
		try {
			sendReceiveMessage.init();
//			Message message = sendReceiveMessage.createSimpleMessage(sendReceiveMessage.username,
//					sendReceiveMessage.username);
//			sendReceiveMessage.send(message);
			
			Message message = sendReceiveMessage.createResetPwMessage(sendReceiveMessage.username,
					"用户1","jsdfds23");
			sendReceiveMessage.send(message);
			// message=sendReceiveMessage.createComplexMessage(sendReceiveMessage.username,
			// sendReceiveMessage.username);
			// sendReceiveMessage.send(message);
			// sendReceiveMessage.receive();
			sendReceiveMessage.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * 登陆认证
	 * 
	 * @author u1
	 * 
	 */
	private class MailAuthenticator extends Authenticator {

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			// TODO Auto-generated method stub
			return new PasswordAuthentication(username, passwd);
		}

	}
}

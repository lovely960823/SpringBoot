package com.base.spring.project.task;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTasks {

	@Autowired
	private JavaMailSender javaMailSender;
	/**
	 * 每天晚上八点执行
	 * @throws MessagingException 
	 */
	@Scheduled(cron = "0 0 20 * * ?")
    public void reportCurrentTime() throws MessagingException {
			MimeMessage maMessage = javaMailSender.createMimeMessage();
			// 不添加，文件名会不正常显示
			MimeMessageHelper helper = new MimeMessageHelper(maMessage, true, "utf-8");
			helper.setFrom("374905102@qq.com");//表明是谁发送的
			helper.setTo("2224812429@qq.com");//说明这是发送给谁的
			helper.setSubject("签到");//邮件的标题
			helper.setText("赶快去支付宝扫码签到");//邮件的内容内容
			javaMailSender.send(maMessage);
    }
	/**
	 * 每天上午八点半执行
	 * @throws MessagingException 
	 */
	@Scheduled(cron = "0 30 8 * * ?")
    public void reportCurrentTime1() throws MessagingException {
			MimeMessage maMessage = javaMailSender.createMimeMessage();
			// 不添加，文件名会不正常显示
			MimeMessageHelper helper = new MimeMessageHelper(maMessage, true, "utf-8");
			helper.setFrom("374905102@qq.com");//表明是谁发送的
			helper.setTo("374905102@qq.com");//说明这是发送给谁的
			helper.setSubject("签到");//邮件的标题
			helper.setText("赶快去支付宝扫码签到");//邮件的内容内容
			javaMailSender.send(maMessage);
    }
}

package com.base.spring.project.controller.protal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QctiveMqController {

	@Autowired
	private JmsMessagingTemplate jmsMessagingTemplate;
	
	/**
	 * 不注释掉，一直打印日志
	 */
	/*@RequestMapping("/sendMessage")
	public void sendMessage() {
		String text="哈哈哈哈";
		jmsMessagingTemplate.convertAndSend("des", text);//发送消息
	}
	
	@RequestMapping("/sendMessageMap")
	public void sendMessageMap() {
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("key1", "111");
		map.put("key2", "2222");
		jmsMessagingTemplate.convertAndSend("des1", map);//发送消息
	}*/
}

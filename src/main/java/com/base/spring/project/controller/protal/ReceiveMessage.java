package com.base.spring.project.controller.protal;

import java.util.Map;

import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

@Component
public class ReceiveMessage {

	/**
	 * 接收消息  
	 * @param text
	 */
	/*@JmsListener(destination="des")
	public void receive(String text) {
		System.out.println("我是activeMq发送接收过来的消息"+text);
	}
	
	@JmsListener(destination="des1")
	public void receiveMap(Map map) {
		System.out.println("我是activeMq发送接收过来的消息"+map);
	}
	*/
	
}

package com.base.spring.project.controller.protal;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.RestController;

/**
 * Redis实现文章点赞的思路
 * 2019-01-06
 * @author ljw
 *
 */
@RestController
public class DzRedisController {

	@Autowired
	private StringRedisTemplate redisTemplate;
	
	
	/**
	 * 点一次，点过就取消，没有就增加
	 * @param noteId
	 * @param userId
	 */
	public void dz(Integer noteId,Integer userId) {
		
		Boolean flag = redisTemplate.opsForSet().isMember("noteId:"+noteId, userId+"");//判断该key里面是否包含这个userId，包含说明点过
		if(flag) {
			redisTemplate.opsForSet().remove("noteId:"+noteId, userId+"");//取消店在哪
		}else {
			redisTemplate.opsForSet().add("noteId:"+noteId, userId+"");//点赞
		}
		Long size = redisTemplate.opsForSet().size("noteId:"+noteId);//获取某个文章的总赞数
		Set<String> userIds = redisTemplate.opsForSet().members("noteId:"+noteId);//获取该key的所有值，点赞该文章的所有人的ID
	}
}

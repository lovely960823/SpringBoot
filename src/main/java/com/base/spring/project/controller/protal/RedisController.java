package com.base.spring.project.controller.protal;

import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.spring.project.model.Redis;

@RestController
public class RedisController {

	@Resource//这里使用autowired会报错
	private RedisTemplate<String, Object> redisTemplate;
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 利用postman 将一个对象存入Redis
	 * @param model
	 */
	@PostMapping("/setData")
	public void set(@RequestBody Redis model) {
		System.out.println("进来了*****************");
		redisTemplate.opsForValue().set("mymodel", model);
	}
	
	/**
	 * 获取该对象
	 */
	@GetMapping("/getData/{key}")   //key=mymodel
	public Redis get(@PathVariable("key") String key) {
		System.out.println("获取对象值"+(Redis)redisTemplate.opsForValue().get(key));
		return (Redis)redisTemplate.opsForValue().get(key);
	}
	
	/**
	 * 获取指定key=name的值
	 * @return
	 */
	@GetMapping("/getKey")
	public String getKey() {
		redisTemplate.opsForValue().set("stringValue","bbb");  
		System.out.println("获取key值"+(String)redisTemplate.opsForValue().get("stringValue"));
		return (String)redisTemplate.opsForValue().get("stringValue");
	}
	
	/**
	 * stringRedisTemplate的使用
	 * @return
	 */
	@RequestMapping("/redisGetKey")
	public String stringRedisTemplate() {
		stringRedisTemplate.opsForValue().set("name", "小刘",10,TimeUnit.SECONDS);//存入redis缓存，并设置10秒的过期时间
		return stringRedisTemplate.opsForValue().get("name");
	}
}

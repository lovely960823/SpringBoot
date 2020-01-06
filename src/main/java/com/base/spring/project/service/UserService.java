package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;

public interface UserService {

	//保存用户
	int save(User user);
	
	/**
	 * 根据用户传入的条件查找
	 * @param user
	 * @return
	 */
	User findUserByT(User user);

	/**
	 * 获取用户列表信息
	 * @param resultPage
	 * @param user
	 * @return
	 */
	ResultPage<User> findAllUser(ResultPage<User> resultPage, User user);

	List<User> findAll();

	User findUserByOpenId(String openId);
}

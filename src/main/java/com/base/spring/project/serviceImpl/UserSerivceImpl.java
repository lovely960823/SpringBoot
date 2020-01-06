package com.base.spring.project.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.base.spring.project.mapper.UserMapper;
import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class UserSerivceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 保存用户信息
	 */
	@Override
	public int save(User user) {
		int i= userMapper.insert(user);
		return i;
	}
	
	/**
	 * 根据用户条件查询
	 */
	@Override
	public User findUserByT(User user) {
		User u = userMapper.selectOne(user);
		return u;
	}

	/**
	 * 获取用户列表信息
	 */
	@Override
	public ResultPage<User> findAllUser(ResultPage<User> resultPage, User user) {
		PageHelper.startPage(resultPage.getPage(),resultPage.getLimit());
		PageHelper.orderBy("id asc");
		Example example = new Example(User.class);
		Criteria criteria= example.createCriteria();
		if(!StringUtils.isEmpty(user.getName())) {
			criteria.andLike("name", "%"+user.getName()+"%");
		}
		//List<User> list = userMapper.select(user);
		List<User> list = userMapper.selectByExample(example);
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		resultPage.setData(list);
		resultPage.setCount(pageInfo.getTotal());//鎬昏褰曟暟
		resultPage.setTotalPage(pageInfo.getPages());//鎬婚〉鏁�
		return resultPage;
	}

	@Override
	public List<User> findAll() {
		List<User> list = userMapper.selectAll();
		return list;
	}

	@Override
	public User findUserByOpenId(String openId) {
		User user = userMapper.selectByOpenid(openId);
		return user;
	}

}

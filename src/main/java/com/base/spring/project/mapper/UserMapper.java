package com.base.spring.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.base.spring.project.model.User;

@Mapper
public interface UserMapper extends tk.mybatis.mapper.common.Mapper<User>{

	//@Select("select * from user where id=1 ")
	User findUserById(int i);

	@Select("select * from user where openid=#{openId} ")
	User selectByOpenid(String openId);

}

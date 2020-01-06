package com.base.spring.project.mapper;

import org.apache.ibatis.annotations.Select;

import com.base.spring.project.model.RoleUser;

import tk.mybatis.mapper.common.Mapper;

@org.apache.ibatis.annotations.Mapper
public interface RoleUserMapper extends Mapper<RoleUser> {

	@Select("select MAX(id) from role_user")
	int selectMaxId();

}

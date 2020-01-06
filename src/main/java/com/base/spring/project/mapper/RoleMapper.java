package com.base.spring.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.spring.project.model.Role;

import tk.mybatis.mapper.common.Mapper;

@org.apache.ibatis.annotations.Mapper
public interface RoleMapper extends Mapper<Role> {

	int saveMore(@Param("map")Map<String, Object> map);

}

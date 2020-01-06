package com.base.spring.project.service;

import java.util.List;
import java.util.Map;

import com.base.spring.project.model.Role;

public interface RoleService {

	int deleteByUid(Integer userId);

	int saveMore(Map<String, Object> map);

	List<Role> findByUid(Integer id);


}

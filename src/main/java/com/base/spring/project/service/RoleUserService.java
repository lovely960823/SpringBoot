package com.base.spring.project.service;

import com.base.spring.project.model.RoleUser;

public interface RoleUserService {

	int save(RoleUser ru);

	RoleUser findByUid(Integer userId);

	void deleteByUid(Integer userId);

	int findMaxId();

}

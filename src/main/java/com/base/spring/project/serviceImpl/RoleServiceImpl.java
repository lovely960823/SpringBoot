package com.base.spring.project.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.RoleMapper;
import com.base.spring.project.model.Role;
import com.base.spring.project.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapepr;

	@Override
	public int deleteByUid(Integer userId) {
		Role r= new Role();
		r.setUid(userId);
		int i = roleMapepr.delete(r);
		return i;
	}

	@Override
	public int saveMore(Map<String, Object> map) {
		int i = roleMapepr.saveMore(map);
		return i;
	}

	@Override
	public List<Role> findByUid(Integer id) {
		Role role = new Role();
		role.setUid(id);
		List<Role> list = roleMapepr.select(role);
		return list;
	}
}

package com.base.spring.project.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.RoleUserMapper;
import com.base.spring.project.model.RoleUser;
import com.base.spring.project.service.RoleUserService;

@Service
@Transactional
public class RoleUserServiceImpl implements RoleUserService {

	@Autowired
	private RoleUserMapper roleUserMapper;
	@Override
	public int save(RoleUser ru) {
		int i = roleUserMapper.insertSelective(ru);
		return i;
	}
	@Override
	public RoleUser findByUid(Integer userId) {
		RoleUser r = new RoleUser();
		r.setUid(userId);
		RoleUser ru = roleUserMapper.selectOne(r);
		return ru;
	}
	@Override
	public void deleteByUid(Integer userId) {
		RoleUser ru= new RoleUser();
		ru.setUid(userId);
		roleUserMapper.delete(ru);
	}
	@Override
	public int findMaxId() {
		int maxId = roleUserMapper.selectMaxId();
		return maxId;
	}

}

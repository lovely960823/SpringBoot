package com.base.spring.project.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.GuanzMapper;
import com.base.spring.project.model.Guanz;
import com.base.spring.project.service.GuanzService;

@Service
@Transactional
public class GuanzServiceImpl implements GuanzService {

	@Autowired
	private GuanzMapper guanzMapper;

	@Override
	public Guanz findByUid(Integer userId) {
		Guanz g =new Guanz();
		g.setUid(userId);
		Guanz guanz = guanzMapper.selectOne(g);
		return guanz;
	}

	@Override
	public int save(Guanz guanz) {
		int i = guanzMapper.insertSelective(guanz);
		return i;
	}
}

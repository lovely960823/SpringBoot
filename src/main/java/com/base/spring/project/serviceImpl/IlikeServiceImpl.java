package com.base.spring.project.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.IlikeMapper;
import com.base.spring.project.model.Ilike;
import com.base.spring.project.service.IlikeService;

import tk.mybatis.mapper.entity.Example;

@Service
@Transactional
public class IlikeServiceImpl implements IlikeService {

	@Autowired
	private IlikeMapper ilikeMapper;

	@Override
	public Ilike findByNid(Integer noteId) {
		Ilike i= new Ilike();
		i.setNid(noteId);
		Ilike ilike = ilikeMapper.selectOne(i);
		return ilike;
	}

	@Override
	public int save(Ilike like) {
		int i = ilikeMapper.insertSelective(like);
		return i;
	}
}

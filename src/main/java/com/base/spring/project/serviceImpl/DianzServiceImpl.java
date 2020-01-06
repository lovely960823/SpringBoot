package com.base.spring.project.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.DianzMapper;
import com.base.spring.project.model.Dianz;
import com.base.spring.project.service.DianzService;

@Service
@Transactional
public class DianzServiceImpl implements DianzService {

	@Autowired
	private DianzMapper dianzMapper;

	@Override
	public Dianz findByNidAndUid(Integer noteId, Integer userId) {
		Dianz d = new Dianz();
		d.setNid(noteId);
		d.setUid(userId);
		Dianz dianz= dianzMapper.selectOne(d);
		return dianz;
	}

	@Override
	public int save(Dianz dianz) {
		int i = dianzMapper.insertSelective(dianz);
		return i;
	}

	@Override
	public int getCount(Integer id) {
		Dianz dianz = new Dianz();
		dianz.setNid(id);
		int count = dianzMapper.selectCount(dianz);
		return count;
	}

	
}

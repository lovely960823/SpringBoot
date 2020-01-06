package com.base.spring.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.base.spring.project.mapper.ViewsMapper;
import com.base.spring.project.model.Views;
import com.base.spring.project.service.ViewsService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class ViewsServiceImpl implements ViewsService {

	@Autowired
	private ViewsMapper viewsMapper;

	@Override
	public Views findByTime(String today) {
		Views views = new Views();
		views.setTime(today);
		Views v = viewsMapper.selectOne(views);
		return v;
	}

	@Override
	public void update(Views views) {
		viewsMapper.updateByPrimaryKeySelective(views);
	}

	@Override
	public void save(Views v1) {
		viewsMapper.insertSelective(v1);
	}

	@Override
	public List<Views> findViewsData(String start, String end) {
		Example example =new Example(Views.class);
		Criteria createCriteria = example.createCriteria();
		if(!StringUtils.isEmpty(start)) {
			createCriteria.andGreaterThanOrEqualTo("time", start);
		}
		if(!StringUtils.isEmpty(end)) {
			createCriteria.andLessThanOrEqualTo("time", end);
		}
		List<Views> list = viewsMapper.selectByExample(example);
		return list;
	}
}

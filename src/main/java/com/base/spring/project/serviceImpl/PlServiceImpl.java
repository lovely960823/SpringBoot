package com.base.spring.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.PlMapper;
import com.base.spring.project.model.Pl;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.PlService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
@Transactional
public class PlServiceImpl implements PlService {

	@Autowired
	private PlMapper plMapper;

	@Override
	public int save(Pl pl) {
		int i = plMapper.insertSelective(pl);
		return i;
	}

	@Override
	public List<Pl> findAllPl(Integer id) {
		List<Pl> list = plMapper.selectPlAndUser(id);
		return list;
	}

	@Override
	public int getCount(Integer id) {
		Pl pl =new Pl();
		pl.setNid(id);
		int count = plMapper.selectCount(pl);
		return count;
	}

	@Override
	public ResultPage<Pl> findAllAjax(ResultPage<Pl> resultPage, Pl pl) {
		PageHelper.startPage(resultPage.getPage(),resultPage.getLimit());
		PageHelper.orderBy("create_time desc");
		List<Pl> list = plMapper.selectPlAndUser(pl.getNid());
		PageInfo<Pl> pageInfo = new PageInfo<Pl>(list);
		resultPage.setData(list);
		resultPage.setCount(pageInfo.getTotal());
		resultPage.setTotalPage(pageInfo.getPages());
		return resultPage;
	}

	@Override
	public int deleteById(Integer id) {
		int i = plMapper.deleteById(id);
		return i;
	}
}

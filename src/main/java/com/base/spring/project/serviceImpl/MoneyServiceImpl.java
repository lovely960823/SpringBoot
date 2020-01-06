package com.base.spring.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.base.spring.project.mapper.MoneyMapper;
import com.base.spring.project.model.Money;
import com.base.spring.project.service.MoneyService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class MoneyServiceImpl implements MoneyService {

	@Autowired
	private MoneyMapper moneyMapper;

	@Override
	public Money findByTime(Money m) {
		Money money = moneyMapper.selectOne(m);
		return money;
	}

	@Override
	public int update(Money money) {
		int i = moneyMapper.updateByPrimaryKeySelective(money);
		return i;
	}

	@Override
	public int save(Money m1) {
		int i = moneyMapper.insertSelective(m1);
		return i;
	}

	@Override
	public List<Money> findMoneyData(String start, String end) {
		Example example =new Example(Money.class);
		Criteria createCriteria = example.createCriteria();
		if(!StringUtils.isEmpty(start)) {
			createCriteria.andGreaterThanOrEqualTo("time", start);
		}
		if(!StringUtils.isEmpty(end)) {
			createCriteria.andLessThanOrEqualTo("time", end);
		}
		List<Money> list = moneyMapper.selectByExample(example);
		return list;
	}
}

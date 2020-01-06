package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.Money;

public interface MoneyService {

	Money findByTime(Money m);

	int update(Money money);

	int save(Money m1);

	List<Money> findMoneyData(String start, String end);

}

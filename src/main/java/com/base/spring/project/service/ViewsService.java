package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.Views;

public interface ViewsService {

	Views findByTime(String today);

	void update(Views views);

	void save(Views v1);

	List<Views> findViewsData(String start, String end);

}

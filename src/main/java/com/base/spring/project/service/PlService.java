package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.Pl;
import com.base.spring.project.page.ResultPage;

public interface PlService {

	int save(Pl pl);

	List<Pl> findAllPl(Integer id);

	int getCount(Integer id);

	ResultPage<Pl> findAllAjax(ResultPage<Pl> resultPage, Pl pl);

	int deleteById(Integer id);

}

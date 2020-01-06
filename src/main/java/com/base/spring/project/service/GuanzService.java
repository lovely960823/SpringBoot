package com.base.spring.project.service;

import com.base.spring.project.model.Guanz;

public interface GuanzService {

	Guanz findByUid(Integer userId);

	int save(Guanz guanz);

}

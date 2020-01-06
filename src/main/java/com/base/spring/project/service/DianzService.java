package com.base.spring.project.service;

import com.base.spring.project.model.Dianz;

public interface DianzService {

	Dianz findByNidAndUid(Integer noteId, Integer userId);

	int save(Dianz dianz);

	int getCount(Integer id);


}

package com.base.spring.project.service;

import com.base.spring.project.model.Ilike;

public interface IlikeService {

	Ilike findByNid(Integer noteId);

	int save(Ilike like);

}

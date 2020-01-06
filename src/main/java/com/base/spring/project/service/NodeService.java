package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.Node;

public interface NodeService {

	List<Node> findAll();

	List<Node> findAllNode();

	List<Node> findAllMyNode(Integer id);



}

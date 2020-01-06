package com.base.spring.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.spring.project.mapper.NodeMapper;
import com.base.spring.project.model.Node;
import com.base.spring.project.service.NodeService;

@Service
@Transactional
public class NodeServiceImpl implements NodeService {

	@Autowired
	private NodeMapper nodeMapper;

	/**
	 * 所有的
	 */
	@Override
	public List<Node> findAll() {
		List<Node> list = nodeMapper.selectAll();
		return list;
	}

	/**
	 * Ztree读取的
	 */
	@Override
	public List<Node> findAllNode() {
		List<Node> list = nodeMapper.findAllNode();
		return list;
	}

	/**
	 * 每个人对应的
	 */
	@Override
	public List<Node> findAllMyNode(Integer id) {
		List<Node> list = nodeMapper.findAllMyNode(id);
		return list;
	}

}

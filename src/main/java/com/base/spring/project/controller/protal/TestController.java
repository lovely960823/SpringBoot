package com.base.spring.project.controller.protal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Node;
import com.base.spring.project.service.NodeService;

@Controller
public class TestController extends BaseController {

	@Autowired
	private NodeService nodeService;
	
	@RequestMapping("/mytest")
	public String testController() {
		return "protal/test/test";
	}
	
	@RequestMapping("/ZtreeTest")
	public String ZtreeTestController() {
		return "protal/test/ztree";
	}
	
	
	@RequestMapping("/myNodeData")
	@ResponseBody
	public List<Node> myNodeData(){
		List<Node> list = nodeService.findAllNode();
		return list;
	}
}

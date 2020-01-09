package com.base.spring.project.controller.back;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Node;
import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.NodeService;
import com.base.spring.project.service.UserService;

@Controller
@RequestMapping("/back/user")
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	@Autowired
	private NodeService nodeService;
	
	/**
	 * 获取用户列表信息
	 * @param resultPage
	 * @param user
	 * @return
	 */
	@RequestMapping("/toUserList")
	public String userList(ResultPage<User> resultPage,User user,HttpServletRequest request) {
		ResultPage<User> result = userService.findAllUser(resultPage,user);
		request.setAttribute("result",result);
		return "admin/user/user_list";
	}
	
	/**
	 * 帖子列表
	 * @return
	 */
	@RequestMapping("/noteList")
	public String toNodeList() {
		return "admin/note/note_list";
	}
	
	/**
	 * 前台连接到后台管理界面
	 * @return
	 */
	@RequestMapping("/myself")
	public String myself() {
		//List<Node> nodeList = nodeService.findAll();//读取所有菜单
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		List<Node> nodeList = nodeService.findAllMyNode(user.getId());//读取自己应有的权限
		this.setAttribute("nodeList", nodeList);
		return "index/index";
	}
	
}

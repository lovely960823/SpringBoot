package com.base.spring.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.spring.project.model.Node;
import com.base.spring.project.model.Note;
import com.base.spring.project.model.User;
import com.base.spring.project.model.Views;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.NodeService;
import com.base.spring.project.service.NoteService;
import com.base.spring.project.service.ViewsService;

@Controller
public class IndexController extends BaseController{

	@Autowired
	private NodeService nodeService;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private ViewsService viewsService;
	
	/**
	 * 首页配置  访问跳转到首页
	 * 读取到所有的菜单功能
	 * @return
	 */
	@RequestMapping("/")
	public String index(HttpServletRequest request,ResultPage<Note> resultPage,Note note) {
		//每访问一次首页，获取当前时间，根据时间判定是哪一天  如果当天数据存在 ，就增加访问量，否则就添加当天数据
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(d);
		Views views = viewsService.findByTime(today);
		if(views!=null) {
			views.setCounts(views.getCounts()+1);
			viewsService.update(views);
		}else {
			Views v1 = new Views();
			v1.setTime(today);
			v1.setCounts(1);
			viewsService.save(v1);
		}
		ResultPage<Note> result = noteService.findAllNote(resultPage,note);
		request.setAttribute("result",result);
		return "protal/note/note_list";
	}
	
	@RequestMapping("/index_v1")
	public String indexV1() {
		User user = (User) this.getRequest().getSession().getAttribute("loginUser");
		this.setAttribute("user", user);
		return "index/index_v1";
	}
	
	@RequestMapping("/index")
	public String indexTwo(HttpServletRequest request) {
		List<Node> nodeList = nodeService.findAll();//读取所有菜单
		request.setAttribute("nodeList", nodeList);
		return "index/index";
	}
}

package com.base.spring.project.controller.protal;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Pl;
import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.PlService;

@Controller
@RequestMapping("/protal/pl")
public class ProtalPlController extends BaseController {

	@Autowired
	private PlService plService;
	
	/**
	 * ajax查询和该贴有关的所有评论
	 * @param resultPage
	 * @param pl
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/plMessage")
	@ResponseBody
	public ResultPage<Pl> pldata(ResultPage<Pl> resultPage,Pl pl,Integer noteId){
		pl.setNid(noteId);
		ResultPage<Pl> result = plService.findAllAjax(resultPage,pl);
		return result;
	}
	
	/**
	 * 评论发表
	 * @param pl
	 * @return
	 */
	@RequestMapping("/plAdd")
	@ResponseBody
	public int doAddPl(Pl pl) {
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		pl.setUid(user.getId());
		pl.setCreateTime(new Date());
		int i = plService.save(pl);
		return i;
	}
	
	@RequestMapping("/deleteMyPl")
	@ResponseBody
	public int deleteMyPl(Integer id) {
		int i = plService.deleteById(id);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
}

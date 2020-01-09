package com.base.spring.project.controller.back;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Note;
import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.NoteService;
import com.base.spring.project.util.GetHtmlTextUtils;
import com.base.spring.project.util.GetSrcUtils;

@Controller
@RequestMapping("/back/note")
public class NoteController extends BaseController{

	@Autowired
	private NoteService noteService;
	
	/**
	 * 数据查询
	 * @param resultPage
	 * @param request
	 * @param note
	 * @return
	 */
	@RequestMapping("/noteList")
	public String toNodeList(ResultPage<Note> resultPage ,HttpServletRequest request,Note note) {
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		if(!user.getName().equals("admin")) {
			note.setAuthor(user.getId());
		}
		ResultPage<Note> result = noteService.findAllNote(resultPage,note);
		request.setAttribute("result",result);
		return "admin/note/note_list";
	}
	
	
	/**
	 * 删除实现
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public int del(Integer id) {
		//int i = noteService.deleteById(id);
		//删除该贴，以及评论和被收藏的    ,不删除也可，只是数据看着难受
		int i= noteService.delAboutNote(id);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 修改页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id) {
		Note note = noteService.findNoteById(id);
		this.setAttribute("note", note);
		return "admin/note/note_edit";
	}
	@RequestMapping("/update")
	@ResponseBody
	public int update(Note note) {
		if(!StringUtils.isEmpty(note.getContents())){
			/*List<String> list =GetSrcUtils.getImageSrc(note.getContents());
			if(list!=null&&list.size()>0){
				note.setImg(list.get(0));
			}*/
			String text = GetHtmlTextUtils.getHtmlText(note.getContents());
			note.setContents1(text);
		}
		note.setUpdateTime(new Date());
		int i = noteService.update(note);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	@RequestMapping("/noteIlike")
	public String noteIlike(ResultPage<Note> resultPage ,HttpServletRequest request,Note note) {
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		if(!user.getName().equals("admin")) {
			note.setAuthor(user.getId());
		}
		ResultPage<Note> result = noteService.findAllLikeNote(resultPage,note);
		request.setAttribute("result",result);
		return "admin/note/note_ilike";
	}
}

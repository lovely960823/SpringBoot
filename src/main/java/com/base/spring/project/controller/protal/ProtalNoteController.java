package com.base.spring.project.controller.protal;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.util.StringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Ilike;
import com.base.spring.project.model.Note;
import com.base.spring.project.model.User;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.DianzService;
import com.base.spring.project.service.IlikeService;
import com.base.spring.project.service.NoteService;
import com.base.spring.project.service.PlService;
import com.base.spring.project.service.UserService;
import com.base.spring.project.util.GetHtmlTextUtils;
import com.base.spring.project.util.HttpClientUtils;
import com.base.spring.project.util.URLEncodeUtil;

@Controller
@RequestMapping("/protal/note")
public class ProtalNoteController extends BaseController{

	@Autowired
	private NoteService noteService;
	@Autowired
	private PlService plService;
	@Autowired
	private IlikeService ilikeService;
	@Autowired
	private DianzService dianzService;
	
	
	@RequestMapping("/noteList")
	private String protalNoteList(HttpSession session,HttpServletRequest request,ResultPage<Note> resultPage,Note note,String code) throws Exception {
		ResultPage<Note> result = noteService.findAllNote(resultPage,note);
		request.setAttribute("result",result);
		return "protal/note/note_list";
	}
	
	/**
	 * 帖子发布页面
	 * @return
	 */
	@RequestMapping("/notePublish")
	public String notePublish() {

		return "protal/note/note_add";
	}
	
	/**
	 * 发布实现操作
	 * @param note
	 * @return
	 */
	@RequestMapping("/doNotePub")
	@ResponseBody
	public  int doNotePub(Note note,HttpSession session) {
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		if(!StringUtils.isEmpty(note.getContents())){
			/*List<String> list =GetSrcUtils.getImageSrc(note.getContents());
			if(list!=null&&list.size()>0){
				note.setImg(list.get(0));
			}*/
			String text = GetHtmlTextUtils.getHtmlText(note.getContents());
			note.setContents1(text);
		}
		note.setAuthor(user.getId());
		int i = noteService.save(note);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * 帖子详情
	 * @param id
	 * @return
	 */
	@RequestMapping("/noteDetail")
	public String noteDetail(Integer id) {
		Note note = noteService.findNoteById(id);
		note.setViews(note.getViews()+1);
		noteService.update(note);
		//查到和该帖子有关的评论
		this.setAttribute("note", note);
		//点赞数
		int dzcount = dianzService.getCount(id);
		this.setAttribute("dzcount", dzcount);
		//评论数
		int plcount = plService.getCount(id);
		this.setAttribute("plcount", plcount);
		//翻篇
		List<Note> listNote = noteService.findAll();
		int pre=0;
		int next=0;
		for(int i=0;i<listNote.size();i++) {
			if(listNote.get(i).getId().equals(id)){
				if(i != 0){
					pre=listNote.get(i-1).getId();
					this.getRequest().setAttribute("preNews", listNote.get(i-1));
				}
				if(i != listNote.size() -1){
					next=listNote.get(i+1).getId();
					this.getRequest().setAttribute("nextNews", listNote.get(i+1));
				}
			}
		}
        this.getRequest().setAttribute("pre", pre);
        this.getRequest().setAttribute("next", next);
		return "protal/note/note_detail";
	}
	
	
	/**
	 * 收藏前判断
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/scpd")
	@ResponseBody
	public int scpd(Integer noteId) {
		Ilike like = ilikeService.findByNid(noteId);
		if(like!=null) {
			return 0;
		}else {
			return noteId;
		}
		
	}
	
	/**
	 * 收藏操作
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/ensuresc")
	@ResponseBody
	public int ensuresc(Integer noteId) {
		User user=((User)this.getRequest().getSession().getAttribute("loginUser"));
		Ilike like = new Ilike();
		like.setNid(noteId);
		like.setUid(user.getId());
		int i = ilikeService.save(like);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	/**
	 * 获取所有的note名称
	 * @param title
	 * @return
	 */
	@RequestMapping("/getNoteName")
	@ResponseBody
	public List<String> getNoteName(String title){
		List<String> list = noteService.getAllNoteName(title);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}

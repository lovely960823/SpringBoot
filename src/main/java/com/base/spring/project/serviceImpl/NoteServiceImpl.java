package com.base.spring.project.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.base.spring.project.mapper.IlikeMapper;
import com.base.spring.project.mapper.NoteMapper;
import com.base.spring.project.mapper.PlMapper;
import com.base.spring.project.model.Ilike;
import com.base.spring.project.model.Note;
import com.base.spring.project.model.Pl;
import com.base.spring.project.page.ResultPage;
import com.base.spring.project.service.NoteService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteMapper noteMapper;
	@Autowired
	private PlMapper plMapper;
	@Autowired
	private IlikeMapper ilikeMapper;

	@Override
	public int save(Note note) {
		int i= noteMapper.insertSelective(note);
		return i;
	}

	/**
	 * 后台帖子列表
	 */
	@Override
	public ResultPage<Note> findAllNote(ResultPage<Note> resultPage, Note note) {
		PageHelper.startPage(resultPage.getPage(),resultPage.getLimit());
		PageHelper.orderBy("id asc");
		List<Note> list = noteMapper.selectByParam(note);
		PageInfo<Note> pageInfo = new PageInfo<Note>(list);
		resultPage.setData(list);
		resultPage.setCount(pageInfo.getTotal());
		resultPage.setTotalPage(pageInfo.getPages());
		return resultPage;
	}

	/**
	 * 前台帖子列表   暂时用不到了
	 */
	@Override
	public ResultPage<Note> protalFindAllNote(ResultPage<Note> resultPage, Note note) {
		PageHelper.startPage(resultPage.getPage(),resultPage.getLimit());
		PageHelper.orderBy("id asc");
		Example example = new Example(Note.class);
		Criteria criteria= example.createCriteria();
		if(!StringUtils.isEmpty(note.getTitle())) {
			criteria.andLike("title", "%"+note.getTitle()+"%");
		}
		List<Note> list = noteMapper.selectByExample(example);
		PageInfo<Note> pageInfo = new PageInfo<Note>(list);
		resultPage.setData(list);
		resultPage.setCount(pageInfo.getTotal());
		resultPage.setTotalPage(pageInfo.getPages());
		return resultPage;
	}
	
	@Override
	public int deleteById(Integer id) {
		int i = noteMapper.deleteByPrimaryKey(id);
		return i;
	}

	@Override
	public Note findNoteById(Integer id) {
		Note note = noteMapper.selectByPrimaryKey(id);
		return note;
	}

	@Override
	public int update(Note note) {
		int i = noteMapper.updateByPrimaryKeySelective(note);
		return i;
	}

	@Override
	public ResultPage<Note> findAllLikeNote(ResultPage<Note> resultPage, Note note) {
		PageHelper.startPage(resultPage.getPage(),resultPage.getLimit());
		PageHelper.orderBy("id asc");
		List<Note> list = noteMapper.selectAllLike(note);
		PageInfo<Note> pageInfo = new PageInfo<Note>(list);
		resultPage.setData(list);
		resultPage.setCount(pageInfo.getTotal());
		resultPage.setTotalPage(pageInfo.getPages());
		return resultPage;
	}

	@Override
	public int delAboutNote(Integer id) {
		int i = noteMapper.deleteByPrimaryKey(id);
		Pl pl=new Pl();
		pl.setNid(id);
		plMapper.delete(pl);
		Ilike like =new Ilike();
		like.setNid(id);
		ilikeMapper.delete(like);
		return i;
		
	}

	@Override
	public List<String> getAllNoteName(String title) {
		
		List<String> list = new ArrayList<String>();
		
		Example example = new Example(Note.class);
		if(!StringUtils.isEmpty(title)) {
			Criteria createCriteria = example.createCriteria();
			createCriteria.andLike("title", "%"+title+"%");
		}
		List<Note> list1=  noteMapper.selectByExample(example);
		if(!list1.isEmpty()) {
			for(int i =0;i<list1.size();i++) {
				list.add(list1.get(i).getTitle());
			}
		}
		
		return list;
	}

	@Override
	public List<Note> findAll() {
		List<Note> list = noteMapper.selectAll();
		return list;
	}

	


}

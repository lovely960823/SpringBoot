package com.base.spring.project.service;

import java.util.List;

import com.base.spring.project.model.Note;
import com.base.spring.project.page.ResultPage;

public interface NoteService {

	int save(Note note);

	ResultPage<Note> findAllNote(ResultPage<Note> resultPage, Note note);

	int deleteById(Integer id);

	Note findNoteById(Integer id);

	int update(Note note);

	ResultPage<Note> protalFindAllNote(ResultPage<Note> resultPage, Note note);

	ResultPage<Note> findAllLikeNote(ResultPage<Note> resultPage, Note note);

	int delAboutNote(Integer id);

	List<String> getAllNoteName(String title);

	List<Note> findAll();


}

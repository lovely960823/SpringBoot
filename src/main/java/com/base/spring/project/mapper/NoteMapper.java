package com.base.spring.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.base.spring.project.model.Note;

import tk.mybatis.mapper.common.Mapper;

@org.apache.ibatis.annotations.Mapper
public interface NoteMapper extends Mapper<Note> {

	List<Note> selectByParam(@Param("note") Note note);

	List<Note> selectAllLike(@Param("note") Note note);
}

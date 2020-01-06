package com.base.spring.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.base.spring.project.model.Pl;

import tk.mybatis.mapper.common.Mapper;

@org.apache.ibatis.annotations.Mapper
public interface PlMapper extends Mapper<Pl> {

	List<Pl> selectPlAndUser(@Param("id")Integer id);

	@Delete("delete from pl where id = #{id} ")
	int deleteById(Integer id);

}

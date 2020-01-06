package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="views")
public class Views implements Serializable{

	/**
	 * 日访问量表
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Integer id;
	private String time;
	private Integer counts;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
}

package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="money")
public class Money implements Serializable{

	/**
	 * 记账表
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Integer id;
	private String time;
	private String counts;
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
	public String getCounts() {
		return counts;
	}
	public void setCounts(String counts) {
		this.counts = counts;
	}
}

package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="guanz")
public class Guanz implements Serializable {

	/**
	 * 我的关注表
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;
	private Integer uid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
}

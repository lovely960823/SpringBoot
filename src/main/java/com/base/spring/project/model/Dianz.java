package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name="dianz")
public class Dianz implements Serializable {

	/**
	 * 点赞表
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer uid;
	private Integer nid;
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
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
}

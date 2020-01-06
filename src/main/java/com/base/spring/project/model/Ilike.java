package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="ilike")
public class Ilike implements Serializable {

	/**
	 * 我的收藏
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;
	private Integer nid;//帖子id
	private Integer uid;//用户id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
}

package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name="role_user")
public class RoleUser implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer uid;//userId
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

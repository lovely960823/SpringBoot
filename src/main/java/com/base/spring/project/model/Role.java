package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name="role")
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ruid;//role_user表id
	private Integer nid;//node表id
	private Integer uid;//用来删除对应自己的记录的
	public Integer getRuid() {
		return ruid;
	}
	public void setRuid(Integer ruid) {
		this.ruid = ruid;
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

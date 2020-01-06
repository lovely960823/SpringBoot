package com.base.spring.project.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name="pl")
public class Pl implements Serializable{

	/**
	 * 帖子评论表
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String contents;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date createTime;
	private Integer nid;//帖子id
	private Integer uid;//评论人id
	private User user;//查询评论人
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}

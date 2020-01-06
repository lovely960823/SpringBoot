package com.base.spring.project.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name="note")
public class Note implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;
	private String title;//标题
	@DateTimeFormat(pattern = "yyyy/MM/dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date createTime;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date updateTime;
	private Integer views;
	private String contents;//存放真正内容
	private String contents1;//存放contents里面没有格式的内容
	private Integer author;
	private User user;
	@Transient
	private Integer pcount;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getContents1() {
		return contents1;
	}
	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}
	public Integer getAuthor() {
		return author;
	}
	public void setAuthor(Integer author) {
		this.author = author;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getPcount() {
		return pcount;
	}
	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}
}

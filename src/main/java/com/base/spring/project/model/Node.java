package com.base.spring.project.model;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="node")
public class Node implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Integer id;
	private String name;
	private String icon;
	private String url;
	private String part;
	private String parentId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	@Override
	public String toString() {
		return "Node [id=" + id + ", name=" + name + ", url=" + url + ", part=" + part + ", parentId=" + parentId + "]";
	}

}

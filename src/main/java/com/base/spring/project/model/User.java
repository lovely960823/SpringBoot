package com.base.spring.project.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="user")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Integer id;//id
	private String name;//用户名
	private String password;//密码
	private String tel;//手机号
	private String email;//邮箱
	private String img;//头像
	private String xzqycode;//住址
	private String contents;//自我评价
	private String openid;//qq用户唯一标识
	 /**
     * 用户对应的角色集合
     */
   
    
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

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getXzqycode() {
		return xzqycode;
	}
	public void setXzqycode(String xzqycode) {
		this.xzqycode = xzqycode;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}

}

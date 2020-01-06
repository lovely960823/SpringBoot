package com.base.spring.project.model;

import java.io.Serializable;

public class Redis implements Serializable {

	/**
	 * Redis的测试实体类
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String sex;
	private Integer age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

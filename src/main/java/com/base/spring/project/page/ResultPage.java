package com.base.spring.project.page;

import java.util.List;

public class ResultPage<T> {

	private Integer page = 1;  //当前页
	private Integer limit = 10; //每页显示记录数(pageSize)
	private Integer totalPage;  //总页数
	private List<T> data;  //数据
	private long count;   // 总记录数

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		if(page <= 0){
			page = 1;
		}
		
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}


	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	
}

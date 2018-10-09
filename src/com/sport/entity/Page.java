package com.sport.entity;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
	
	private int currentPageNo = 1;  //当前页码
	
	private int totalPageCount; //总页数
	
	private int totalCount; //总记录条数
	
	private int pageSize = 3;  //每页显示的记录条数
	
	private int prePageNo;  //上一页
	
	private int nextPageNo;  //下一页
	
	private List<T> list = new ArrayList<T>();  //一页的结果

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		if(currentPageNo > 0){
			this.currentPageNo = currentPageNo;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int pageSize) {
		if(this.getTotalCount() % pageSize == 0){
			this.totalPageCount = this.getTotalCount() / pageSize;
		}else if(this.getTotalCount() % pageSize != 0){
			this.totalPageCount = this.getTotalCount() / pageSize + 1;
		}else {
			this.totalPageCount = 0;
		}
	}

	public void setTotalPageCount() {
		if(this.getTotalCount() % this.getPageSize() == 0){
			this.totalPageCount = this.getTotalCount() / this.getPageSize();
		}else if(this.getTotalCount() % this.getPageSize() != 0){
			this.totalPageCount = this.getTotalCount() / this.getPageSize() + 1;
		}else {
			this.totalPageCount = 0;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if(currentPageNo > 0){
			this.totalCount = totalCount;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(currentPageNo > 0){
			this.pageSize = pageSize;
		}
	}

	public int getPrePageNo() {
		return prePageNo;
	}

	public void setPrePageNo() {
		if(this.getCurrentPageNo() > 1){
			this.prePageNo = prePageNo-1;
		}
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo() {
		if(this.currentPageNo > 0 && this.currentPageNo < this.totalPageCount){
            this.nextPageNo = currentPageNo + 1;
        }
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Page [currentPageNo=" + currentPageNo + ", totalPageCount="
				+ totalPageCount + ", totalCount=" + totalCount + ", pageSize="
				+ pageSize + ", prePageNo=" + prePageNo + ", nextPageNo="
				+ nextPageNo + ", list=" + list + "]";
	}

}

package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class HotSearch {
	
	private int sid;
	
	private String sname;
	
	private int count;

	public HotSearch() {
		super();
	}

	public HotSearch(String sname, int count) {
		super();
		this.sname = sname;
		this.count = count;
	}

	@Id
	@GeneratedValue
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "HotSearch [sid=" + sid + ", sname=" + sname + ", count="
				+ count + "]";
	}

}

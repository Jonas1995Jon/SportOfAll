package com.sport.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

public class Company {
	
	private int cid;  //公司ID
	
	private String cname;  //公司名称
	
	private String summary;  //公司摘要
	
	private String synopsis;  //公司简介
	
	private String tenet;  //公司宗旨
	
	private List<Activity> activities = new ArrayList<Activity>();

	public Company() {
		
	}

	public Company(String cname, String summary, String synopsis, String tenet,
			List<Activity> activities) {
		super();
		this.cname = cname;
		this.summary = summary;
		this.synopsis = synopsis;
		this.tenet = tenet;
		this.activities = activities;
	}

	@Id
	@GeneratedValue
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public String getTenet() {
		return tenet;
	}

	public void setTenet(String tenet) {
		this.tenet = tenet;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	@Override
	public String toString() {
		return "Company [cid=" + cid + ", cname=" + cname + ", summary="
				+ summary + ", synopsis=" + synopsis + ", tenet=" + tenet
				+ ", activities=" + activities + "]";
	}

}

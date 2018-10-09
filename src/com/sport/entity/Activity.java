package com.sport.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Activity {
	
	private int aid;  //活动ID
	
	private int uid;  //发布活动者的ID
	
	private String title;  //活动标题
	
	private String menuName;  //活动类型
	
	private String position;  //活动地点
	
	private Date beginTime;  //活动开始时间
	
	private Date endTime;  //活动结束时间
	
	private String summary;  //活动摘要
	
	private String synopsis;  //活动简介
	
	private String content;  //活动内容
	
	private String image;  //活动图片
	
	private float price;  //活动费用
	
	private int status;  //活动状态
	
	private int view;  //浏览数量
	
	public Activity() {
		
	}

	public Activity(int uid, String title, String menuName, String position,
			Date beginTime, Date endTime, String summary, String synopsis,
			String content, String image, float price, int status, int view) {
		this.uid = uid;
		this.title = title;
		this.menuName = menuName;
		this.position = position;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.summary = summary;
		this.synopsis = synopsis;
		this.content = content;
		this.image = image;
		this.price = price;
		this.status = status;
		this.view = view;
	}

	@Id
	@GeneratedValue
	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "Activity [aid=" + aid + ", uid=" + uid + ", title=" + title
				+ ", menuName=" + menuName + ", position=" + position
				+ ", beginTime=" + beginTime + ", endTime=" + endTime
				+ ", summary=" + summary + ", synopsis=" + synopsis
				+ ", content=" + content + ", image=" + image + ", price="
				+ price + ", status=" + status + ", view=" + view + "]";
	}
	
}

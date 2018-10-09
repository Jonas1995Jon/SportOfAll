package com.sport.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Club {
	
	private int clubid;  //俱乐部ID
	
	private String clubName;  //俱乐部名字
	
	private String position;  //俱乐部地点
	
	private Date createTime;  //俱乐部创建时间
	
	private int view;  //俱乐部浏览量
	
	private String summary;  //俱乐部摘要
	
	private String synopsis;  //俱乐部简介
	
	private String image;  //俱乐部图片

	public Club() {
		
	}

	public Club(String clubName, String position, Date createTime, int view,
			String summary, String synopsis, String image) {
		this.clubName = clubName;
		this.position = position;
		this.createTime = createTime;
		this.view = view;
		this.summary = summary;
		this.synopsis = synopsis;
		this.image = image;
	}

	@Id
	@GeneratedValue
	public int getClubid() {
		return clubid;
	}

	public void setClubid(int clubid) {
		this.clubid = clubid;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Club [clubid=" + clubid + ", clubName=" + clubName
				+ ", position=" + position + ", createTime=" + createTime
				+ ", view" + view + ", summary=" + summary + ", synopsis="
				+ synopsis + ", image=" + image + "]";
	}

}

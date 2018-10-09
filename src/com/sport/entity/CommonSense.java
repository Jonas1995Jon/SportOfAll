package com.sport.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CommonSense {
	
	private int cid;  //健身常识ID
	
	private String author;  //健身常识发布者
	
	private String title;  //健身常识标题
	
	private int view;  //健身常识浏览数
	
	private String summary;  //健身常识简介
	
	private String image;  //健身常识图片
	
	private String content;  //健身常识内容
	
	private Date date;  //健身常识发布日期

	public CommonSense() {
		
	}

	public CommonSense(String author, String title, int view,
			String summary, String image, String content, Date date) {
		super();
		this.author = author;
		this.title = title;
		this.view = view;
		this.summary = summary;
		this.image = image;
		this.content = content;
		this.date = date;
	}

	@Id
	@GeneratedValue
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CommonSense [cid=" + cid + ", author=" + author + ", title="
				+ title + ", view=" + view + ", summary=" + summary
				+ ", image=" + image + ", content=" + content + ", date="
				+ date + "]";
	}

}

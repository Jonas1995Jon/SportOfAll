package com.sport.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ZhiDaoYuan {
	
	private int zid;
	
	private String name;
	
	private int sex;
	
	private int age;
	
	private String images;
	
	private String address;
	
	private String menuName;
	
	private int levelNum;
	
	private String levelStr;
	
	private String description;
	
	private String source;
	
	private Date publishDate;

	public ZhiDaoYuan() {
		
	}

	public ZhiDaoYuan(String name, int sex, int age, String images,
			String address, String menuName, String levelStr,
			int levelNum, String description, String source, Date publishDate) {
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.images = images;
		this.address = address;
		this.menuName = menuName;
		this.levelNum = levelNum;
		this.levelStr = levelStr;
		this.description = description;
		this.source = source;
		this.publishDate = publishDate;
	}

	@Id
	@GeneratedValue
	public int getZid() {
		return zid;
	}

	public void setZid(int zid) {
		this.zid = zid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getLevelNum() {
		return levelNum;
	}

	public void setLevelNum(int levelNum) {
		this.levelNum = levelNum;
	}

	public String getLevelStr() {
		return levelStr;
	}

	public void setLevelStr(String levelStr) {
		this.levelStr = levelStr;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Override
	public String toString() {
		return "ZhiDaoYuan [zid=" + zid + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", images=" + images + ", address="
				+ address + ", menuName=" + menuName + ", level=" + levelStr
				+ ", levelNum=" + levelNum + ", description=" + description +
				", source=" + source + ", publishDate=" + publishDate + "]";
	}

}

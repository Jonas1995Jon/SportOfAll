package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Menus {
	
	private int smid;
	
	private String menuName;  //菜单名称
	
	private int menuLevel;  //菜单等级
	
	private int id;  //每级菜单每项ID

	public Menus() {
		
	}

	public Menus(String menuName, int menuLevel, int id) {
		this.menuName = menuName;
		this.menuLevel = menuLevel;
		this.id = id;
	}

	@Id
	@GeneratedValue
	public int getSmid() {
		return smid;
	}

	public void setSmid(int smid) {
		this.smid = smid;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Menus [smid=" + smid + ", menuName=" + menuName
				+ ", menuLevel=" + menuLevel + ", id=" + id + "]";
	}

}

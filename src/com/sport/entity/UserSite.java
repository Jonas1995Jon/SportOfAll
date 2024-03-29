package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_site")
public class UserSite {
	
	private int usid;
	
	private int uid;
	
	private int sid;
	
	private int status;

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public UserSite() {
		
	}

	public UserSite(int usid, int uid, int sid, int status, int state) {
		this.usid = usid;
		this.uid = uid;
		this.sid = sid;
		this.status = status;
		this.state = state;
	}

	@Id
	@GeneratedValue
	public int getUsid() {
		return usid;
	}

	public void setUsid(int usid) {
		this.usid = usid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserSite{" +
				"usid=" + usid +
				", uid=" + uid +
				", sid=" + sid +
				", status=" + status +
				", state=" + state +
				'}';
	}
}

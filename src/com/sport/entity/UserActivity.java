package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_activity")
public class UserActivity {
	
	private int uaid;
	
	private int uid;
	
	private int aid;
	
	private int status;

	public UserActivity() {
		
	}

	public UserActivity(int uid, int aid, int status) {
		super();
		this.uid = uid;
		this.aid = aid;
		this.status = status;
	}

	@Id
	@GeneratedValue
	public int getUaid() {
		return uaid;
	}

	public void setUaid(int uaid) {
		this.uaid = uaid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserActivity [uaid=" + uaid + ", uid=" + uid + ", aid=" + aid
				+ ", status=" + status + "]";
	}

}

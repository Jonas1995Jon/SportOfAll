package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_club")
public class UserClub {
	
	private int ucid;
	
	private int uid;
	
	private int clubid;
	
	private int status;

	public UserClub() {
		
	}

	public UserClub(int uid, int clubid, int status) {
		this.uid = uid;
		this.clubid = clubid;
		this.status = status;
	}

	@Id
	@GeneratedValue
	public int getUcid() {
		return ucid;
	}

	public void setUcid(int ucid) {
		this.ucid = ucid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getClubid() {
		return clubid;
	}

	public void setClubid(int clubid) {
		this.clubid = clubid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserClub [ucid=" + ucid + ", uid=" + uid + ", clubid=" + clubid
				+ ", status=" + status + "]";
	}

}

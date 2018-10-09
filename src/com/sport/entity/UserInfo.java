package com.sport.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.dialect.Ingres10Dialect;

@Entity
public class UserInfo {
	
	private int uid; //用户ID
	
	private String username;  //用户名
	
	private String password;  //密码
	
	private String nickname;  //昵称
	
	private int gender;  //性别
	
	private int age;  //年龄

	private Date birthday; //生日
	
	private String phone;  //手机号
	
	private String email;  //邮箱
	
	private String headimg;  //头像
	
	private float weight;  //体重
	
	private float height;  //身高
	
	private int bodyfat;  //体脂
	
	private int radio;  //用户类型标识

	public UserInfo() {
		
	}

	public UserInfo(String username, String password, String nickname,
			int gender, int age, Date birthday, String phone, String email,
			String headimg, float weight, float height, int bodyfat, int radio) {
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.headimg = headimg;
		this.weight = weight;
		this.height = height;
		this.bodyfat = bodyfat;
		this.radio = radio;
	}

	@Id
	@GeneratedValue
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public int getBodyfat() {
		return bodyfat;
	}

	public void setBodyfat(int bodyfat) {
		this.bodyfat = bodyfat;
	}

	public int getRadio() {
		return radio;
	}

	public void setRadio(int radio) {
		this.radio = radio;
	}

	@Override
	public String toString() {
		return "UserInfo [uid=" + uid + ", username=" + username
				+ ", password=" + password + ", nickname=" + nickname
				+ ", gender=" + gender + ", age=" + age + ", birthday="
				+ birthday + ", phone=" + phone + ", email=" + email
				+ ", headimg=" + headimg + ", weight=" + weight + ", height="
				+ height + ", bodyfat=" + bodyfat + ", radio=" + radio + "]";
	}

}

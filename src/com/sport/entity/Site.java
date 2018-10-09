package com.sport.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Site {
	
	private int sid; //场馆ID
	
	private String name; //场馆名称
	
	private String region;  //场馆区域
	
	private String address;  //场馆地址
	
	private String phone;  //场馆联系电话
	
	private float price;  //场馆价格
	
	private String image;  //场馆图片
	
	private String amOpenTime;  //场馆上午运营时间
	
	private String pmOpenTime;  //场馆下午运营时间
	
	private String service;  //场馆服务
	
	private String sheshi;  //场地设施
	
	private String summary;  //场馆简介
	
	private String traffic;  //交通方式
	
	private String menuName;  //活动类型
	
	private int status;  //场馆状态

	public Site() {
		
	}

	public Site(String name, String region, String address, String phone,
			float price, String image, String amOpenTime, String pmOpenTime,
			String service, String sheshi, String summary, String traffic,
			String menuName, int status) {
		this.name = name;
		this.region = region;
		this.address = address;
		this.phone = phone;
		this.price = price;
		this.image = image;
		this.amOpenTime = amOpenTime;
		this.pmOpenTime = pmOpenTime;
		this.service = service;
		this.sheshi = sheshi;
		this.summary = summary;
		this.traffic = traffic;
		this.menuName = menuName;
		this.status = status;
	}

	@Id
	@GeneratedValue
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAmOpenTime() {
		return amOpenTime;
	}

	public void setAmOpenTime(String amOpenTime) {
		this.amOpenTime = amOpenTime;
	}

	public String getPmOpenTime() {
		return pmOpenTime;
	}

	public void setPmOpenTime(String pmOpenTime) {
		this.pmOpenTime = pmOpenTime;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getSheshi() {
		return sheshi;
	}

	public void setSheshi(String sheshi) {
		this.sheshi = sheshi;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Site [sid=" + sid + ", name=" + name + ", region=" + region
				+ ", address=" + address + ", phone=" + phone + ", price="
				+ price + ", image=" + image + ", amOpenTime=" + amOpenTime
				+ ", pmOpenTime=" + pmOpenTime + ", service=" + service
				+ ", sheshi=" + sheshi + ", summary=" + summary + ", traffic="
				+ traffic + ", menuName=" + menuName + ", status=" + status
				+ "]";
	}

}

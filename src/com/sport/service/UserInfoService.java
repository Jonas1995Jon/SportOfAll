package com.sport.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sport.entity.UserInfo;

public interface UserInfoService extends BaseService<UserInfo>{
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public UserInfo login(HttpServletRequest request, HttpServletResponse response, String username, String password);
		
	/**
	 * 用户是否存在
	 * @param username
	 * @return
	 */
	public Boolean isUserExits(String username, String phone);
	

	

}

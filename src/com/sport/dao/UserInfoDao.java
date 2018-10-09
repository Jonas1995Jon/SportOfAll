package com.sport.dao;

import com.sport.entity.UserInfo;

public interface UserInfoDao extends BaseDao<UserInfo>  {
	
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public UserInfo login(String username, String password);
	
	/**
	 * 用户是否存在
	 * @param username
	 * @return
	 */
	public Boolean isUserExits(String username, String phone);

}

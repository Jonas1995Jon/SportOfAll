package com.sport.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.utils.MD5Util;
import com.sport.dao.BaseDao;
import com.sport.dao.UserInfoDao;
import com.sport.entity.UserInfo;
import com.sport.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo> implements UserInfoService {

	
	@Autowired
	@Qualifier("userInfoDao")
	private  UserInfoDao userInfoDao;
	
	@Override
	public UserInfo login(HttpServletRequest request, HttpServletResponse response,
			String username, String password) {
		
		//对密码进行MD5加密
		String pwd = MD5Util.makeMD5(password);
		
		HttpSession session = request.getSession();
		
		UserInfo userInfo = userInfoDao.login(username, pwd);
		
		if(userInfo != null){
			Cookie usernameCookie = new Cookie("username", userInfo.getUsername());
			Cookie pwdCookie = new Cookie("password", userInfo.getPassword());
			usernameCookie.setMaxAge(24*60*60);
			pwdCookie.setMaxAge(24*60*60);
			usernameCookie.setPath("/");
			pwdCookie.setPath("/");
			response.addCookie(usernameCookie);
			response.addCookie(pwdCookie);
			session.setAttribute("username", userInfo.getUsername());
			session.setAttribute("uid", userInfo.getUid());
			session.setAttribute("radio", userInfo.getRadio());
		}
		
		return userInfo;
	}

	@Override
	public Boolean isUserExits(String username, String phone) {
		
		return userInfoDao.isUserExits(username, phone);
	}
	
	public UserInfoDao getUserdao() {
		return userInfoDao;
	}

	@Resource(name ="userInfoDao")
	public void setUserdao(BaseDao<UserInfo> basedao) {
		super.setBasedao(basedao);
	}

}

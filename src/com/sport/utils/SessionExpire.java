package com.sport.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.sport.entity.UserInfo;
import com.sport.service.UserInfoService;

public class SessionExpire {
	
	/**
	 * 检查session是否过期
	 * @param request
	 * @return
	 */
	public static Boolean isSessionExpire(HttpServletRequest request){
		
		Boolean flag = false;
		
		HttpSession session = request.getSession();
		
		if(!StringUtils.isBlank((String) session.getAttribute("username"))){
			
			flag = true;
			
		}
		
		return flag;
		
	}

}

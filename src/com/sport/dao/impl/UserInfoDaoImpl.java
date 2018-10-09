package com.sport.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sport.dao.UserInfoDao;
import com.sport.entity.UserInfo;


@Repository("userInfoDao")
@Transactional
public class UserInfoDaoImpl extends BaseDaoImpl<UserInfo> implements UserInfoDao {

	@Override
	public UserInfo login(String username, String password) {
		
      String hql = "from UserInfo where username=? or phone=? and password=?";
      
      Session session = getSession();
      
      UserInfo userinfo = null;
      
      try {
    	  
    	  Query query = session.createQuery(hql);
    	  
    	  query.setParameter(0, username); 
    	  
    	  query.setParameter(1, username);
    	  
    	  query.setParameter(2, password);
    	  
    	  List<UserInfo> list = query.list();
    	  
    	  for(UserInfo u : list){
    		  userinfo = u;
    	  }
		
	} catch (Exception e) {
		 e.printStackTrace();
	}
		return userinfo; 
	}

	@Override
	public Boolean isUserExits(String username, String phone) {
		Boolean flag = false;
		String hql = "from UserInfo where username=? or phone=?";
	    Session session =getSession();
	    try {
	    	Query query = session.createQuery(hql);
	    	query.setParameter(0, username);
	    	query.setParameter(1, phone);
	    	List<UserInfo> list = query.list();
	    	if(list.size() != 0){
	    		flag = true;
	    	}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return flag;
	}

}

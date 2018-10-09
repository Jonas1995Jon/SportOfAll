package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.UserClubDao;
import com.sport.dao.impl.BaseDaoImpl;
import com.sport.entity.UserClub;
import com.sport.service.UserClubService;

@Service("userClubService")
public class UserClubServiceImpl extends BaseServiceImpl<UserClub> implements
		UserClubService {
		
	@Autowired
	@Qualifier("userClubDao")
	private UserClubDao userClubDao;

	public UserClubDao getUserClubDao() {
		return userClubDao;
	}

	@Resource(name = "userClubDao")
	public void setUserClubDao(BaseDao<UserClub> baseDao) {
		super.setBasedao(baseDao);
	}

}

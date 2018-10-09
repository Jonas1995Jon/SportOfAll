package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.UserActivityDao;
import com.sport.entity.UserActivity;
import com.sport.service.UserActivityService;

@Service("userActivityService")
public class UserActivityServiceImpl extends BaseServiceImpl<UserActivity>
		implements UserActivityService {

	@Autowired
	@Qualifier("userActivityDao")
	private UserActivityDao userActivityDao;

	public UserActivityDao getUserActivityDao() {
		return userActivityDao;
	}

	@Resource(name = "userActivityDao")
	public void setUserActivityDao(BaseDao<UserActivity> baseDao) {
		super.setBasedao(baseDao);
	}
	
}

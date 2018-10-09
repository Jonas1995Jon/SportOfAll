package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.UserSiteDao;
import com.sport.entity.UserSite;
import com.sport.service.UserSiteService;

@Service("userSiteService")
public class UserSiteServiceImpl extends BaseServiceImpl<UserSite> implements
		UserSiteService {

	@Autowired
	@Qualifier("userSiteDao")
	private UserSiteDao userSiteDao;

	public UserSiteDao getUserSiteDao() {
		return userSiteDao;
	}

	@Resource(name = "userSiteDao")
	public void setUserSiteDao(BaseDao<UserSite> baseDao) {
		super.setBasedao(baseDao);
	}

}

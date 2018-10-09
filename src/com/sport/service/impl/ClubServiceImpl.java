package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.ClubDao;
import com.sport.entity.Club;
import com.sport.service.ClubService;

@Service("clubService")
public class ClubServiceImpl extends BaseServiceImpl<Club> implements
		ClubService {

	@Autowired
	@Qualifier("clubDao")
	private ClubDao clubDao;

	public ClubDao getClubDao() {
		return clubDao;
	}

	@Resource(name = "clubDao")
	public void setClubDao(BaseDao<Club> baseDao) {
		super.setBasedao(baseDao);
	}

}

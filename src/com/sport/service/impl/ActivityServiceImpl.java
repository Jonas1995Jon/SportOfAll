package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.ActivityDao;
import com.sport.dao.BaseDao;
import com.sport.entity.Activity;
import com.sport.service.ActivityService;

@Service("activityService")
public class ActivityServiceImpl extends BaseServiceImpl<Activity> implements
		ActivityService {
	
	@Autowired
	@Qualifier("activityDao")
	private ActivityDao activityDao;

	public ActivityDao getActivityDao() {
		return activityDao;
	}

	@Resource(name="activityDao")
	public void setActivityDao(BaseDao<Activity> basedao) {
		super.setBasedao(basedao);
	}

}

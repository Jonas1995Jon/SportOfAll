package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.PublishDao;
import com.sport.entity.Activity;
import com.sport.service.PublishService;

@Service("publishService")
public class PublishServiceImpl extends BaseServiceImpl<Activity> implements
		PublishService {

	@Autowired
	@Qualifier("publishDao")
	private PublishDao publishDao;

	public PublishDao getPublishDao() {
		return publishDao;
	}

	@Resource(name="publishDao")
	public void setPublishDao(BaseDao<Activity> basedao) {
		super.setBasedao(basedao);
	}

}

package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.SiteDao;
import com.sport.entity.Site;
import com.sport.service.SiteService;

@Service("siteService")
public class SiteServiceImpl extends BaseServiceImpl<Site> implements
		SiteService {

	@Autowired
	@Qualifier("siteDao")
	private SiteDao siteDao;

	public SiteDao getSiteDao() {
		return siteDao;
	}

	@Resource(name = "siteDao")
	public void setSiteDao(BaseDao<Site> baseDao) {
		super.setBasedao(baseDao);
	}

}

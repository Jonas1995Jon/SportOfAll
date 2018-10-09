package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.ZhiDaoYuanDao;
import com.sport.entity.ZhiDaoYuan;
import com.sport.service.ZhiDaoYuanService;

@Service("zhiDaoYuanService")
public class ZhiDaoYuanServiceImpl extends BaseServiceImpl<ZhiDaoYuan>
		implements ZhiDaoYuanService {

	@Autowired
	@Qualifier("zhiDaoYuanDao")
	private ZhiDaoYuanDao zhiDaoYuanDao;

	public ZhiDaoYuanDao getZhiDaoYuanDao() {
		return zhiDaoYuanDao;
	}

	@Resource(name = "zhiDaoYuanDao")
	public void setZhiDaoYuanDao(BaseDao<ZhiDaoYuan> baseDao) {
		super.setBasedao(baseDao);
	}
	
}

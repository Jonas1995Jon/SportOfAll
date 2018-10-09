package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.CommonSenseDao;
import com.sport.entity.CommonSense;
import com.sport.service.CommonSenseService;

@Service("commonSenseService")
public class CommonSenseServiceImpl extends BaseServiceImpl<CommonSense>
		implements CommonSenseService {

	@Autowired
	@Qualifier("commonSenseDao")
	private CommonSenseDao commonSenseDao;

	public CommonSenseDao getCommonSenseDao() {
		return commonSenseDao;
	}

	@Resource(name = "commonSenseDao")
	public void setCommonSenseDao(BaseDao<CommonSense> baseDao) {
		super.setBasedao(baseDao);
	}

}

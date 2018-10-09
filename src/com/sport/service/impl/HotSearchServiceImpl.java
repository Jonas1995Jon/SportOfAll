package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.HotSearchDao;
import com.sport.entity.HotSearch;
import com.sport.service.HotSearchService;

@Service("hotSearchService")
public class HotSearchServiceImpl extends BaseServiceImpl<HotSearch> implements
		HotSearchService {
	
	@Autowired
	@Qualifier("hotSearchDao")
	private HotSearchDao hotSearchDao;

	public HotSearchDao getHotSearchDao() {
		return hotSearchDao;
	}

	@Resource(name="hotSearchDao")
	public void setHotSearchDao(BaseDao<HotSearch> baseDao) {
		super.setBasedao(baseDao);
	}

}

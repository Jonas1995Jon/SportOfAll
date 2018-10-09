package com.sport.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sport.dao.BaseDao;
import com.sport.dao.SaiShiMenuDao;
import com.sport.entity.Menus;
import com.sport.service.SaiShiMenuService;

@Service("saiShiMenuService")
public class SaiShiMenuServiceImpl extends BaseServiceImpl<Menus>
		implements SaiShiMenuService {

	@Autowired
	@Qualifier("saiShiMenuDao")
	private SaiShiMenuDao saiShiMenuDao;

	public SaiShiMenuDao getSaiShiMenuDao() {
		return saiShiMenuDao;
	}

	@Resource(name = "saiShiMenuDao")
	public void setSaiShiMenuDao(BaseDao<Menus> baseDao) {
		super.setBasedao(baseDao);
	}

}

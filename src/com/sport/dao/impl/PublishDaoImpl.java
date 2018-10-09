package com.sport.dao.impl;

import org.springframework.stereotype.Repository;

import com.sport.dao.PublishDao;
import com.sport.entity.Activity;

@Repository("publishDao")
public class PublishDaoImpl extends BaseDaoImpl<Activity> implements PublishDao {

}

package com.sport.service.impl;

import java.io.Serializable;
import java.util.List;

import com.sport.dao.BaseDao;
import com.sport.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	
	private BaseDao<T> basedao;
	/*
	public BaseServiceImpl() {
		//获取当前类型的父类型信息(包括类型参数信息)
		ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
	    clazz = (Class<T>) type.getActualTypeArguments()[0];
	    System.out.println(clazz);
	}*/
	
	
	

	public BaseDao<T> getBasedao() {
		return basedao;
	}

	public void setBasedao(BaseDao<T> basedao) {
		this.basedao = basedao;
	}
	
	
	
	@Override
	public void save(T entity) {
		 basedao.save(entity);
	}

	@Override
	public void update(T entity) {
		basedao.update(entity);
	}

	@Override
	public void delete(Serializable id) {
		basedao.delete(id);
		
	}

	@Override
	public void partupdate(int id, String[] names, Object[] values) {
		basedao.partupdate(id, names, values);
	}

	@Override
	public T findById(Serializable id) {
		// TODO Auto-generated method stub
		return basedao.findById(id);
	}

	@Override
	public List<T> findByHql(String hql, Object... values) {
		// TODO Auto-generated method stub
		return basedao.findByHql(hql, values);
	}

	@Override
	public List<T> queryPage(String hql, int pageSize, int pageNO) {
		 
		return basedao.queryPage(hql, pageSize, pageNO);
	}

	
	@Override
	public Integer getCount(String hql) {
		// TODO Auto-generated method stub
		return basedao.getCount(hql);
	}

}

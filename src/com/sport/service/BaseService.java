package com.sport.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {
	
	
	/**
	 * 保存一个对象
	 * @param entity
	 */
	public void save(T entity);
	
	/**
	 * 更新一个对象
	 * @param entity
	 */
	public void update(T entity);
	
	
	/**
	 * 跟据序列id 删除一个对象
	 * @param id
	 */
	public void delete(Serializable id);
	
	/**
	 * 根据id 更新部分对象的部分值
	 * @param id
	 * @param names 更新字段名称
	 * @param values更新的值
	 */
	public void partupdate(int id,String[] names,Object[] values);
	
	/**
	 * 根据id查找 一个对象
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * 根据 hql语句查找对象列表
	 * @param hql
	 * @param values
	 * @return
	 */
	public List<T> findByHql(String hql,Object...values);
	

	/**
	 * 带有分页功能的查找对象列表
	 * @param hql
	 * @param pageSize
	 * @param pageNO
	 * @return
	 */
	public List<T> queryPage(String hql,int pageSize,int pageNO);
	
	/**
	 * 获取总的记录条数
	 * @param hql
	 * @return
	 */
	public Integer getCount(String hql);
	

}

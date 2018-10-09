package com.sport.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sport.dao.BaseDao;

@Repository("baseDao")
@Transactional
public class BaseDaoImpl<T> implements BaseDao<T> {

	private Class<T> clazz;

	private Session session;

	@Autowired
	private SessionFactory sessionFactory;

	public BaseDaoImpl() {

		// 当前对象的直接超类的 Type
		Type genericSuperclass = getClass().getGenericSuperclass();
		if (genericSuperclass instanceof ParameterizedType) {
			// 参数化类型
			ParameterizedType parameterizedType = (ParameterizedType) genericSuperclass;
			// 返回表示此类型实际类型参数的 Type 对象的数组
			Type[] actualTypeArguments = parameterizedType
					.getActualTypeArguments();
			this.clazz = (Class<T>) actualTypeArguments[0];
		} else {
			this.clazz = (Class<T>) genericSuperclass;
		}

		/*
		 * Type type = getClass().getGenericSuperclass(); if (type instanceof
		 * ParameterizedType) { this.clazz = (Class<T>) ((ParameterizedType)
		 * type).getActualTypeArguments()[0]; } else { this.clazz = null; }
		 */
		// clazz = ReflectUtil.getClassGenricType(getClass());//
		// 依据ReflectUtil工具类，获取类对象
		/*
		 * ParameterizedType type = (ParameterizedType)
		 * this.getClass().getGenericSuperclass(); clazz = (Class<T>)
		 * type.getActualTypeArguments()[0];
		 */
		System.out.println("DAO的真实实现类是：" + this.clazz.getSimpleName());
	}

	@Override
	public void save(T entity) {
		try {
			session = getSession();
			session.save(entity);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(T entity) {
		try {
			session = getSession();
			session.update(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Serializable id) {
		try {
			session = getSession();
			T obj = (T) session.get(clazz, id);
			session.delete(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void partupdate(int id, String[] names, Object[] values) {
		String clazzname = clazz.getSimpleName();
		String hql = "update " + clazzname + " t set ";
		// 拼hql语句
		for (int i = 0; i < names.length; i++) {
			if (i == 0) {
				hql += "t." + names[i] + "=?";
			} else {
				hql += ",t." + names[i] + "=?";
			}
		}
		hql += " where id=" + id;
		try {
			session = getSession();
			Query query = session.createQuery(hql); // 建立执行sql 语句
			// 设置参数值
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
			query.executeUpdate(); // 执行更新

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public T findById(Serializable id) {
		T obj = null;
		try {
			session = getSession();
			obj = (T) session.get(clazz, id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public List<T> findByHql(String hql, Object... values) {
		List<T> list = null;
		try {
			session = getSession();
			Query query = session.createQuery(hql);
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
					query.setParameter(i, values[i]);
				}
			}
			list = query.list(); // 执行查询返回list

		} catch (Exception e) {
			e.printStackTrace();
		} 

		return list;
	}

	@Override
	public List<T> queryPage(String hql, int pageSize, int pageNo) {
		List<T> list = null;
		// from UserInfo
		try {
			session = getSession();
			Query query = session.createQuery(hql);
			// 设置分页参数
			query.setFirstResult((pageNo - 1) * pageSize); // limit 第1个参数
			query.setMaxResults(pageSize); // limit 第二个参数
			list = query.list(); // 执行查询返回list

		} catch (Exception e) {
			e.printStackTrace();
		} 

		return list;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 得到session对象
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Integer getCount(String hql) {
		  Integer count = 0;
	        try {
	            session = getSession();
	            Query query = session.createQuery(hql);
	            count = Integer.parseInt(query.uniqueResult().toString());
	        } catch (Exception e) {
	            // TODO: handle exception
	            System.out.println("查询总记录条数失败");
	            e.printStackTrace();
	        }
	        return count;

	}

}

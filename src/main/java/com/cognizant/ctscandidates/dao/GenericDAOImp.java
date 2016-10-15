package com.cognizant.ctscandidates.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericDAOImp<E, K extends Serializable> implements GenericDAO<E, K> {

	@Autowired
	private SessionFactory sessionFactory;

	private Class<E> entityClass;

	@SuppressWarnings("unchecked")
	public GenericDAOImp() {
		ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
		this.entityClass = (Class<E>) genericSuperclass.getActualTypeArguments()[0];
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public K save(E element) {
		return (K) sessionFactory.getCurrentSession().save(element);
	}

	@Override
	public void update(E element) {
		sessionFactory.getCurrentSession().update(element);
	}

	@Override
	public void delete(K id) {
		E element = searchById(id);
		sessionFactory.getCurrentSession().delete(element);

	}

	@SuppressWarnings("unchecked")
	@Override
	public E searchById(K id) {
		return (E) sessionFactory.getCurrentSession().get(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from " + entityClass.getName() + " obj").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> getAll(int page, int rows) {
		Query query = sessionFactory.getCurrentSession().createQuery("from " + entityClass.getName() + " obj");
		query.setFirstResult(rows * (page - 1));
		query.setMaxResults(rows);
		return query.list();
	}

	@Override
	public Long count() {
		return (Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from " + entityClass.getName() + " obj").uniqueResult();
	}

}

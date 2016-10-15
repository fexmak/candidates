package com.cognizant.ctscandidates.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO<E, K extends Serializable> {

	public K save(E element);

	public void update(E element);

	public void delete(K id);

	public E searchById(K id);

	public List<E> getAll();

	public List<E> getAll(int page, int rows);

	public Long count();
}

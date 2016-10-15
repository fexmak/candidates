package com.cognizant.ctscandidates.services;

import java.util.List;

import com.cognizant.ctscandidates.bo.Event;

public interface EventService {

	Long count();

	Long save(Event event);

	void update(Event event);

	void delete(Long id);

	Event searchById(Long id);

	List<Event> getAll();

	List<Event> getAll(int page, int rows);

	Double convertNameToDouble(String eventName);

	// add service methods

}

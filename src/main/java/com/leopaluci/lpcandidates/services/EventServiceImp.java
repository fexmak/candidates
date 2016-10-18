package com.leopaluci.lpcandidates.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leopaluci.lpcandidates.bo.Event;
import com.leopaluci.lpcandidates.dao.EventDAO;

@Service
@Transactional
public class EventServiceImp implements EventService {

	@Autowired
	private EventDAO eventDAO;

	@Override
	public Long save(Event event) {
		return eventDAO.save(event);
	}

	@Override
	public void update(Event event) {
		eventDAO.update(event);
	}

	@Override
	public void delete(Long id) {
		eventDAO.delete(id);
	}

	@Override
	public Event searchById(Long id) {
		return eventDAO.searchById(id);
	}

	@Override
	public List<Event> getAll() {
		return eventDAO.getAll();
	}

	@Override
	public List<Event> getAll(int page, int rows) {

		return eventDAO.getAll();
	}

	@Override
	public Long count() {
		return eventDAO.count();
	}

	// translates an event name to percentage to show in the
	// front end progress bar
	@Override
	public Double convertNameToDouble(String eventName) {

		eventName = eventName.toLowerCase();

		Double progress = 0.0;

		switch (eventName) {
		case "new candidate":
			progress = 20.0;
			break;
		case "first call":
			progress = 40.0;
			break;
		case "first interview":
			progress = 60.0;
			break;
		case "technical interview":
			progress = 80.0;
			break;
		case "health tests":
			progress = 100.0;
			break;

		case "hired":
			progress = 100.0;
			break;
		}

		return progress;
	}

}

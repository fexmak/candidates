package com.cognizant.ctscandidates.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.ctscandidates.bo.PossibleEvents;
import com.cognizant.ctscandidates.dao.PossibleEventsDAO;

@Service
@Transactional
public class PossibleEventsServiceImp implements PossibleEventsService {

	@Autowired
	private PossibleEventsDAO possibleEventsDAO;

	@Override
	public Long save(PossibleEvents possibleEvents) {
		return possibleEventsDAO.save(possibleEvents);
	}

	@Override
	public void update(PossibleEvents possibleEvents) {
		possibleEventsDAO.update(possibleEvents);
	}

	@Override
	public void delete(Long id) {
		possibleEventsDAO.delete(id);
	}

	@Override
	public PossibleEvents searchById(Long id) {
		return possibleEventsDAO.searchById(id);
	}

	@Override
	public List<PossibleEvents> getAll() {
		return possibleEventsDAO.getAll();
	}

	@Override
	public List<PossibleEvents> getAll(int page, int rows) {

		return possibleEventsDAO.getAll();
	}

	@Override
	public Long count() {
		return possibleEventsDAO.count();
	}
}

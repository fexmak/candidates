package com.cognizant.ctscandidates.services;

import java.util.List;

import com.cognizant.ctscandidates.bo.PossibleEvents;

public interface PossibleEventsService {

	Long count();

	Long save(PossibleEvents possibleEvent);

	void update(PossibleEvents possibleEvent);

	void delete(Long id);

	PossibleEvents searchById(Long id);

	List<PossibleEvents> getAll();

	List<PossibleEvents> getAll(int page, int rows);

}

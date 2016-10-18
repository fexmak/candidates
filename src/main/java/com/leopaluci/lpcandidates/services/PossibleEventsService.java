package com.leopaluci.lpcandidates.services;

import java.util.List;

import com.leopaluci.lpcandidates.bo.PossibleEvents;

public interface PossibleEventsService {

	Long count();

	Long save(PossibleEvents possibleEvent);

	void update(PossibleEvents possibleEvent);

	void delete(Long id);

	PossibleEvents searchById(Long id);

	List<PossibleEvents> getAll();

	List<PossibleEvents> getAll(int page, int rows);

}

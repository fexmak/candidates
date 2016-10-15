package com.cognizant.ctscandidates.services;

import java.util.List;

import com.cognizant.ctscandidates.bo.Timeline;

public interface TimelineService {

	Long save(Timeline timeline);

	void update(Timeline timeline);

	void delete(Long id);

	Timeline searchById(Long id);

	List<Timeline> getAll();

	List<Timeline> getAll(int page, int rows);

	Long count();

}

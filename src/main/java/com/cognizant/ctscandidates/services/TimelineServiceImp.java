package com.cognizant.ctscandidates.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.ctscandidates.bo.Timeline;
import com.cognizant.ctscandidates.dao.TimelineDAO;

@Service
@Transactional
public class TimelineServiceImp implements TimelineService {

	@Autowired
	private TimelineDAO timelineDAO;

	@Override
	public Long save(Timeline timeline) {
		return timelineDAO.save(timeline);
	}

	@Override
	public void update(Timeline timeline) {
		timelineDAO.update(timeline);
	}

	@Override
	public void delete(Long id) {
		timelineDAO.delete(id);
	}

	@Override
	public Timeline searchById(Long id) {
		return timelineDAO.searchById(id);
	}

	@Override
	public List<Timeline> getAll() {
		return timelineDAO.getAll();
	}

	@Override
	public List<Timeline> getAll(int page, int rows) {

		return timelineDAO.getAll();
	}

	@Override
	public Long count() {
		return timelineDAO.count();
	}

}

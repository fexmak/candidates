package com.cognizant.ctscandidates.services;

import java.util.List;

import com.cognizant.ctscandidates.bo.Quota;

public interface QuotaService {
	Long save(Quota quota);

	void update(Quota quota);

	void delete(Long id);

	Quota searchById(Long id);

	List<Quota> getAll();

	List<Quota> getAll(int page, int rows);

	Long count();

}

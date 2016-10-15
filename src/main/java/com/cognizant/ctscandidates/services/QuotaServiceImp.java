package com.cognizant.ctscandidates.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.ctscandidates.bo.Quota;
import com.cognizant.ctscandidates.dao.QuotaDAO;

@Service
@Transactional
public class QuotaServiceImp implements QuotaService {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(QuotaServiceImp.class);

	@Autowired
	private QuotaDAO quotaDAO;

	@Override
	public Long save(Quota quota) {
		return quotaDAO.save(quota);
	}

	@Override
	public void update(Quota quota) {
		quotaDAO.update(quota);
	}

	@Override
	public void delete(Long id) {
		quotaDAO.delete(id);
	}

	@Override
	public Quota searchById(Long id) {
		return quotaDAO.searchById(id);
	}

	@Override
	public List<Quota> getAll() {
		return quotaDAO.getAll();
	}

	@Override
	public List<Quota> getAll(int page, int rows) {
		return quotaDAO.getAll(page, rows);
	}

	@Override
	public Long count() {
		return quotaDAO.count();
	}

}

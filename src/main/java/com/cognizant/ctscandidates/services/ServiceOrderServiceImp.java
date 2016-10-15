package com.cognizant.ctscandidates.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.ctscandidates.bo.ServiceOrder;
import com.cognizant.ctscandidates.dao.ServiceOrderDAO;

@Service
@Transactional
public class ServiceOrderServiceImp implements ServiceOrderService {

	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(ServiceOrderServiceImp.class);

	@Autowired
	private ServiceOrderDAO serviceOrderDAO;

	@Override
	public Long save(ServiceOrder serviceOrder) {
		return serviceOrderDAO.save(serviceOrder);
	}

	@Override
	public void update(ServiceOrder serviceOrder) {
		serviceOrderDAO.update(serviceOrder);
	}

	@Override
	public void delete(Long id) {
		serviceOrderDAO.delete(id);
	}

	@Override
	public ServiceOrder searchById(Long id) {
		return serviceOrderDAO.searchById(id);
	}

	@Override
	public List<ServiceOrder> getAll() {
		return serviceOrderDAO.getAll();
	}

	@Override
	public List<ServiceOrder> getAll(int page, int rows) {
		return serviceOrderDAO.getAll(page, rows);
	}

	@Override
	public Long count() {
		return serviceOrderDAO.count();
	}

}

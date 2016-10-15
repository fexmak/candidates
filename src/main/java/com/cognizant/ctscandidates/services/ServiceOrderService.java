package com.cognizant.ctscandidates.services;

import java.util.List;

import com.cognizant.ctscandidates.bo.ServiceOrder;

public interface ServiceOrderService {

	Long save(ServiceOrder serviceOrder);

	void update(ServiceOrder serviceOrder);

	void delete(Long id);

	ServiceOrder searchById(Long id);

	List<ServiceOrder> getAll();

	List<ServiceOrder> getAll(int page, int rows);

	Long count();

}
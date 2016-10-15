package com.cognizant.ctscandidates.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.ctscandidates.bo.Quota;
import com.cognizant.ctscandidates.bo.ServiceOrder;
import com.cognizant.ctscandidates.controllers.form.ServiceOrderForm;
import com.cognizant.ctscandidates.services.QuotaService;
import com.cognizant.ctscandidates.services.ServiceOrderService;

@RequestMapping("/serviceorder")
@Controller
public class ServiceOrderController {
	
	
	@Autowired
	ServiceOrderService serviceOrderService;

	@Autowired
	QuotaService quotaService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<ServiceOrder> serviceOrders = serviceOrderService.getAll();
		model.addAttribute("serviceOrders", serviceOrders);
		return null;
	}
	

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String details(@RequestParam Long id, Model model) {
		ServiceOrder serviceOrder = serviceOrderService.searchById(id);
		List<Quota> quotas = serviceOrder.getQuotaList();
		model.addAttribute("serviceOrder", serviceOrder);
		model.addAttribute("quotas", quotas);
		return null;
	}
	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String newServiceOrder(Model model) {
		model.addAttribute("serviceOrderForm", new ServiceOrderForm());
		return null;
	}
	

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("serviceOrderForm") ServiceOrderForm serviceOrderForm, Model model) {
		
		ServiceOrder serviceOrder = new ServiceOrder();
		serviceOrder.setServiceOrderId(serviceOrderForm.getServiceOrderId());
		serviceOrder.setProyectManager(serviceOrderForm.getProyectManager());
		serviceOrder.setRecruiter(serviceOrderForm.getRecruiter());
		
		Long idActual = serviceOrderService.save(serviceOrder);
		
		return "redirect:/serviceorder/details.html?id="+idActual;
	}
	

}

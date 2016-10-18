package com.leopaluci.lpcandidates.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/home")
@Controller
public class HomeController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
 
		return null;
	}
	
	@RequestMapping(value = "*")
	public String welcome(Model model) {
	
	    return "redirect:/home/index.html";
	}
	
}
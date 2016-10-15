package com.cognizant.ctscandidates.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cognizant.ctscandidates.services.EventService;

@Controller
@RequestMapping("/events")
public class EventController {

	@Autowired
	EventService eventService;
	
}

package com.leopaluci.lpcandidates.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leopaluci.lpcandidates.services.EventService;

@Controller
@RequestMapping("/events")
public class EventController {

	@Autowired
	EventService eventService;
	
}

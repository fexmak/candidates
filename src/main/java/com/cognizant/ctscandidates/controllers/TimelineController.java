package com.cognizant.ctscandidates.controllers;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.ctscandidates.bo.Event;
import com.cognizant.ctscandidates.bo.PossibleEvents;
import com.cognizant.ctscandidates.bo.Timeline;
import com.cognizant.ctscandidates.services.PossibleEventsService;
import com.cognizant.ctscandidates.services.TimelineService;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	TimelineService timelineService;

	@Autowired
	PossibleEventsService possibleEventsService;

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String details(@RequestParam Long id, @RequestParam Long pid, Model model) {
		Timeline timeline = timelineService.searchById(id);
		List<PossibleEvents> possibleEvents = possibleEventsService.getAll();
		
		Map<String, Event> eventsWithoutStates = timeline.getEvents()
				.stream()
				.collect(Collectors.toMap(
						evt -> evt.getName(),
						evt -> evt));
		
		Map<String, String> possiblesWithStates = possibleEvents.stream()
				.collect(Collectors.toMap(
						pevt -> pevt.getName(),
						pevt -> ( eventsWithoutStates.get(pevt.getName()) != null ? "checked" : "disabled" ),
						(u, v) -> {
							throw new IllegalStateException(String.format("Duplicate key %s", u));
						},
						LinkedHashMap::new));
		
		if(pid != null)
			model.addAttribute("pid", pid);
		model.addAttribute("timeline", timeline);
		model.addAttribute("events", possiblesWithStates);
		model.addAttribute("possibleEvents", possibleEvents);
		return null;
	}

}

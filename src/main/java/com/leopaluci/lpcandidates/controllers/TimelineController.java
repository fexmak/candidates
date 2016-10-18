package com.leopaluci.lpcandidates.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leopaluci.lpcandidates.bo.Event;
import com.leopaluci.lpcandidates.bo.PossibleEvents;
import com.leopaluci.lpcandidates.bo.Quota;
import com.leopaluci.lpcandidates.bo.ServiceOrder;
import com.leopaluci.lpcandidates.bo.Timeline;
import com.leopaluci.lpcandidates.services.PossibleEventsService;
import com.leopaluci.lpcandidates.services.QuotaService;
import com.leopaluci.lpcandidates.services.TimelineService;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	TimelineService timelineService;

	@Autowired
	PossibleEventsService possibleEventsService;
	
	@Autowired
	QuotaService quotaService;

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
	
	@RequestMapping(value = "/save", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody String save(@RequestBody String t) throws JsonGenerationException,
	JsonMappingException, IOException {
		

		ObjectMapper mapper = new ObjectMapper();
		//converts JSON object date & time to java Date
		SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		mapper.setDateFormat(sf);
				
		try {
		
			System.out.println(t);
			Timeline timeline = new Timeline();
			
			timeline =  mapper.readValue(t, Timeline.class);
			System.out.println(timeline.getInitDate());
			System.out.println(timeline.getQuota().getQuotaId());
			
			Quota quota = quotaService.searchById(timeline.getQuota().getQuotaId());			
			System.out.println("Quota JobTitle is " + quota.getJobTitle());		
			timeline.setQuota(quota);
			timelineService.save(timeline);
			
			
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return null;
		
	}
}



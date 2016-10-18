package com.leopaluci.lpcandidates.bo;

import java.util.Date;

import javax.persistence.*;

@Entity
public class Event {

	@Id
	@GeneratedValue
	private Long eventId;
	private Date date;
	private String name;
	private String description;

	public Long getEventId() {
		return eventId;
	}

	public void setEventId(Long eventId) {
		this.eventId = eventId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
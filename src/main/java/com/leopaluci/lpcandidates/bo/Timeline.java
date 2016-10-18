package com.leopaluci.lpcandidates.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Timeline {

	@Id
	@GeneratedValue
	private Long timelineId;
	private Date initDate;
	private Date cancelDate;
	
	@ManyToOne
	@JoinColumn(name="quotaId")
	private Quota quota = new Quota();
	
	@OneToMany
	@JoinColumn(name="timelineId")
	private List<Event> events = new ArrayList<Event>();

	public Long getTimelineId() {
		return timelineId;
	}

	public void setTimelineId(Long timelineId) {
		this.timelineId = timelineId;
	}

	public Date getInitDate() {
		return initDate;
	}

	public void setInitDate(Date initDate) {
		this.initDate = initDate;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Quota getQuota() {
		return quota;
	}

	public void setQuota(Quota quota) {
		this.quota = quota;
	}
}
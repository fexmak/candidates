package com.leopaluci.lpcandidates.bo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Quota {

	@Id
	@GeneratedValue
	private Long quotaId;
	private Integer jobCode;
	private String jobTitle;
	private String jobGrade;
	
	@ManyToOne
	@JoinColumn(name="serviceOrderId")
	private ServiceOrder serviceOrder;

	public ServiceOrder getServiceOrder() {
		return serviceOrder;
	}

	public void setServiceOrder(ServiceOrder serviceOrder) {
		this.serviceOrder = serviceOrder;
	}

	@OneToMany(mappedBy = "quota")
	private List<Timeline> timelineList;

	public Long getQuotaId() {
		return quotaId;
	}

	public void setQuotaId(Long quotaId) {
		this.quotaId = quotaId;
	}

	public Integer getJobCode() {
		return jobCode;
	}

	public void setJobCode(Integer jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobGrade() {
		return jobGrade;
	}

	public void setJobGrade(String jobGrade) {
		this.jobGrade = jobGrade;
	}

	public List<Timeline> getTimelineList() {
		return timelineList;
	}

	public void setTimelineList(List<Timeline> timelineList) {
		this.timelineList = timelineList;
	}
}
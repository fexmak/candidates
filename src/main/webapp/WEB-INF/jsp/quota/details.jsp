<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/templates/top.jsp" />

<div class="container">
	<div class="jumbotron">
		<h4>${quota.jobGrade}, ${quota.jobTitle}</h4>
		<h5 aria-label="Left Align">
			<span class=" glyphicon glyphicon-asterisk align-left"
				aria-hidden="true"></span> Quota ID: ${quota.quotaId}
		</h5>
		<br>
		<h5 aria-label="Left Align">Job Code: ${quota.jobCode}</h5>
		<h5 aria-label="Left Align">Job Title: ${quota.jobTitle}</h5>
		<br>
		<h4 aria-label="Left Align">Current Timelines:</h4>
		<c:if test="${empty quota.timelineList}">
		<h4><small>${message}</small></h4>
		</c:if>

		<c:set var="state" value="danger" />
		<c:set var="cancelDate" value="" />
		<c:set var="currentState" value="" />
		<c:forEach items="${quota.timelineList}" var="timeline"
			varStatus="status">

						<c:choose>
							<c:when test="${not empty timeline.cancelDate}">
								<c:set var="state" value="danger" />
								<c:set var="cancelDate" value="<h5><small>Cancelled: ${timeline.cancelDate}</small></h5>" />
								<c:set var="currentState" value="This process has been cancelled." />							
							</c:when>
							<c:otherwise>
							
							
								<c:if test="${eventPercentage[status.index] == 0.0}">
								<c:set var="state" value="default" />
								<c:set var="currentState" value="No events have been added for this timeline..." />
								
							</c:if>
							<c:if test="${eventPercentage[status.index] == 100}">
								<c:set var="state" value="success" />
								<c:set var="currentState" value="Completed!" />
							</c:if>
							<c:if test="${(eventPercentage[status.index] > 0) && (eventPercentage[status.index] < 100)}">
								<c:set var="state" value="info" />
								<c:set var="currentState" value="In progress..." />
							</c:if>
														
							</c:otherwise>
						</c:choose>
						
							

			<a href="../timeline/details.html?id=${timeline.timelineId}&pid=${quota.quotaId}"><div class="panel panel-${state} timeline-panels">
				<div class="panel-heading">
					<h3 class="panel-title">Actual event is:
						${actualEvents[status.index].name}</h3>
				</div>

				<div class="panel-body">
					<div class="panel panel-primary">
						

						<div class="progress">
							<div class="progress-bar progress-bar-${state}" role="progressbar"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
								style="width: ${eventPercentage[status.index]}%;">
								${eventPercentage[status.index]}%
								</div>
						</div>
					</div>
					<h5><small>State: ${currentState}</small></h5>
					<h5><small>Started: ${timeline.initDate}</small></h5>
						
						${cancelDate}
					
				</div>
			</div></a>
		</c:forEach>


	</div>
</div>
<script src="<c:url value="/js/timeline.js"/>"></script>
<c:import url="/templates/bot.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/templates/top.jsp" />

<section class="container" id="timeline">
	<h2>Timeline</h2>
	<br>
	<div class="row main-row">
		<a class="btn btn-default" id="backButton"
			href="<c:url value="/quota/details.html?id=${ pid }"/>">
			<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
			<span>Back to Quota</span>
		</a>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-10 col-md-offset-1" id="timeLineData">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<p>Timeline ID:</p>
							<span>${ timeline.timelineId }</span>
						</div>
						<div class="col-md-3 col-md-offset-1">
							<p>Project Manager:</p>
							<span>John Doe</span>
						</div>
						<div class="col-md-3 col-md-offset-1">
							<p>Start Date:</p>
							<span>${ timeline.initDate }</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<p>Job Title:</p>
							<span>Java Programmer</span>
						</div>
						<div class="col-md-3 col-md-offset-1">
							<p>Grade:</p>
							<span>SA</span>
						</div>
						<div class="col-md-3 col-md-offset-1">
							<p>Description Form ID:</p>
							<span>10230123</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="progress" id="progressBar">
						<div class="progress-bar" id="statusBar" role="progressbar"
							style="width: 0%"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="checkboxes col-md-12" id="timelineCheckboxes">
					<div class="row">
						<c:forEach items="${ events }" var="evt" varStatus="count">
							<c:set var="eventName" value="${ possibleEvents[count.index].name }"/>
							<c:set var="eventHTMLId" value="${ possibleEvents[count.index].htmlId }"/>
							<div class="col-md-2">
								<input type="checkbox" class="progressCheckbox"
									${ evt.value }
									id="${ eventHTMLId }">
								<label>${ eventName }</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="<c:url value="/js/timeline.js"/>"></script>
<c:import url="/templates/bot.jsp" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/templates/top.jsp" />

<script>
	$(function() {

		//when adding a new timeline
		//$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });

		//$('#timelineForm').validate();	
		$('#saveChangesButton').click(function() {
			var timeline = getData();
			//    			appendData(timeline);
			saveData(timeline);
		});

		function getData() {
			// 		var idModal = $('#idIdModal').val();
			var date = formatDate(new Date);
			var currTime = new Date().toTimeString().replace(
					/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
			var qId = $
			{
				quota.quotaId
			}
			;
			var quota = {
				"quotaId" : qId,
			};
			var t = {
				// 			"idModal" : parseLong(idModal),
				"initDate" : date + " " + currTime,
				"quota" : quota,
			};
			console.log(t.initDate);
			return t;
		}

		/*function appendData(t) {
			var source = $("#template").html();
			var template = Handlebars.compile(source);
			$('#handlebarCardId').append(template(t));
		}*/

		/*function saveData(t) {

			
			var qId = ${quota.quotaId};
			$.ajax({
				
				contentType : 'application/json',
				url : "../timeline/save.html?id=" + qId,
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(t),
				complete: function(response){
					var json = JSON.parse(response.responseText);
					var thisUrl = window.location.href;
					window.location.href = thisUrl;
				}
			});
		}*/

		function saveData(t) {

			var qId = $
			{
				quota.quotaId
			}
			;
			var reqData = JSON.stringify(t);
			var reqUrl = "../timeline/save.html";
			var ajax = $.ajax({
				type : 'POST',
				contentType : 'application/json',
				url : reqUrl,
				dataType : 'json',
				data : reqData,
				complete : function(response) {
					$('.addTimeline').modal('hide');
					window.location.reload();
				}
			});
		}

		function formatDate(date) {
			var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
					+ d.getDate(), year = d.getFullYear();

			if (month.length < 2)
				month = '0' + month;
			if (day.length < 2)
				day = '0' + day;

			return [ year, month, day ].join('-');

		}

	});
</script>


<div class="container">
	<div class='page-header'>
		<h4 class="colorWhite">${quota.jobTitle},${quota.jobGrade}</h4>
	</div>
	<div class="form-group">
		<a class="btn btn-default btn-lg" id="backButton"
			href="<c:url value="/serviceorder/details.html?id=${serviceOrder.serviceOrderId}"/>">
			<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
		</a>
		<button id="addTimeline" type="button"
			class="btn btn-success btn-lg pull-right" data-toggle="modal"
			data-target=".addTimeline">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		</button>
	</div>
	<div class="jumbotron main-row">
		<h4 aria-label="Left Align">Job Code: ${quota.jobCode}</h4>
		<h5 aria-label="Left Align">Job Title: ${quota.jobTitle}</h5>
		<h5 aria-label="Left Align">Job Grade: ${quota.jobGrade}</h5>
		<br>
		<h4 aria-label="Left Align">Current Timelines:</h4>
		<c:if test="${empty quota.timelineList}">
			<h4>
				<small>${message}</small>
			</h4>
		</c:if>

		<c:set var="state" value="danger" />
		<c:set var="cancelDate" value="" />
		<c:set var="currentState" value="" />

		<!-- FOR PAGINATION -->
		<c:set var="letters" scope="session" value="${quota.timelineList}" />
		<c:set var="totalCount" scope="session"
			value="${fn:length(quota.timelineList)}" />
		<c:set var="perPage" scope="session" value="10" />
		<c:set var="pageStart" value="${param.start}" />

		<c:if test="${empty pageStart or pageStart < 0}">
			<c:set var="pageStart" value="0" />
		</c:if>
		<c:if test="${totalCount < pageStart}">
			<c:set var="pageStart" value="${pageStart - perPage}" />
		</c:if>

		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">

			<c:forEach items="${quota.timelineList}" var="timeline"
				varStatus="status" begin="${pageStart}"
				end="${pageStart + perPage - 1}">

				<div class="panel panel-default">

					<c:choose>
						<c:when test="${not empty timeline.cancelDate}">
							<c:set var="state" value="danger" />
							<c:set var="cancelDate"
								value="<h5><small>Cancelled: ${timeline.cancelDate}</small></h5>" />
							<c:set var="currentState"
								value="This process has been cancelled." />
						</c:when>
						<c:otherwise>

							<c:if test="${eventPercentage[status.index] == 0.0}">
								<c:set var="state" value="default" />
								<c:set var="currentState"
									value="No events have been added for this timeline..." />

							</c:if>
							<c:if test="${eventPercentage[status.index] == 100}">
								<c:set var="state" value="success" />
								<c:set var="currentState" value="Completed!" />
							</c:if>
							<c:if
								test="${(eventPercentage[status.index] > 0) && (eventPercentage[status.index] < 100)}">
								<c:set var="state" value="info" />
								<c:set var="currentState" value="In progress..." />
							</c:if>

						</c:otherwise>
					</c:choose>

					<div class="panel-heading" role="tab"
						id="heading${timeline.timelineId}">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapse${timeline.timelineId}"
								aria-expanded="false"
								aria-controls="collapse${timeline.timelineId}"> (Candidate
								name goes here:) ${timeline.timelineId} </a>
						</h4>
					</div>
					<div id="collapse${timeline.timelineId}"
						class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="heading${timeline.timelineId}">
						<div class="panel-body">
							<a href="../timeline/details.html?id=${timeline.timelineId}&pid=${quota.quotaId}">
								<div class="panel panel-${state} timeline-panels">
									<div class="panel-heading">
										<h3 class="panel-title">Actual event is:
											${actualEvents[status.index].name}</h3>
									</div>
									<div class="panel-body">
										<div class="panel panel-primary">

											<div class="progress">
												<div class="progress-bar progress-bar-${state}"
													role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100"
													style="width: ${eventPercentage[status.index]}%;">
													${eventPercentage[status.index]}%</div>
											</div>
										</div>
										<h5>
											<small>State: ${currentState}</small>
										</h5>
										<h5>
											<small>Started: ${timeline.initDate}</small>
										</h5>

										${cancelDate}

									</div>
								</div>
							</a>
						</div>
					</div>
				</div>

			</c:forEach>

			<nav aria-label="...">
				<ul class="pager">
					<li><a href="?id=${quota.quotaId}&start=${pageStart - 10}">Prev</a></li>
					<li><a href="?id=${quota.quotaId}&start=${pageStart + 10}">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="modal fade addTimeline" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="mySmallModalLabel">New Timeline</h4>
				</div>
				<div class="modal-body">
					<form id="timelineForm">


						<div class="form-group">
							<label for="startDate">Would you like to add a new
								timeline?</label>

						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button id="saveChangesButton" type="button"
								class="btn btn-success">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</div>
<script src="<c:url value="/js/timeline.js"/>"></script>
<c:import url="/templates/bot.jsp" />
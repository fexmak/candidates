<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:import url="/templates/top.jsp" />

<script src="<c:url value="/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/js/handlebars-v4.0.5.js"/>"></script>

<script id="template" type="text/x-handlebars-template">
		<div class="row">
		<div class="col-sm-4 col-md-4 col-md-offset-4">
			<div class="thumbnail">
				<div class="caption">
					<table class="table" id="quotaTableId">

						<tr>
							<th>Job Code</th>
							<th>Job Title</th>
							<th>Job Grade</th>
						</tr>
						<tr>
							<td>{{jobCode}}</td>
							<td>{{jobTitle}}</td>
							<td>{{jobGrade}}</td>
						</tr>
					</table>

					<a href="../quota/details.html?id=${q.quotaId}"
						class="btn btn-primary">View</a>

				</div>
			</div>
		</div>
	</div>
</script>

<script>
	// 	var quotaList=[];
	$(function() {
		$('#quotaForm').validate();	
		$('#saveChangesButton').click(function() {
			
			var quota = getData();
			// 		 	addToList(quota);
						appendData(quota);
			saveData(quota);
		});
	});


	function getData() {
		var jobCodeValue = $('#jobCodeId').val();
		var jobTitleValue = $('#jobTitleId').val();
		var jobGradeValue = $('#jobGradeId').val();

		var q = {
			"jobCode" : parseInt(jobCodeValue),
			"jobTitle" : jobTitleValue,
			"jobGrade" : jobGradeValue
		};
		return q;
	}

	function appendData(q) {
		var source = $("#template").html();
		var template = Handlebars.compile(source);
		$('#handlebarCardId').append(template(q));
	}

	// 	function addToList(q) {
	// 		quotaList.push(q);
	// 	}

	function saveData(q) {

		
		var soId = ${serviceOrder.serviceOrderId};
		
		$.ajax({
			
			contentType : 'application/json',
			url : "../quota/save.html?id=" + soId,
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(q),
			success : function(response) {
				console.log("success");
			},
			error : function() {
				console.log("error");
			}
		});


	}
</script>

<div class="container">

	<h4>ServiceOrder N* ${serviceOrder.serviceOrderId}</h4>

	<div class="form-group">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary " data-toggle="modal"
			data-target="#myModal">Add Quota</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New quota</h4>
				</div>
				<div class="modal-body">
					<form id="quotaForm">
						<div class="form-group">
							<label for="jobCodeId">Job Code</label> <input id="jobCodeId"
								type="text" class="form-control required" />
						</div>

						<div class="form-group">
							<label for="jobTitleId">Job Title</label> <input id="jobTitleId"
								type="text" class="form-control required" />
						</div>

						<div class="form-group">
							<label for="jobGradeId">Job Grade</label> <input id="jobGradeId"
								type="text" class="form-control required" />
						</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input id="saveChangesButton" type="submit" 
						class="btn btn-success" data-dismiss="modal" value="Save"></input>
				</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<c:forEach items="${quotas}" var="q">
		<div class="row">
			<div class="col-sm-4 col-md-4 col-md-offset-4">
				<div class="thumbnail">
					<div class="caption">
						<table class="table" id="quotaTableId">

							<tr>
								<th>Job Code</th>
								<th>Job Title</th>
								<th>Job Grade</th>
							</tr>
							<tr>
								<td>${q.jobCode}</td>
								<td>${q.jobTitle}</td>
								<td>${q.jobGrade}</td>
							</tr>
						</table>

						<a href="../quota/details.html?id=${q.quotaId}"
							class="btn btn-primary">View</a>

					</div>
				</div>
			</div>
		</div>

		<div id="handlebarCardId"></div>
	</c:forEach>



</div>




<c:import url="/templates/bot.jsp" />
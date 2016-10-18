<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:import url="/templates/top.jsp" />

<script src="<c:url value="/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/js/handlebars-v4.0.5.js"/>"></script>

<script>
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

	function saveData(q) {

		var soId = $('#soId').html();
		var reqData = JSON.stringify(q);
		var reqUrl = "../quota/save.html?id=" + soId;
		var ajax = $.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : reqUrl,
			dataType : 'json',
			data : reqData,
			complete : function(response) {
				$('#myModal').modal('hide');
				window.location.reload(); 
			}
		});
	}

	$(function() {

		$('#saveChangesButton').click(function(e) {
			$('#quotaForm').validate({
				success : "valid",
				rules : {
					jobCode : {
						required : true
					},
					jobTitle : {
						required : true
					},
					jobGrade : {
						required : true
					}
				},
			});
			if ($('#quotaForm').valid()) {
				var quota = getData();
				saveData(quota);
		    }
		});
	});
</script>

<div class="container">

	<div class='page-header'>
		<h4 class="colorWhite">ServiceOrder N* ${serviceOrder.serviceOrderId}</h4>
	</div>

	<div class="hidden" id="soId">${serviceOrder.serviceOrderId}</div>


	




	<div class="form-group">	
		<button type="button" class="btn btn-success btn-lg pull-right" data-toggle="modal"
			data-target="#myModal">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		</button>
	
		<a class="btn btn-default btn-lg" id="backButton"
			href="<c:url value="/serviceorder/list.html"/>">
			<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
		</a>
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
								type="text" name="jobCode" class="form-control required" />
						</div>

						<div class="form-group">
							<label for="jobTitleId">Job Title</label> <input id="jobTitleId"
								type="text" name="jobTitle" class="form-control required" />
						</div>

						<div class="form-group">
							<label for="jobGradeId">Job Grade</label> <input id="jobGradeId"
								type="text" name="jobGrade" class="form-control required" />
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

	<div class="row">
		<c:forEach items="${quotas}" var="q">
			<div class="col-sm-4 col-md-4">
				<div class="thumbnail main-row">
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
							class="btn btn-info">View</a>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>


</div>
<c:import url="/templates/bot.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:import url="/templates/top.jsp" />

<script src="<c:url value="/js/jquery.validate.js"/>"></script>

<script>
	$(function() {
		$('#serviceOrderForm').validate();
	});
</script>


<div class="container">
	<div class='page-header'>
		<h4 class="colorWhite">New Service Order</h4>
	</div>

	<div class="col-sm-8 col-md-8 col-md-offset-2">
		<div class="thumbnail main-row">
			<div class="caption">
				<form:form method="post" modelAttribute="serviceOrderForm"
					action="save.html">


					<div class="form-group">
						<label for="projectManager">Project Manager</label>
						<form:input path="projectManager" type="text"
							class="form-control required" />
					</div>

					<div class="form-group">
						<label for="recruiter">Recruiter</label>
						<form:input path="recruiter" type="text"
							class="form-control required" />
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-success" value="Next">
					</div>

				</form:form>
			</div>
		</div>
	</div>
</div>


<c:import url="/templates/bot.jsp" />
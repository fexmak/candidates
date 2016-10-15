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
	<h4>New Service Order</h4>
</div>

<div class="col-md-6 col-md-offset-2">
	<form:form method="post" modelAttribute="serviceOrderForm"
		action="save.html">


		<div class="form-group">
			<label for="proyectManager">Proyect Manager</label>
			<form:input path="proyectManager" type="text"
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


<c:import url="/templates/bot.jsp" />
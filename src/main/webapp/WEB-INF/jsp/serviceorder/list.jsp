<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/templates/top.jsp" />

<div class="container">
<div class="panel panel-default col-sm-8 col-md-8 col-md-offset-2 " >
	<div class="panel-heading">
		<h3 class="panel-title">Service Orders</h3>
	</div>
	<div class="panel-body">
		<table class="table ">
			<tr>
				<th>Id</th>
				<th>Proyect Manager</th>
				<th>Recruiter</th>
				<th></th>
			</tr>
			<c:forEach items="${serviceOrders}" var="so">
				<tr>
					<td>${so.serviceOrderId}</td>
					<td>${so.proyectManager}</td>
					<td>${so.recruiter}</td>
					<td><a href="details.html?id=${so.serviceOrderId}"
						class="btn btn-primary">View</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</div>



<c:import url="/templates/bot.jsp" />
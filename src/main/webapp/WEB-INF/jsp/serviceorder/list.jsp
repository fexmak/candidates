<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/templates/top.jsp" />

<script src="<c:url value="/js/list.js"/>"></script>

<script src="<c:url value="/js/list.pagination.min.js"/>"></script>

<script>
$(function() {
	

			var options = {
				valueNames : [ 'id', 'projectManager', 'recruiter' ],
				page : 5,
				plugins : [ ListPagination({}) ]
			};

			var userList = new List('SO', options);
});
		</script>

<div class="container">
	<div id="SO">
		<div class='page-header'>
			<div class="row">
				<div class="col-sm-9 col-md-9">
					<h4 class="colorWhite">List of Service Order</h4>
				</div>
				<div class="col-sm-3 col-md-3">
					<input class="search pull-right form-control" placeholder="Search" />
				</div>
			</div>
		</div>
		<div
			class="panel panel-default col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2 main-row">
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>Id</th>
						<th>Project Manager</th>
						<th>Recruiter</th>
						<th></th>
					</tr>
					<tbody class="list">
						<c:forEach items="${serviceOrders}" var="so">
							<tr>
								<td class="id">${so.serviceOrderId}</td>
								<td class="projectManager">${so.projectManager}</td>
								<td class="recruiter">${so.recruiter}</td>
								<td><a href="details.html?id=${so.serviceOrderId}"
									class="btn btn-info">View</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="text-center">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
</div>



<c:import url="/templates/bot.jsp" />
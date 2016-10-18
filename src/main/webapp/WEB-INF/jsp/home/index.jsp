<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/templates/top.jsp" />

<!-- <!-- Header -->
<!-- <header> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-12"> -->
<%-- 				<img class="img-responsive" src="<c:url value="/img/profile.png"/>" alt=""> --%>
<!-- 				<div class="intro-text"> -->
<!-- 					<span class="name">CTS Candidate</span> -->
<!-- 					<span class="skills">records and tracks the outcome of your job search results</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </header> -->

<!-- Portfolio Grid Section -->
<section id="portfolio">
	<div class="container">
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-12 text-center"> -->
<!-- 				<h2>Actions</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="row">
			<div class="col-sm-4 portfolio-item">
				<a href="../serviceorder/form.html" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
						<label>New Service Order</label>
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/NewServiceOrder.jpg"/>"
					class="img-responsive img-rounded" alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="../serviceorder/list.html" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
						<label>List of Service Order</label>
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/ListServiceOrder.png"/>"
					class="img-responsive img-rounded" alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="#portfolioModal3" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
						<label>Last Timeline Opened</label>
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/LastTimelineOpened.jpg"/>"
					class="img-responsive img-rounded" alt="">
				</a>
			</div>
		
		</div>
	</div>
</section>


<c:import url="/templates/bot.jsp" />
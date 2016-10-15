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
				<a href="#portfolioModal1" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/cabin.png"/>"
					class="img-responsive" alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="#portfolioModal2" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/cake.png"/>"
					class="img-responsive" alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="#portfolioModal3" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/circus.png"/>"
					class="img-responsive" alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="#portfolioModal4" class="portfolio-link"
					data-toggle="modal">
					<div class="caption">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img src="<c:url value="/img/portfolio/circus.png"/>"
					class="img-responsive" alt="">
				</a>
			</div>
		</div>
	</div>
</section>


<c:import url="/templates/modals.jsp" />

<c:import url="/templates/bot.jsp" />
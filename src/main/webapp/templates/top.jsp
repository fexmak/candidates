<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="../img/cognizant.png">
	<title>CTS Candidates</title>
	
	<!-- CSS -->
	<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/bootstrap-theme.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/jquery-ui.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/jquery-ui.structure.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/jquery-ui.theme.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/ctscandidates.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/styles.css"/>" rel="stylesheet">
	
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- Scripts -->
	<!-- jQuery -->
	<script src="<c:url value="/js/jquery.js"/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value="/js/bootstrap.js"/>"></script>
	<!-- jQuery UI -->
	<script src="<c:url value="/js/jquery-ui.js"/>"></script>
	<!-- Our Scripts -->
	<script src="<c:url value="/js/ctscandidate.js"/>"></script>
	
</head>

<body id="page-top" class="index">

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
		<img src="../img/cognizant.png" class="img-circle pull-left"
					width="50" height="50">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
			</button>
			<c:url value="/home/index.html" var="myURL"></c:url>
			<a class="navbar-brand" style="margin-left:10px" href="${myURL}">Candidates</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden">
					<a href="${myURL}"></a>
				</li>
				<li class="page-scroll">
					<a href="../serviceorder/form.html">New Service Order</a>
				</li>
				<li class="page-scroll">
					<a href="../serviceorder/list.html">List of Service Orders</a>
				</li>
				<li class="page-scroll">
					<a href="#lastTimelineOpened">Last Timeline Opened</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
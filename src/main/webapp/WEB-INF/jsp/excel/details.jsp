<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:import url="/templates/top.jsp" />

<style>
.upload-drop-zone {
	position: relative;
	/* 	text-align: right; */
	/* 	-moz-opacity: 0; */
	/* 	filter: alpha(opacity: 0); */
	opacity: 0;
	z-index: 1;
}

.drop {
	position: relative;
}

.fakefile {
	position: absolute;
	top: 0px;
	left: 0px;
	bottom: 0px;
	z-index: 0;
	width: 100%;
	padding-bottom: 100px;
}

.drop-zone {
	height: 200px;
	border-width: 2px;
	margin-bottom: 20px;
	color: #ccc;
	border-style: dashed;
	border-color: #ccc;
	line-height: 200px;
	width: 100%;
}

.push-up {
	position: relative;
	top: -125px;
}

</style>


<div class="container">
	<div class='page-header'>
		<h4 class="colorWhite">Load Excel file</h4>
	</div>
	<div class="panel panel-default col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2 main-row">
		<div class="panel-body">
			<form action="uploadFile.html" method="post"
				enctype="multipart/form-data" id="js-upload-form">
				<div class="form-group drop">
					<input type="file" name="file" id="drop-zone"
						class="upload-drop-zone drop-zone">
					<div class="fakefile text-center">
						<input class="drop-zone"> 
						<img src="../img/647702-excel-512.png" class="push-up" height="50px" width="50px" id="icon" style="display: none;"></img>
						<label class="push-up" id="filename">Drop a file here</label>
<!-- 						<p class="push-up" id="filename">Drop a file here</p> -->
					</div>
				</div>
				<button type="submit" class="btn btn-sm btn-success pull-left"
					id="js-upload-submit">Upload files</button>
			</form>
		</div>
	</div>
</div>

<script>
$(function() {
	$('#drop-zone').change(function(){
		var file = $(this).val().replace(/C:\\fakepath\\/i, '');

		$('#filename').text(file);
		$('#icon').toggle();
	});
})
</script>

<c:import url="/templates/bot.jsp" />
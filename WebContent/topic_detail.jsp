<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://v3.bootcss.com/examples/jumbotron/ -->
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/535WebDemo/favicon.ico">
<title>Topic Word Detail</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/jumbotron.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body id="body">
	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" >You can search</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="topic">Topic</a></li>
					<li><a href="./word.jsp">Word</a></li>
					<li class="active"><a href="./article.jsp">Article</a></li>
					<li>hidden element</li>
					<a class="navbar-brand" href="#"> More detail in</a>
					<li><a href="#" data-toggle="modal" data-target="#myModal">about us</a></li>
					<%@include file="about.html"%>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h2>
				<br> Topic ${index } - Words Distribution Charts!
			</h2>

			<br>
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#wordcloudChart" data-toggle="tab">
						WordCloud Chart </a></li>
				<li><a href="#columnChart" data-toggle="tab">Column Chart</a></li>
				<li><a href="#rawData" data-toggle="tab">Raw Data</a></li>
			</ul>
			<div id="myTabContent" class="tab-content" style="width:900px; margin:0 auto; ">
				<div class="tab-pane fade in active" id="wordcloudChart">
					<div class="container">
						<%@include file="cloud.html"%>
					</div>
				</div>
				<div class="tab-pane fade" id="columnChart">
					<div class="container">
						<%@include file="3dcolumn.html"%>
					</div>
				</div>
				<div class="tab-pane fade" id="rawData">
					<div class="container">
						<a href="${filepath }"><button class="btn btn-primary btn-lg ">Click
								here to download raw data</button></a>
					</div>
				</div>
			</div>
		</div>
	</div> 

	
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>

</html>

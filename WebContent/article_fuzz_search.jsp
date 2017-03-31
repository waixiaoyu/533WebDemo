<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	
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
<title>Article Search Result</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/jumbotron.css" rel="stylesheet">
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
				<a class="navbar-brand">You can search</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="topic">Topic</a></li>
					<li><a href="./word.jsp">Word</a></li>
					<li><a href="./article.jsp">Article</a></li>
					<li class="active"><a href="./fuzz.jsp">Fuzz Search</a></li>
					<li>&nbsp;&nbsp;&nbsp;</li>
					<a class="navbar-brand" href="#"> More detail in</a>
					<li><a href="#" data-toggle="modal" data-target="#myModal">about
							us</a></li>
					<%@include file="about.html"%>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>
				Welcome to our <br> Documents Analysis Platform!
			</h1>
			<p>You can input some words of titles, and see more related
				information about its article!</p>
			<form id="searchform" role="search" method="post"
				action="articleFuzzSearch">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-group-lg">
							<input type="text" id="search" name="search" class="form-control"
								required
								oninvalid="setCustomValidity('Please input a sentence!');"
								oninput="setCustomValidity('');" 
								autocomplete="off" placeholder="Searching Words">
						</div>
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-primary btn-lg "
							id="searchbtn" onclick="showspin()">Search</button>
					</div>
				</div>
				<input type="text" id="index" name="index" hidden="true">
			</form>
		</div>
	</div>
	<div class="container" >
		<a class="list-group-item active">
			<h3 class="list-group-item-heading">Your Search Sentence : <h2>&nbsp;&nbsp;${sentence}</h2></h3>
		</a>
	
		<div class="col-md-12" id="articles">
				<c:if test="${empty lAMs}">
					<hr style=' height:2px;border:none;border-top:2px solid #185598;' />  
					<a class="list-group-item active">
						<h3 class="list-group-item-heading">Sorry, there is no any relevant content !!!</h3>
					</a>                       
				</c:if>	
		
			<c:forEach items="${lAMs}" var="am" varStatus="vs">
			
				<hr style=' height:2px;border:none;border-top:2px solid #185598;' />  
				<a href="articleTopicDist?articleIndex=${am.id}" class="list-group-item active">
					<h4 class="list-group-item-heading">${am.title}</h4>
				</a> 
				<a class="list-group-item">
					<p class="list-group-item-text">${am.content }</p>
				</a>
				<div class="list-group-item">
					<div class="btn-group" data-toggle="buttons">
						<button type='submit' class='btn btn-primary'>Mean Sim: ${am.meanScore }</button>
						&nbsp;
						 <button type='submit' class='btn btn-primary'>Max Sim:${am.maxScore } </button>
					</div>
				</div>
			</c:forEach> 
		</div>

		<hr>
		<footer> </footer>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/showspin.js"></script>
	<script src="js/spin.js"></script>
</body>

</html>

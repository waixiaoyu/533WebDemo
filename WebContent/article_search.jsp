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
					<li class="active"><a href="./article.jsp">Article</a></li>
					<li><a href="./fuzz.jsp">Fuzz Search</a></li>
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
				action="articleSearch">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-group-lg">
							<input type="text" id="search" name="search" class="form-control"
								required
								oninvalid="setCustomValidity('Please input some key words!');"
								oninput="setCustomValidity('');" data-provide="typeahead"
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
	<div class="container">
		<div class="col-md-12">
			<a href="articleTopicDist?articleIndex=${articleIndex}"
				class="list-group-item active">
				<h4 class="list-group-item-heading">${title}</h4>
			</a> <a class="list-group-item">
				<p class="list-group-item-text">${content }</p>
			</a>
			<div class="list-group-item">
				<div class="btn-group" data-toggle="buttons">
					<form id="topicdetailform" action="topicDetail" method="post">
						<input type="text" id="topicindex" name="topicindex" value=""
							hidden="true">
					</form>
				</div>
			</div>
		</div>

		<hr>
		<footer> </footer>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="./js/Bootstrap-3-Typeahead-master/bootstrap3-typeahead.js"></script>
	<script src="js/showspin.js"></script>
	<script src="js/spin.js"></script>
	<script type="text/javascript">
		$.get('data/title-id.json', function(data) {
			$("#search").typeahead({
				source : data
			});
		}, 'json');

		var $input = $('#search');
		$input.change(function() {
			var current = $input.typeahead("getActive");
			//alert(current.index)
			if (current) {
				document.getElementById("index").value = current.index;
				if (current.name == $input.val()) {
					// This means the exact match is found. Use toLowerCase() if you want case insensitive match.
				} else {
					// This means it is only a partial match, you can either add a new item 
					// or take the active if you don't want new items
				}
			} else {
				// Nothing is active so it is a new value (or maybe empty value)
			}
		});
		$(function() {

			var index = ${topicIndex}
			var pr = ${topicPr}

			for (var i = 0; i < index.length; i++) {
				var btn = $("<div class='col-md-3'><button type='submit' class='btn btn-primary' id='Btn"
						+ i
						+ "' onclick='change("
						+ index[i]
						+ ")'>Topic "
						+ index[i] + ": " + pr[i] + "</button></div>");
				$("#topicdetailform").append(btn);

			}
		});

		function change(value) {
			$("#topicindex").val(value)
			$("#topicdetailform").submit()
		}
	</script>
</body>

</html>

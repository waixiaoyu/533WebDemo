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
<title>Topic List</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/jumbotron.css" rel="stylesheet">
</head>

<body>
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
					<li class="active"><a href="topic">Topic</a></li>
					<li><a href="./word.jsp">Word</a></li>
					<li><a href="./article.jsp">Article</a></li>
					<li><a href="./fuzz_search.jsp">Fuzz Search</a></li>
					<li>&nbsp;&nbsp;&nbsp;</li>
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
			<div class="container">

				<a class="list-group-item active">
					<h2 class="list-group-item-heading">We have ${topicNumber } topics !<p><p> You can click the title to see detail information about each topic.</h2>
				</a>
				<hr
					style='height: 2px; border: none; border-top: 2px dotted #185598;' />
				<div class="col-md-12" id="topiclist">

					<!--<a class="list-group-item">
				<p class="list-group-item-text"></p>
			</a>-->
				</div>

				<hr>
				<footer> </footer>
			</div>

		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/Bootstrap-3-Typeahead-master/bootstrap3-typeahead.js"></script>
	<script type="text/javascript">
	var topicNumber=${topicNumber}
	if(topicNumber>0)
		{
	$.get('topic_list.json', function(data) {
		$.each(data, function(infoIndex, info) {
			var index = info["index"];
			var head = $("<a href='topicDetail?topicindex="+index+"' class='list-group-item active'><h4 class='list-group-item-heading'>Topic "+index+"</h4></a>");
			$("#topiclist").append(head);
			var value_string="";
			for (i in info["value"]) {
				value_string+=info["value"][i].word+", "
			}
			value_string=value_string.substr(0,value_string.length-2);
			var content = $("<a class='list-group-item'><p class='list-group-item-text'>Keywords:    "+value_string+"</p></a>");
			$("#topiclist").append(content);
			var hr = $("<hr style=' height:2px;border:none;border-top:2px solid #185598;' />");
			$("#topiclist").append(hr);
		})
	}, 'json');}
	</script>
</body>

</html>

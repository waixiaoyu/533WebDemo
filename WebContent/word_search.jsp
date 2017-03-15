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
<title>Word Search Result</title>
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
				<a class="navbar-brand" >You can search</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="topic">Topic</a></li>
					<li class="active"><a href="./word.jsp">Word</a></li>
					<li><a href="./article.jsp">Article</a></li>
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
			<h1>
				Welcome to our <br> Documents Analysis Platform!
			</h1>
			<p>You can input some words of titles, and see more related
				information about its article! The result shows that the word has more than 1% probability in every corresponding topic.</p>
			<form id="searchform" role="search" method="post" action="wordSearch">
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
						<button type="submit" class="btn btn-primary btn-lg "
							id="searchbtn" onclick="showspin()">Search</button>
					</div>
				</div>
				<input type="text" id="index" name="index" hidden="true">
			</form>
		</div>
	</div>
	<div class="container">

		<a class="list-group-item active">
			<h4 class="list-group-item-heading">Your input word is "${inputWord}", ${topicSentence }</h4>
		</a>
		<hr style='height: 2px; border: none; border-top: 2px dotted #185598;' />
		<div class="col-md-12" id="wordcontent">

			<!--<a class="list-group-item">
				<p class="list-group-item-text">${content }</p>
			</a>-->
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
	<script src="js/spin.js"></script>
	<script src="js/showspin.js"></script>
	<script type="text/javascript">
		$.get('data/word-id.json', function(data) {
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
		var topicNumber=${topicNumber}
		if(topicNumber>0)
			{
		$.get('word_search.json', function(data) {
			$.each(data, function(infoIndex, info) {
				var index = info["index"];
				var head = $("<a class='list-group-item active'><h4 class='list-group-item-heading'>Topic "+index+"</h4></a>");
				$("#wordcontent").append(head);
				var value_string="";
				for (i in info["value"]) {
					value_string+=info["value"][i].word+", "
				}
				value_string=value_string.substr(0,value_string.length-2);
				var content = $("<a class='list-group-item'><p class='list-group-item-text'>"+value_string+"</p></a>");
				$("#wordcontent").append(content);
				var hr = $("<hr style=' height:2px;border:none;border-top:2px solid #185598;' />");
				$("#wordcontent").append(hr);
			})
		}, 'json');}
	</script>
</body>

</html>

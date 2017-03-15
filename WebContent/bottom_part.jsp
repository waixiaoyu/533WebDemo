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
<link rel="icon" href="http://v3.bootcss.com/favicon.ico">

<title>Demo</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/jumbotron.css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-4">
				<h2>Topics Distribution</h2>
				<p>This is a topic list and top 10 frequency words under this topic can be shown.</p>
				<p>
					<a class="btn btn-default" href="topic" role="button">View
						details </a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Words Distribution</h2>
				<p>Given a word query, the related topics which contains the word can be shown. For example, if you input key word "oil", you can see it belongs to 5 topics.</p>
				<p>
					<a class="btn btn-default" href="wordSearch?index=30921"
						role="button">View details </a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Articles Distribution</h2>
				<p>Given a title query, the topics which the article might be clustered to can be shown. For example, if you input key word "BAHIA COCOA REVIE", you can see it belongs to 5 topics.</p>
				<p>
					<a class="btn btn-default" href="articleSearch?index=0&search=BAHIA COCOA REVIEW"
						role="button">View details </a>
				</p>
			</div>
		</div>

		<hr>

		<footer> </footer>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/Bootstrap-3-Typeahead-master/bootstrap3-typeahead.js"></script>

</body>
</html>
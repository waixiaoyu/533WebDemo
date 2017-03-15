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

<body id="body">
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
								data-provide="typeahead" autocomplete="off"
								placeholder="Searching Words">
						</div>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-primary btn-lg "
							id="searchbtn">Search</button>
					</div>
				</div>
				<input type="text" id="index" name="index" hidden="true">


			</form>
		</div>
	</div>
	
	<div class="container">
		<div class="col-md-12">
			<a href="#" class="list-group-item active">
				<h4 class="list-group-item-heading">title</h4>
			</a> <a class="list-group-item">
				<p class="list-group-item-text">content</p>
			</a>
			<div class="list-group-item">
				<div class="btn-group" data-toggle="buttons">
					<form id="topicdetailform" action="topicDetail" method="post">
						<div class="col-md-3">
							<button type='submit' class='btn btn-primary' id='1'>Topic
								1:100</button>
						</div>
						<div class="col-md-3">
							<button type='submit' class='btn btn-primary' id='1'>Topic
								1:100</button>
						</div>
						<div class="col-md-3">
							<button type='submit' class='btn btn-primary' id='1'>Topic
								1:100</button>
						</div>
						<div class="col-md-3">
							<button type='submit' class='btn btn-primary' id='1'>Topic
								1:100</button>
						</div>
						 <input type="text" id="topicindex" name="topicindex" value=""
							hidden="true">
					</form>
				</div>
			</div>
		</div>
		</div>
		<button value="spin" onclick="showspin()">spin</button>
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/spin.js"></script>
		<script
			src="./js/Bootstrap-3-Typeahead-master/bootstrap3-typeahead.js"></script>
			<script type="text/javascript">
			function showspin()
			{
				var opts = {
						  lines: 13, // The number of lines to draw
						  length: 7, // The length of each line
						  width: 4, // The line thickness
						  radius: 10, // The radius of the inner circle
						  corners: 1, // Corner roundness (0..1)
						  rotate: 0, // The rotation offset
						  color: '#000', // #rgb or #rrggbb
						  speed: 1, // Rounds per second
						  trail: 60, // Afterglow percentage
						  shadow: false, // Whether to render a shadow
						  hwaccel: false, // Whether to use hardware acceleration
						  className: 'spinner', // The CSS class to assign to the spinner
						  zIndex: 2e9, // The z-index (defaults to 2000000000)
						  top: 'auto', // Top position relative to parent in px
						  left: 'auto' // Left position relative to parent in px
						};
						var target = document.getElementById('body');
						var spinner = new Spinner(opts).spin(target);
						var spinner = new Spinner().spin();
						target.appendChild(spinner.el);
			}
			
			</script>
</body>

</html>

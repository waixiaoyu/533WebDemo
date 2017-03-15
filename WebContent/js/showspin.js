function showspin() {
	if(document.getElementById("search").value!="") {
		var opts = {
			lines : 13, // The number of lines to draw
			length : 7, // The length of each line
			width : 4, // The line thickness
			radius : 10, // The radius of the inner circle
			corners : 1, // Corner roundness (0..1)
			rotate : 0, // The rotation offset
			color : '#000', // #rgb or #rrggbb
			speed : 1, // Rounds per second
			trail : 60, // Afterglow percentage
			shadow : false, // Whether to render a shadow
			hwaccel : false, // Whether to use hardware acceleration
			className : 'spinner', // The CSS class to assign to the spinner
			zIndex : 2e9, // The z-index (defaults to 2000000000)
			top : 'auto', // Top position relative to parent in px
			left : 'auto' // Left position relative to parent in px
		};
		var target = document.getElementById('body');
		// var spinner = new Spinner(opts).spin(target);
		var spinner = new Spinner().spin();
		target.appendChild(spinner.el);
		document.getElementById("search").readonly = "readonly";
		document.getElementById("searchbtn").disabled = "true";
		document.getElementById("searchform").submit();
	} 
}
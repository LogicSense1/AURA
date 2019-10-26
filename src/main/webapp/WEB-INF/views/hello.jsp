<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>ARUA</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="../resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/animate.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/aos.css">
<link rel="stylesheet" href="../resources/css/ionicons.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="../resources/css/flaticon.css">
<link rel="stylesheet" href="../resources/css/icomoon.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<script src="/elec5619/resources/js/jquery.min.js"></script>
<script src="/elec5619/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/elec5619/resources/js/jquery.easing.1.3.js"></script>
<script src="/elec5619/resources/js/jquery.animateNumber.min.js"></script>
<script src="/elec5619/resources/js/jquery.timepicker.min.js"></script>
<script src="/elec5619/resources/js/jquery.waypoints.min.js"></script>
<script src="/elec5619/resources/js/jquery.stellar.min.js"></script>
<script src="/elec5619/resources/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzOablY1uPpncQ49oiU5i93gPZ2jWTjeA&libraries=places"></script>
<script type="text/javascript">
	function showTip(element, location, latitude, longitude) {
		var locationURL = encodeURI(location);
		element.style.backgroundImage = "url(https://maps.googleapis.com/maps/api/staticmap?center=" + locationURL + "&zoom=16&size=600x400&maptype=roadmap&markers=color:blue%7Clabel:S%7C" + latitude + "," + longitude + "&key=AIzaSyCzOablY1uPpncQ49oiU5i93gPZ2jWTjeA)";
	}
	function closeTip(element) {
		var id = element.id;
		element.style.backgroundImage = "url('../resources/images/house-" + id + "-0.jpg')";
	}
	function searchHouse() {
		var startD = new Date(document.getElementById("start_date").value);
		var endD   = new Date(document.getElementById("end_date").value); 
		if (document.getElementById("locationSearch").value == "" || document.getElementById("start_date").value == "" || document.getElementById("end_date").value == "" || document.getElementById("number").value == "")
			alert("Please fill all blanks");
		else if (startD >= endD) {alert("You must check out AFTER you check in"); document.getElementById("start_date").value = ""; document.getElementById("end_date").value = "";}
		else
			window.location.href='../product/search='+ document.getElementById("locationSearch").value.replace(", Australia","") + '+' + encodeURI(document.getElementById("start_date").value) + '+' + encodeURI(document.getElementById("end_date").value) + '+' + document.getElementById("number").value + "/index=1";
	}
</script>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/elec5619/hello.html"
				style="font-family: speedtest">A U R A</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<script>
						if ("${model.status}" == "notlogin") {
							document.write("<li class=\"nav-item\"><a href=\"/elec5619/user/login\" class=\"nav-link\">Login</a></li>");
							console.log("${model.status}");
						}
						else {
							document.write("<li class=\"nav-item dropdown nav-item show\">" +
								    "        <a href=\"/elec5619/myaccount/home\" class=\"profile-photo dropdown-toggle nav-link\" data-toggle=\"dropdown\" aria-expanded=\"true\">${model.status}" +
								    "            <div class=\"ripple-container\"></div></a>" +
								    "        <div class=\"dropdown-menu dropdown-menu-right\" style=\"margin-top: -10px;\">" +
								    "            <a href=\"/elec5619/myaccount/myprofile\" class=\"dropdown-item\">My Profile<div class=\"ripple-container\"></div></a>" +
								    "            <a href=\"/elec5619/myaccount/myorder\" class=\"dropdown-item\">My House & Order</a>" +
								    "            <a href=\"/elec5619/product/add\" class=\"dropdown-item\">Host a new house</a>" +
								    "            <a href=\"/elec5619/user/logout\" class=\"dropdown-item\">Sign out</a></div></li>")
							console.log("${model.status}");
						}
					</script>
				</ul>
			</div>
		</div>
	</nav>


	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('../resources/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5"></div>
				<div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">
					<form action="#" class="request-form ftco-animate">
						<h2>Make your order</h2>
						<div class="form-group">
							<label for="" class="label">Where</label> <input type="text"
								class="form-control" placeholder="Anywhere" id="locationSearch">
							<script>
					var options = { 
					     types: ["(cities)"], 
					     componentRestrictions: {country: "au"}, 
					     language: "en" 
					    }; 
            		var autocomplete = new google.maps.places.Autocomplete($("#locationSearch")[0], options);
					google.maps.event.addListener(autocomplete, 'place_changed', function() {
                	var place = autocomplete.getPlace();
                	console.log(place);
            		})
       			</script>
						</div>
						<div class="d-flex">
							<div class="form-group mr-2">
								<label for="" class="label">Check-in</label> <input type="date"
									class="form-control" id="start_date" placeholder="Date">
							</div>
							<div class="form-group ml-2">
								<label for="" class="label">Checkout</label> <input type="date"
									class="form-control" id="end_date" placeholder="Date">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="label">Number of residents</label> <input
								type="number" class="form-control" id="number"
								placeholder="Number">
						</div>
						<div class="form-group">
							<input type="button" value="Search House"
								class="btn btn-primary py-3 px-4" onclick=searchHouse()>
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<span>Found <span id="count"><c:out
						value="${model.count}" /></span> <script>if (${model.count} > 1) document.write("Results"); else document.write("Result");</script></span>
			<div>
				<br>
			</div>
			<div class="row">
				<c:forEach items="${model.products}" var="prod">
					<div class="col-md-3">
						<div class="car-wrap ftco-animate">
							<div class="img d-flex align-items-end" id="${prod.ID}"
								style="background-image: url(../resources/images/house-${prod.ID}-0.jpg);">
								<div class="price-wrap d-flex">
									<span class="rate">$<c:out value="${prod.price}" /></span>
									<p class="from-day">
										<span>From</span> <span>/Week</span>
									</p>
								</div>
							</div>
							<div class="text p-4 text-left">
								<span><c:out value="${prod.houseType}" /> · <c:out
										value="${prod.numberOfRooms}" /> <script
										type="text/javascript"> if (${prod.numberOfRooms} > 1) document.write("Rooms"); else document.write("Room");</script>
								</span>
								<h2 class="mb-0">
									<a href="/elec5619/house/${prod.ID}"><c:out value="${prod.name}" /></a>
								</h2>
								<span
									onmousemove="showTip(document.getElementById(${prod.ID}), '\${prod.location}', ${prod.latitude}, ${prod.longitude})"
									onmouseout="closeTip(document.getElementById(${prod.ID}))">
									<c:out value="${prod.location}" />
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">

						<script>
              		document.write("<ul>");
              		const i = document.getElementById("count").innerText;
              		for (let j = 1; j < Math.ceil(i/8) + 1 ; j++) {
              			if (document.URL.split("index=")[1] == j)
              				document.write("<li style = \"padding-right: 10px;\" class=\"active\"><span>" + j + "</span></li><span>");
              			else
              		    	document.write("<li style = \"padding-right: 10px;\"><a href=\"./index=" + j + "\">" + j + "</a></li>");
              		}
              		document.write("</ul>");
              	</script>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About AURA</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear())</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.easing.1.3.js"></script>
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<script src="../resources/js/jquery.stellar.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/aos.js"></script>
	<script src="../resources/js/jquery.animateNumber.min.js"></script>
	<script src="../resources/js/bootstrap-datepicker.js"></script>
	<script src="../resources/js/jquery.timepicker.min.js"></script>
	<script src="../resources/js/scrollax.min.js"></script>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="../resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="../resources/js/core/bootstrap-material-design.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/plugins/moment.min.js"></script>
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script src="../resources/js/plugins/bootstrap-datetimepicker.js"
		type="text/javascript"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../resources/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="../resources/js/material-kit.js?v=2.0.6"
		type="text/javascript"></script>
</body>
</html>
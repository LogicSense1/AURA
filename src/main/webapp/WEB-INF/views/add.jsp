<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new product on this page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/elec5619/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/elec5619/resources/css/animate.css">

<link rel="stylesheet"
	href="/elec5619/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/elec5619/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/elec5619/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/elec5619/resources/css/aos.css">

<link rel="stylesheet" href="/elec5619/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="/elec5619/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/elec5619/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/elec5619/resources/css/flaticon.css">
<link rel="stylesheet" href="/elec5619/resources/css/icomoon.css">
<link rel="stylesheet" href="/elec5619/resources/css/style.css">
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
	function upload() {
		if (document.getElementById("name").value == "" || document.getElementById("start").value == "" || document.getElementById("end").value == "" || document.getElementById("price").value == ""|| document.getElementById("location").value == ""|| document.getElementById("rooms").value == ""|| document.getElementById("park").value == ""|| document.getElementById("type").value == ""|| document.getElementById("description").value == "")
			alert("Please fill all blanks");
		else document.getElementById("newhouse").submit();
	}
</script>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar" style="padding: 0">
	<div class="container">
		<a class="navbar-brand" href="/elec5619/hello.html" style="color: black; font-family: speedtest">A R U A</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<script>
						if ("${userid}" == "notlogin") {
							document.write("<li class=\"nav-item\"><a href=\"/elec5619/user/login\" class=\"nav-link\ style=\"color:black\">Login</a></li>");
							console.log("${userid}");
						}
						else {
							document.write("<li class=\"nav-item dropdown nav-item show\">" +
								    "        <a href=\"/elec5619/myaccount/home\" class=\"profile-photo dropdown-toggle nav-link\" data-toggle=\"dropdown\" aria-expanded=\"true\" style=\"color:black\">${userid}" +
								    "            <div class=\"ripple-container\"></div></a>" +
								    "        <div class=\"dropdown-menu dropdown-menu-right\" style=\"margin-top: -10px;\">" +
								    "            <a href=\"/elec5619/myaccount/myprofile\" class=\"dropdown-item\">My Profile<div class=\"ripple-container\"></div></a>" +
								    "            <a href=\"/elec5619/myaccount/myorder\" class=\"dropdown-item\">My House & Order</a>" +
								    "            <a href=\"/elec5619/product/add\" class=\"dropdown-item\">Host a new house</a>" +
								    "            <a href=\"/elec5619/user/logout\" class=\"dropdown-item\">Sign out</a></div></li>")
							console.log("${userid}");
						}
					</script>
				</ul>
			</div>
	</div>
	</nav>
	<!-- END nav -->
	<section class="ftco-section contact-section" style="padding-top:5em">
	<div class="row block-9 justify-content-center mb-5">
		<div class="col-md-8 mb-md-5">
			<h2 class="text-center">
				Hello landlord, <br> you can rent a new house!
			</h2>
			<form action="add" method="post" id="newhouse"
				class="bg-light p-5 contact-form">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="House Name"
						name="name" id="name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Location"
						name="location" id="location">
						<script>
					var options = {
					     componentRestrictions: {country: "au"}, 
					     language: "en" 
					    }; 
            		var autocomplete = new google.maps.places.Autocomplete($("#location")[0], options);
					google.maps.event.addListener(autocomplete, 'place_changed', function() {
                	var place = autocomplete.getPlace();
                	console.log(place);
            		})
       			</script>
						
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Price"
						name="price" id="price">
				</div>
				<div class="form-group">
					<p style="font-size: 12px; margin-bottom: -1px; margin-top: -9px;">
						Available Start Date
						<script>
							for (var i = 1; i < 167; i++) {
								document.write("&nbsp;");
							}
						</script>
						Available End Date
					</p>
					<input type="date" class="form-control"
						placeholder="Available Start Date"
						style="width: 47%; float: left; margin-bottom: 1rem;" name="start" id="start"><input
						type="date" class="form-control"
						style="width: 47%; float: right; margin-bottom: 1rem;" name="end" id="end">
				</div>
				<div class="form-group">
					<input type="number" class="form-control"
						placeholder="Number of room"
						style="width: 30%; float: left; margin-bottom: 1rem;" name="rooms" id="rooms"><input
						type="number" class="form-control"
						placeholder="Number of parking spaces"
						style="width: 30%; float: left; margin-bottom: 1rem; margin-left: 60px;"
						name="park" id="park"><input type="text" class="form-control"
						placeholder="House type"
						style="width: 30%; float: left; margin-bottom: 1rem; margin-left: 55px;"
						list="typelist" name="type" id="type">
					<datalist id="typelist">
					<option value="House">House</option>
					<option value="Apartment">Apartment</option>
					<option value="Unit">Unit</option>
					<option value="Studio">Studio</option>
					<option value="Town">Town</option>
					</datalist>
				</div>
				<div class="form-group">
					<textarea name="description" cols="30" rows="7"
						class="form-control" placeholder="Description" name="description" id="description"></textarea>
				</div>
				<div class="form-group">
					<input type="button" value="Add" onclick="upload();"
						class="btn btn-primary py-3 px-5">
				</div>
			</form>
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



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="/elec5619/resources/js/jquery.min.js"></script>
	<script src="/elec5619/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/elec5619/resources/js/popper.min.js"></script>
	<script src="/elec5619/resources/js/bootstrap.min.js"></script>
	<script src="/elec5619/resources/js/jquery.easing.1.3.js"></script>
	<script src="/elec5619/resources/js/jquery.waypoints.min.js"></script>
	<script src="/elec5619/resources/js/jquery.stellar.min.js"></script>
	<script src="/elec5619/resources/js/owl.carousel.min.js"></script>
	<script src="/elec5619/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/elec5619/resources/js/aos.js"></script>
	<script src="/elec5619/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/elec5619/resources/js/bootstrap-datepicker.js"></script>
	<script src="/elec5619/resources/js/jquery.timepicker.min.js"></script>
	<script src="/elec5619/resources/js/scrollax.min.js"></script>
	<script src="/elec5619/resources/js/main.js"></script>
</body>
</html>
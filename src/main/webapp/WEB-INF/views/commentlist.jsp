<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page session="false"%>
<html>
<head>
<title>House Details</title>
<meta charset="utf-8">
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
<script>
		function gofullscreen(myimg) {
			var model = document.getElementById("mymodel");
			var modelImg = document.getElementById("mymodelImg");
			var img = document.getElementById(myimg);
			model.style.display = "block";
			modelImg.src = img.dataset.image;
		}
		function order(){
			var startD = new Date(document.getElementById("start").value);
			var endD   = new Date(document.getElementById("end").value); 
			var avaSD = new Date("${house.availableStartTime}");
			var avaED = new Date("${house.availableEndTime}");
			if (document.getElementById("start").value == "" || document.getElementById("end").value == "")
				alert("Please fill all blanks");
			else if (startD >= endD) {alert("You must check out AFTER you check in"); document.getElementById("start_date").value = ""; document.getElementById("end_date").value = "";}
			else if (startD < avaSD || endD > avaED) {alert("This time period is not avaliable!"); document.getElementById("start_date").value = ""; document.getElementById("end_date").value = "";}
			else
				window.location.href= "/elec5619/house/order=" + "${house.ID}" + "+" + document.getElementById("start").value + "+" + document.getElementById("end").value;	
		}
	</script>
<style>
/* Set the size of the div elem600ent that contains the map */
#map {
	height: 700px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>


</head>


<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html" style="color: black">A
				R U A</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<script>
					if ("${model.status}" == "notlogin") {
						document.write("<li class=\"nav-item\"><a href=\"/elec5619/user/login\" class=\"nav-link\ style=\"color:black\">Login</a></li>");
						console.log("${model.status}");
					}
					else {
						document.write("<li class=\"nav-item dropdown nav-item\">" +
							    "        <a href=\"/elec5619/myaccount/home\" class=\"profile-photo dropdown-toggle nav-link\" data-toggle=\"dropdown\" aria-expanded=\"true\" style=\"color:black\">${model.status}" +
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
	<!-- END nav -->

	<section>
		<div class="tiles">
			<div class="tile" data-scale="1.25" id="image1"
				data-image="/elec5619/resources/images/house-${house.ID}-0.jpg"
				onclick="gofullscreen('image1')"></div>
			<div class="tile" data-scale="1.25" id="image2"
				data-image="/elec5619/resources/images/house-${house.ID}-1.jpg"
				onclick="gofullscreen('image2')"></div>
			<div class="tile" data-scale="1.25" id="image3"
				data-image="/elec5619/resources/images/house-${house.ID}-2.jpg"
				onclick="gofullscreen('image3')"></div>
		</div>
		<div id="mymodel" class="modal" style="padding-top: 40px;">
			<span class="close"
				onclick="document.getElementById('mymodel').style.display = 'none';">&times;</span>
			<img class="model-content" id="mymodelImg">
		</div>
	</section>


	<section class="ftco-section ftco-car-details"
		style="padding: 32em 0 0">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details">

						<div class="text text-center">
							<span class="subheading">${house.location}</span>
							<h2>${house.name}</h2>
							<span class="subheading"><c:out value="${house.houseType}" />
								· <c:out value="${house.numberOfRooms}" /> <script
									type="text/javascript"> if (${house.numberOfRooms} > 1) document.write("Rooms"); else document.write("Room");</script>
								· $${house.price}/week · <c:if
									test="${house.parkingAvailable!=0}">Parking Available</c:if> <c:if
									test="${house.parkingAvailable==0}">Parking Not Available</c:if>
							</span>
							<script>
								var avaSD = new Date("${house.availableStartTime}");
								var avaED = new Date("${house.availableEndTime}");
								document.write("<span style=\"color: black; font-size: 15px;\"class=\"subheading\">Available from " + avaSD.toLocaleDateString() + " to " + avaED.toLocaleDateString() + "</span>");
							</script>
							
							<div style="padding-top: 30px;width: 60%;margin-left: 20%;">
								<p
									style="font-size: 12px; margin-bottom: -1px; margin-top: -9px;">
									Order Start Date
									<script>
							for (var i = 1; i < 130; i++) {
								document.write("&nbsp;");
							}
						</script>
									Order End Date
								</p>
								<input type="date" class="form-control"
									placeholder="Available Start Date"
									style="width: 47%; float: left; margin-bottom: 1rem;"
									name="start" id="start"><input type="date"
									class="form-control"
									style="width: 47%; float: right; margin-bottom: 1rem;"
									name="end" id="end">
							
								<input type="button" value="Order"
									class="btn btn-primary py-3 px-5" onclick="order();">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: -20px;">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

								<!--<li class="nav-item">
                                <a class="nav-link active" id="pills-description-tab" data-toggle="pill"
                                   href="#pills-description" role="tab" aria-controls="pills-description"
                                   aria-expanded="true">Features</a>-->

								</li>
								<li class="nav-item"><a class="nav-link active"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">Description</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-review-tab" data-toggle="pill" href="#pills-review"
									role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
								</li>
							</ul>
						</div>

						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade" id="pills-description" role="tabpanel"
								aria-labelledby="pills-description-tab">
								<div class="row">
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Airconditions</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Child
												Seat</li>
											<li class="check"><span class="ion-ios-checkmark"></span>GPS</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Luggage</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Music</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Seat
												Belt</li>
											<li class="remove"><span class="ion-ios-close"></span>Sleeping
												Bed</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Bluetooth</li>
											<li class="remove"><span class="ion-ios-close"></span>Onboard
												computer</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Audio
												input</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Long
												Term Trips</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Car
												Kit</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Remote
												central locking</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Climate
												control</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="tab-pane fade show active" id="pills-manufacturer"
								role="tabpanel" aria-labelledby="pills-manufacturer-tab">
								<p>${house.description}</p>

								<div id="map"></div>
								<script>
    									// Initialize and add the map
    								function initMap() {
        								// The location of Uluru-33.891608, 151.184487
        							var uluru = {lat: ${house.latitude}, lng: ${house.longitude}};
        								// The map, centered at Uluru
        							var map = new google.maps.Map(
           							 document.getElementById('map'), {zoom: 16, center: uluru});
        							// The marker, positioned at Uluru
        							var marker = new google.maps.Marker({position: uluru, map: map});
    								}
								</script>
							</div>

							<div class="tab-pane fade" id="pills-review" role="tabpanel"
								aria-labelledby="pills-review-tab">

								<div class="side-bar">
									<div class="side-bar-top">
										<a href="/elec5619/house/info/${house.ID}">Add a new
											comment</a>
									</div>
									<div class="side-bar-bottom"></div>
								</div>


								<!------------------------------------------------------------------------------------------------------------>
								<div class="row">
									<div class="col-md-7">
										<c:forEach items="${model.comments}" var="prodd">
											<div class="review d-flex">
												<div class="user-img"
													style="background-image: url(elec5619/resources/images/${prodd.userId}.jpg)"></div>
												<div class="desc">
													<h4>
														<span class="text-left"><c:out
																value="${prodd.userId}" /></span> <span class="text-right"><c:out
																value="${prodd.time}" /></span>
													</h4>
													<p>
														<script>
                                            if (${prodd.score} == 5) {
                                            	document.write("<span class=\"star\"  id=\"star5\">" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 </span-->");
											}
											else if(${prodd.score} == 4){
												document.write("<span class=\"star\"  id=\"star5\">" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 </span-->");
											}
											else if(${prodd.score} == 3){
												document.write("<span class=\"star\"  id=\"star5\">" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 </span-->");
											}
											else if(${prodd.score} == 2){
												document.write("<span class=\"star\"  id=\"star5\">" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 </span-->");
											}
											else {
												document.write("<span class=\"star\"  id=\"star5\">" +
                                            		    "                                 <i class=\"ion-ios-star\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 <i class=\"ion-ios-star-outline\"></i>" +
                                            		    "                                 </span-->");
											}
                                            </script>


													</p>
													<p>
														<c:out value="${prodd.content}" />
													</p>
												</div>
											</div>
										</c:forEach>


									</div>
								</div>
							</div>
						</div>
					</div>
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
						<h2 class="ftco-heading-2">About Autoroad</h2>
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
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzOablY1uPpncQ49oiU5i93gPZ2jWTjeA&callback=initMap"></script>
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
	<script src="/elec5619/resources/js/jquery-ui.js"></script>
</body>
</html>
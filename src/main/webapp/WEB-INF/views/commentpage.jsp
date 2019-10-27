<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Comment List</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="/elec5619/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/elec5619/resources/css/animate.css">

    <link rel="stylesheet" href="/elec5619/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/elec5619/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/elec5619/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/elec5619/resources/css/aos.css">

    <link rel="stylesheet" href="/elec5619/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/elec5619/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/elec5619/resources/css/jquery.timepicker.css">


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
		function upload() {
			document.getElementById("newcomment").submit();
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/elec5619/hello.html"
				style="font-family: speedtest; color: black;">A U R A</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<section class="ftco-section contact-section" style="padding-top:5em">
	<div class="row block-9 justify-content-center mb-5">
		<div class="col-md-8 mb-md-5">
			<h2 class="text-center">
				Hello, <br> you can comment Here!
			</h2>
			<form method="post" id="newcomment"
				class="bg-light p-5 contact-form">
				
				<div class="rating" style="margin-top: -50px; margin-bottom: -20px;">
					   
                                                <input type="radio" id="star5" name="score" value="5" hidden/>
                                                <label for="star5"></label>
                                                
                                                <input type="radio" id="star4" name="score" value="4" hidden/>
                                                <label for="star4"></label>
                                                
                                                <input type="radio" id="star3" name="score" value="3" hidden/>
                                                <label for="star3"></label>
                                                
                                                <input type="radio" id="star2" name="score" value="2" hidden/>
                                                <label for="star2"></label>
                                                
                                                <input type="radio" id="star1" name="score" value="1" hidden/> 
                                                <label for="star1"></label>
                                                
                       </div>
	
				<div class="form-group">
					<textarea cols="30" rows="7"
						class="form-control" placeholder="Review" name="contents" id="contents"></textarea>
				</div>
				<div class="form-group">
					<input type="button" value="Add" onclick="upload();"
						class="btn btn-primary py-3 px-5">
				</div>
			</form>
		</div>
	</div>
	</section>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
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
<script src="/elec5619/resources/js/jquery-ui.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!DOCTYPE html>
<html lang="en">
<head>
    <title>Autoroad - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

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
    <link rel="stylesheet" type="text/css" href="/elec5619/resources/css/FraUpload.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/elec5619/hello.html" style="color: black">A R U A</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
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
						document.write("<li class=\"nav-item dropdown nav-item\">" +
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
<section class="ftco-section contact-section">
    <div class="row block-9 justify-content-center mb-5">
        <div class="col-md-8 mb-md-5">
            <h2 class="text-center">Hello landlord, <br> you can upload pictures here! </h2>
            <form enctype="multipart/form-data">
                <input type="hidden" id="imagepath" name="file">
                <span id="upload_object"   class="btn btn-primary"  style="margin-left: 10px; padding-top: 5px; padding-bottom: 5px; padding-left: 10px; padding-right: 10px;">Upload</span>
                
                <div class="show"></div>
            </form>
            <div class="form-group">
					<input type="button" value="Finish" onclick="jumping();"
						class="btn btn-primary py-3 px-5" style="float: right;margin-right: 10px;">
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



<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/elec5619/resources/js/main.js"></script>

<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="/elec5619/resources/js/Sortable.js"></script>
<script type="text/javascript" src="/elec5619/resources/js/MD5.js"></script>
<script type="text/javascript" src="/elec5619/resources/js/FraUpload.js"></script>
<script type="text/javascript">


    a = $("#upload_object").FraUpload({
        view        : ".show",
        url         : "/elec5619/product/uploadphoto/" + document.URL.split("uploadphoto/")[1],
        fetch       : "img",
        debug       : false,

        onLoad: function(e){
            console.log("initializing...");
        },
        breforePort: function (e) {
            console.log("triggering");
        },
        successPort: function (e) {
            console.log("success");
            onload_image()
        },
        errorPort: function (e) {
            console.log("failed");
            onload_image()
        },
        deletePost: function(e){
            console.log("delete");
            console.log(e);
            alert('delete '+e.filename)
            onload_image()
        },
        sort: function(e){
            console.log("sort");
            //onload_image()
        },
    });

    function onload_image(){
        var res = a.FraUpload.show()
        var ids = [];
        for(let k in res){
            this_val = res[k]
            if(!empty(res[k]['is_upload']) && !empty(res[k]['ajax'])){
                ajax_value = res[k]['ajax'];
            }
        }
    }

    function JsonFormat(json) {
        if (typeof json != 'string') {
            json = JSON.stringify(json, undefined, 2);
        }
        json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
        return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
            var cls = 'number';
            if (/^"/.test(match)) {
                if (/:$/.test(match)) {
                    cls = 'key';
                } else {
                    cls = 'string';
                }
            } else if (/true|false/.test(match)) {
                cls = 'boolean';
            } else if (/null/.test(match)) {
                cls = 'null';
            }
            return '<span class="' + cls + '">' + match + '</span>';
        });
    }
    function empty(value) {
        if(value=="" || value==undefined || value==null || value==false || value==[] || value=={}){
            return true;
        }else{
            return false;
        }
    }
</script>
</body>
</html>
</html>
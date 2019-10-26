<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	

	<title>Edit your profile</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
	<link href="/elec5619/resources/user/resources/css/bootstrap.min1.css" rel="stylesheet" />
	<link href="/elec5619/resources/user/resources/css/material-bootstrap-wizard.css" rel="stylesheet" />

</head>

<body>
	<div class="image-container set-full-height" style="background-image: url('${cp}/images/bg2.jpg')">
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="blue" id="wizardProfile">
		                    <form action="myphoto" method="POST" enctype="multipart/form-data">
		                <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   Photo Profile
		                        	</h3>
									<h5>Upload a photo from your computer</h5>
		                    	</div>
								<div class="wizard-navigation" style="margin-left: 8px;">
									<ul>
			                            <li><a href="#photo" data-toggle="tab">Photo</a></li>
			                        </ul>
								</div>
								<div class="tab-pane" id="photo">
		                                <div class="row">
		                                    <div  align="center">
		                                    <br><br>
		                                    	<div class="picture-container">
		                                        	<div class="picture">
                                        				<img src="/elec5619/resources/images/${user.id}.jpg" class="picture-src" id="myphotodisplay" onerror="this.src='/elec5619/resources/user/resources/images/default-avatar.png';this.onerror=null"/>
		                                            	<input type="file" name="myphoto" id="myphoto" accept=".jpg">
		                                        	</div>
		                                        	<h6>Choose Picture</h6>
		                                    	</div>
		                                	</div>
		                                </div>
		                            </div>
		                         <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='submit' class='btn btn-finish btn-fill btn-info btn-wd' name='finish' value='Finish' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div><!-- end row -->
	    </div> <!--  big container -->

	    <div class="footer">
	        <div class="container text-center">
	            <a href="../hello.htm">Home Page</a>
	        </div>
	    </div>
	</div>

</body>
	<!--   Core JS Files   -->
    <script src="/elec5619/resources/user/resources/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="/elec5619/resources/user/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/elec5619/resources/user/resources/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="/elec5619/resources/user/resources/js/material-bootstrap-wizard.js"></script>

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="/elec5619/resources/user/resources/js/jquery.validate.min.js"></script>
	
	<script type="text/javascript">
	$('#myphoto').on('change',function(){
    	var filePath = $(this).val(),   
    		fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
    		src = window.URL.createObjectURL(this.files[0]);
    	if( !fileFormat.match(/.jpg|.jpeg/) ) {
    		alert('upload error');
        	return;  
        }
        $('#myphotodisplay').attr('src',src);});
	</script>

</html>

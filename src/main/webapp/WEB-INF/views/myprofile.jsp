<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="cp" value="${pageContext.request.contextPath}/resources/user/resources"/>

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
	<script type="text/javascript">
		function checkPassword(){
			
		}
	</script>
</head>

<body>
	<div class="image-container set-full-height" style="background-image: url('/elec5619/resources/user/resources/images/bg2.jpg')">
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <c:if test="${not empty error}">
		                <div align="center">
		                    <h5 style="color:RED"><B>${error}</B></h5>
		                </div>
		                </c:if>
		                <div class="card wizard-card" data-color="blue" id="wizardProfile">
		                    <sf:form action="" method="POST" modelAttribute="user">
		                <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   Personal Info
		                        	</h3>
									<h5>You can check and edit your profile here</h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#about" data-toggle="tab">About</a></li>
			                            <li><a href="#password" data-toggle="tab">Password</a></li>
			                        </ul>
								</div>
								
		                        <div class="tab-content">
		                            <div class="tab-pane" id="about">
		                              <div class="row">
		                              		<h4 class="info-text"> Basic info, such as your real name and phone number</h4>
		                              		<div class="col-sm-5 col-sm-offset-1" >
		                                    	<div class="picture-container" >
		                                        	<div class="picture" style="height:130px; width:130px;">
		                                        	<a href="myphoto">
                                        				<img src="/elec5619/resources/images/${user.id}.jpg" class="picture-src" id="photo" title="" onerror="this.src='/elec5619/resources/user/resources/images/default-avatar.png';this.onerror=null"/>
		                                        	</a>
		                                        	</div>
		                                        	
		                                        
		                                    	</div>
		                                    </div>
		                                    <sf:hidden path="id"/>
		                                	<div class="col-sm-5">
		                                		<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">email</i>
													</span>
													<div class="form-group label-floating">
			                                            <label class="control-label">Email <small>(required)</small></label>
			                                            <input disabled="disabled" class="form-control" value="${user.email}">
			                                            <sf:hidden path="Email"/>
			                                        </div>
												</div>
												
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">face</i>
													</span>
													
													<div class="form-group label-floating">
			                                          <label class="control-label">User Name <small>(required)</small></label>
			                                          <sf:input name="username" type="text" class="form-control" path="UserName"></sf:input>
			                                        </div>
												</div>
		                                	</div>
		                                	<div class="col-sm-5 col-sm-offset-1">
		                                		<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">perm_identity</i>
													</span>
													<div class="form-group label-floating">
													  <label class="control-label">Legal Name </label>
													  <sf:input name="realname" type="text" class="form-control" path="RealName"></sf:input>
													</div>
												</div>
											</div>
											<div class="col-sm-5">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">phone_in_talk</i>
													</span>
													<div class="form-group label-floating">
													  <label class="control-label">Phone number </label>
													  <sf:input name="phone" type="text" class="form-control" path="Phone"></sf:input>
													</div>
												</div>
		                                	</div>
		                                	
		                            	</div>
		                            </div>
		                            
		                            <div class="tab-pane" id="password">
		                                <h4 class="info-text">Reset your password here</h4>
		                                <div class="row">
		                                    
		                                        <div class="col-sm-6 col-sm-offset-3">
		                                            <div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock</i>
													</span>
													
													<div class="form-group label-floating">
			                                          <label class="control-label">New Password <small>(required)</small></label>
			                                          <sf:input name="password" type="password" class="form-control" path="Password"></sf:input>
			                                        </div>
													</div>
		                                    	</div>
		                                    	
		                                    	<div class="col-sm-6 col-sm-offset-3">
		                                            <div class="input-group" >
													<span class="input-group-addon">
														<i class="material-icons">lock</i>
													</span>
													
													<div class="form-group label-floating">
			                                          <label class="control-label">Confirm Password <small>(required)</small></label>
			                                          <input name="password_again" type="password" class="form-control" value="${user.password}">
			                                        </div>
													</div>
		                                    	</div>
		                                    	
		                                </div>
		                            </div>
		                            
		                        </div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='button' class='btn btn-next btn-fill btn-info btn-wd' name='next' value='Next' />
		                                <input type='submit' class='btn btn-finish btn-fill btn-info btn-wd' name='finish' value='Finish' />
		                            </div>

		                            <div class="pull-left">
		                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </sf:form>
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

</html>

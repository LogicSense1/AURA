<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	

	<title>Check your order</title>

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
	<div class="image-container set-full-height" style="background-image: url('/elec5619/resources/user/resources/images/bg2.jpg')">
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="blue" id="wizardProfile">
		                    <sf:form action="" method="POST" modelAttribute="user">
		                <!--  You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"  -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   My Order
		                        	</h3>
									<h5>You can check and edit your orders here</h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#rent" data-toggle="tab">Rent</a></li>
			                            <li><a href="#host" data-toggle="tab">Host</a></li>
			                        </ul>
								</div>
								
		                        <div class="tab-content">
		                            <div class="tab-pane" id="rent">
		                            	<h4 class="info-text"> What you rent </h4>
		                                <div class="row">
		                                    <div class="col-sm-11 col-sm-offset-1">
		                                    <c:forEach items="${model.Rorders}" var="order">
		                                    <div class="col-sm-9" style="margin-top:10px;">
		                                    	
		                                   		Order ID: <c:out value="${order.ID}" />
		                                   		<br>
		                                   		House: <a href="/elec5619/house/${order.house_ID}">Check Detail</a>
		                                   		<br>
												Created Time: <c:out value="${order.createdTime}" />
												<br>
												Order Status: <c:out value="${order.currentStatus}" />
												<br>
												Cost: <i>$<c:out value="${order.cost}" /></i> /WEEK
												<br>
												Start Date: <c:out value="${order.startDate}" />
		                                   		<br>
		                                   		End Date: <c:out value="${order.endDate}" />
		                                   		<br>
		                                   		
		                                   	</div>
		                                   	<div class="col-sm-3" align="left" style="margin-top:10px;">
		                                   	<c:if test="${order.currentStatus != 'canceled' }">
												<a href="/elec5619/myaccount/cancel/${order.ID}">Cancel Order</a>
											</c:if>
											</div>
											</c:forEach>
		                                   </div>
		                                </div>
		                        	</div>
		                            
		                            <div class="tab-pane" id="host">
		                                <h4 class="info-text"> What you host </h4>
		                                <c:forEach items="${model.Houses}" var="house">
		                                  <div class="row">
		                                    <div class="col-sm-11 col-sm-offset-1">
		                                    	<div class="col-sm-9" style="margin-top:10px;">
		                                   		House: <a href="/elec5619/house/${house.ID}">Check Detail</a>
		                                   		<br>
		                                   		</div>
		                                   		<div class="col-sm-3" align="left" style="margin-top:10px;">
												<a href="/elec5619/myaccount/delete/${house.ID}">Delete</a>
												</div>
												<div class="col-sm-9" style="margin-top:10px;">
												</div>
		                                    </div>
		                                 </div>
		                                 <c:forEach items="${model.Porders}" var="order">
		                                  <c:if test="${order.house_ID == house.ID}">
		                                 	<div class="row">
		                                    	<div class="col-sm-11 col-sm-offset-1">
		                                    	   <div class="col-sm-9" style="margin-top:10px;">
		                                   			Order ID: <c:out value="${order.ID}" />
		                                   			<br>
													Created Time: <c:out value="${order.createdTime}" />
													<br>
													Order Status: <c:out value="${order.currentStatus}" />
													<br>
													Cost: <i>$<c:out value="${order.cost}" /></i> /WEEK
													<br>
													Start Date: <c:out value="${order.startDate}" />
		                                   			<br>
		                                   			End Date: <c:out value="${order.endDate}" />
		                                   			<br>
		                                   		</div>
		                                   		<div class="col-sm-3" align="left" style="margin-top:10px;">
												<c:if test="${order.currentStatus != 'canceled' }">
													<a href="/elec5619/myaccount/cancel/${order.ID}">Cancel Order</a>
												</c:if>
												</div>
		                                    	</div>
		                                 	</div>
		                                 </c:if>
		                                 </c:forEach>
		                               </c:forEach>
		                            </div>
		                            
		                       </div>

		                    </sf:form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div><!-- end row -->
	    </div> <!--  big container -->

	    <div class="footer">
	        <div class="container text-center">
	             <a href="/elec5619/hello.htm">Home Page</a>
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

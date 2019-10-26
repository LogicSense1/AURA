<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
	<head>
		<meta charset="utf-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    	<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- Icons -->
    <link href="/elec5619/resources/admin/resources/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
    <link href="/elec5619/resources/admin/resources/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="/elec5619/resources/admin/resources/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
	</head>

	<body>
		<div class="container-fluid">
          <!-- img and title-->
         	<center>
              <figure>
                  <img src="/elec5619/resources/admin/resources/img/brand/blue.png" alt="AURA" vspace="30" width="169" height="50">
                  <b>
                      <figcaption>
                          <font size="5"> Admin Product Manager </font>
                      </figcaption>
                  </b>
              </figure>
          	</center>
      	</div>

      	      <!-- Table1 account -->
	<div class="row mt-5">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
                <center>
                    <h3 class="mb-0">Edit Page</h3><br>
                </center>
            </div>
            <div class="table-responsive">
            	<sf:form method="POST" modelAttribute="product" style="padding-left: 20%;">
            		<center>
             			<table class="table align-items-center table-flush">
                			<thead class="thead-light">
                  				<tr>
                      				<th scope="col"><center>titles</center></th>
                        			<th scope="col">Edit contexts below</th>
                  				</tr>
                			</thead>
                    			<tr>
									<th style="text-align: center;"><label for="product_ID">product ID:</label></th>
									<td><sf:input path="ID"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_name">product name:</label></th>
									<td><sf:input path="name"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_ownerID">product ownerID:</label></th>
									<td><sf:input path="ownerID"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_location">product location:</label></th>
									<td>${product.location}
									<sf:hidden path="location"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_houseType">product houseType</label></th>
									<td><sf:input path="houseType"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_price">product price:</label></th>
									<td><sf:input path="price"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_numberOfRooms">number of rooms:</label></th>
									<td><sf:input path="numberOfRooms"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_parkingAvailable">parking available:</label></th>
									<td><sf:input path="parkingAvailable"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><label for="product_status">product status:</label></th>
									<td><sf:input path="status"/></td>
								</tr>
								<tr>
									<td><sf:hidden path="createdTime"/><sf:hidden path="latitude"/><sf:hidden path="longitude"/><sf:hidden path="availableStartTime"/><sf:hidden path="availableEndTime"/><sf:hidden path="description"/></td>
								</tr>
								<tr>
									<th style="text-align: center;"><a href="/elec5619/admin/producttable"><button>Cancel</button></a></th>
									<!--  This hidden field is required for Hibernate to recognize this Product -->
									<td style="text-align: left;"><input type="submit" value="Done"/></td>
								</tr>
								
              			</table>
              		</center>
      			</sf:form>
      		</div>
  		</div>
	</div>
</div>

      	<script src="/elec5619/resources/admin/resources/js/plugins/jquery/dist/jquery.min.js"></script>
  		<script src="/elec5619/resources/admin/resources/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

	</body>
</html>
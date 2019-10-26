
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
                          <font size="5"> Admin User Manager </font>
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
            	<sf:form method="POST" modelAttribute="user" style="padding-left: 20%;">
            		<center>
             			<table class="table align-items-center table-flush">
                			<thead class="thead-light">
                  				<tr>
                      				<th scope="col"><center>titles</center></th>
                        			<th scope="col">Edit contexts below</th>
                  				</tr>
                			</thead>
                    			<tr>
						<th style="text-align: center;"><label for="user_id">user_ID:</label></th>
						<td><sf:input path="id"/></td>
					</tr>
					<tr>
						<th style="text-align: center;"><label for="user_userName">username:</label></th>
						<td><sf:input path="userName"/></td>
					</tr>
					<tr>
						<th style="text-align: center;"><label for="user_email">user_email:</label></th>
						<td><sf:input path="email"/></td>
					</tr>
					<tr>
						<th style="text-align: center;"><label for="user_phone">user_phone</label></th>
						<td><sf:input path="phone"/></td>
					</tr>
					<tr>
						<th style="text-align: center;"><label for="user_realName">user realname:</label></th>
						<td><sf:input path="realName"/><sf:hidden path="password" /></td>
					</tr>

								<tr>
									<th style="text-align: center;"><a href="AdminUserTable.htm"><button>Cancel</button></a></th>
									<!--  This hidden field is required for Hibernate to recognize this Product -->
									<td style="text-align: left;"><input type="submit" value="Done"/></td>
								</tr>
								<tr>
									<td><sf:hidden path="id"/>
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
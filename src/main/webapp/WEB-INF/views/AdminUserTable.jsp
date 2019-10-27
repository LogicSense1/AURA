<%@ include file="/WEB-INF/views/include.jsp" %>
<html lang="en">

<head>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>

    </title>

<!-- Favicon -->
  <link href="/elec5619/resources/admin/resources/img/brand/favicon.png" rel="icon" type="image/png">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- Icons -->
    <link href="/elec5619/resources/admin/resources/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
    <link href="/elec5619/resources/admin/resources/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="/elec5619/resources/admin/resources/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>

<body class="">
  <div class="main-content">
      <div class="container-fluid">
          <!-- img and title-->
          <center>
          <figure>
              <img src="/elec5619/resources/admin/resources/img/brand/blue.png" alt="AURA" vspace="30" width="169" height="50">
              <b>
                  <figcaption>Welcome back, Administrator! |User manager|</figcaption>
              </b>
          </figure>
          </center>
      </div>
  
  <!-- Table1 user -->
  		<center>
		<table>
			<tbody>
				<th>
					<a href="/elec5619/admin/producttable">
     				 <button type="button" class="btn-icon-clipboard">
        				<div>
          					<i class="ni ni-circle-08"></i>
          					<span>Product</span>
        				</div>
      				</button>
				</th>
				<td>
					<a href="/elec5619/admin/ordertable">
    <button type="button" class="btn-icon-clipboard">
      <div>
        <i class="ni ni-cart"></i>
        <span>Orders</span>
      </div>
    </button>
				</td>
				<td>
					<a href="/elec5619/admin/commenttable">
    <button type="button" class="btn-icon-clipboard">
      <div>
        <i class="ni ni-single-copy-04"></i>
        <span>Comments</span>
      </div>
    </button>
				</td>
				<td>
					<a href="/elec5619/admin">
    				<button type="button" class="btn-icon-clipboard">
      				<div>
        				<i class="ni ni-bold-left"></i>
        				<span>Back</span>
      				</div>
    				</button>
			</tbody>
		</table>
		</center>
      <div class="row mt-5">
        <div class="col">
          <div class="card shadow" style="padding-left: 7%;padding-right: 7%;">
            <div class="card-header border-0">
              <h3 class="mb-0">User tables</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">Id</th>
                    <th scope="col">User name</th>
                    <th scope="col">Email address</th>
                    <th scope="col">Phone number</th>
                    <th scope="col">Real name</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${model.users}" var="usr">
                <tr>
                
  					<th scope="row">
  						<c:out value="${usr.id}"/>
  					</th>
  					<td>
  						<c:out value="${usr.userName}"/>
  					</td>
  					<td>
  						<c:out value="${usr.email}"/>
  					</td>
  					<td>
  						<c:out value="${usr.phone}"/>
  					</td>
  					<td>
  						<c:out value="${usr.realName}"/>
  					</td>
  					<c:if test="${usr.id != 77777777}">
  					<td class="text-right">
                        <div class="dropdown">
                        	<a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          		<i class="fas fa-ellipsis-v" style="padding-top: 10px"></i>
                        	</a>
                        	
                        	<div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                          		<a class="dropdown-item" href="/elec5619/adminuser/edit/${usr.id}">Edit</a>
                          		<a class="dropdown-item" href="/elec5619/adminuser/delete/${usr.id }">Delete</a>
                        	</div>
                        	
                       	</div>
                    </td>
                    </c:if>
                   </tr>
                   </c:forEach>
                   </tbody>


  </div>
  </div>

  <!--   Core   -->
  <script src="/elec5619/resources/admin/resources/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="/elec5619/resources/admin/resources/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/elec5619/resources/admin/resources/js/plugins/clipboard/dist/clipboard.min.js"></script>
	<script src="/elec5619/resources/admin/resources/js/argon-dashboard.min.js?v=1.1.0"></script>
  	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>



</body>

</html>
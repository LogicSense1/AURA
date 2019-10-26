<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<script type="text/javascript">
	function jumpingto(a){
		window.location.href = "/elec5619/admin/" + a;
	}
</script>

<body class="">
<div class="main-content">
  <div class="container-fluid">
    <!-- img and title-->
    <center>
      <figure>
        <img src="/elec5619/resources/admin/resources/img/brand/blue.png" alt="AURA" vspace="30"
             width="169" height="50">
        <b>
          <figcaption>Welcome back, Administrator!</figcaption>
        </b>
      </figure>
    </center>
  </div>
<center>
  <div class="col-lg-3 col-md-6">
    <a href="/elec5619/admin/producttable"></a>
      <button type="button" class="btn-icon-clipboard" onclick="jumpingto('producttable')">
        <div>
          <i class="ni ni-app"></i>
          <span>Products</span>
        </div>
      </button>
  </div>
  <br>
  <div class="col-lg-3 col-md-6">
    <a href="AdminUserTable.htm"></a>
      <button type="button" class="btn-icon-clipboard" onclick="jumpingto('usertable')">
        <div>
          <i class="ni ni-circle-08"></i>
          <span>Users</span>
        </div>
      </button>
  </div>
  <br>
  <div class="col-lg-3 col-md-6">
    <a href="AdminOrderTable.htm"></a>
    <button type="button" class="btn-icon-clipboard" onclick="jumpingto('ordertable')">
      <div>
        <i class="ni ni-cart"></i>
        <span>Orders</span>
      </div>
    </button>
  </div>
  <br>
  <div class="col-lg-3 col-md-6">
    <a href="AdminCommentTable.htm"></a>
    <button type="button" class="btn-icon-clipboard" onclick="jumpingto('commenttable')">
      <div>
        <i class="ni ni-single-copy-04"></i>
        <span>Comments</span>
      </div>
    </button>
  </div>
  <br>
</center>
  <!--   Core   -->
  <!--   Core   -->
  <script src="/elec5619/resources/admin/resources/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="/elec5619/resources/admin/resources/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="/elec5619/resources/admin/resources/js/plugins/clipboard/dist/clipboard.min.js"></script>
  <!--   Argon JS   -->
  <script src="/elec5619/resources/admin/resources/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    </body>

    </html>
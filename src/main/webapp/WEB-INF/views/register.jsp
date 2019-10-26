<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<html>

<head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <meta http-equiv="pragma" content="no-cache">
       <meta http-equiv="Cache-Control " content="no-cache,must-revalidate">
       <meta name="description" content="">
       <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
       <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
       <title>Register</title>
       <link rel="stylesheet" href="/elec5619/resources/user/resources/css/style.css">
       <script>
       		function checkandpost(){
       			if (document.getElementById("password").value ==  document.getElementById("password_again").value)
       				document.getElementById("registerform").submit();
       			else document.getElementById("not_match").style.visibility = '';
       		}
       </script>
</head>
<body>

	<div class="container">
		<div class="contentReg fade-in">
			<h1>AURA</h1>
			<div class="Register">
				<form id="registerform" method="post">
				<div class="email" align="center">
					<input type="text" name="email" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Email">
					<br><br>
				</div>	
				
				<div class="password" align="center">
					<input type="password" id="password" name="password" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Password">
					<br><br>
				</div>
				
				<div class="confirm_password" align="center">
					<input type="password" id="password_again" name="password_again" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Confirm your password">
				
				</div>
				<div id="not_match" align="center" style="visibility:hidden"><p>Password and Re-entered Password do not match!<p></div>
				
				<div class="username" align="center">
					<input type="text" name="username" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="UserName">	
					<br><br>
				</div>
				
				<div class="realname" align="center">
					<input type="text" name="realname" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Real Name">	
					<br><br>
				</div>
				
				<div class="phone" align="center">
					<input type="text" name="phone" style="width:240px; height:45px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Phone">	
					<br><br>
				</div>
				
				<div align="center">
				
					<input type="button" class="button button1" onclick=checkandpost() value="Register">
					<br><br>
					<p><span style="color:white">Already have an account? </span><a href="<c:url value="login"/>" style="color:skyblue">Log in here</a></p>
				</div>
				
				</form>
			</div>
		</div>
	</div>

</body>
</html>
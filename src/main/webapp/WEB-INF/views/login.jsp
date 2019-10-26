<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<html>

<head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <meta http-equiv="pragma" content="no-cache">
       <meta http-equiv="Cache-Control " content="no-cache,must-revalidate">
       <meta name="description" content="">
       <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
       <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
       <title>Login</title>
       <link rel="stylesheet" href="/elec5619/resources/user/resources/css/style.css">
</head>
<body>

	<div class="container">
		<div class="content fade-in">
			<h1>AURA</h1>
			<div class="login">
				<form method="post" action="/elec5619/user/login">
				<div class="email" align="center">
					<span class="user_icon"> &#xe605;</span>
					<input type="text" name="email" style="width:240px; height:50px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Email">
					<br><br>
				</div>	
				<div class="password" align="center">
					<span class="pass_icon"> &#xe605;</span>
					<input type="password" name="password" style="width:240px; height:50px; padding: 0 35px; border: none; background: #e1dcd8; color: rgb(98,94,91); box-shadow: 0px 1px 1px rgba(255,255,255,0.7), inset 0px 2px 5px #aaaaaa; border-radius: 5px;" placeholder="Password">
					<br><br>
				</div>
				
				<div align="center">
					<c:if test="${not empty error}">
					<p>${error}</p>
					</c:if>
					
					<input type="submit" class="button button1" value="Login"/>
					<br>
					<p>New to AURA? <a href="/elec5619/user/register" style="color:DARKBLUE">Register now!</a></p>
				</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<style>
body
    {

        background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        margin: 0;
        padding: 0;
    } 
#login-box {
	width: 400px;
	padding: 30px;
	margin: 150px auto;
	background-color:111111;
	color:green;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	border: 1px solid #001;
}
</style>
</head>
<body  onload='document.loginForm.username.focus();' >
 
 
	<div id="login-box">
 	
		<h3>Login with Username and Password</h3>
 

 
		<spring:form method ="post" commandName="tk" action="login.html">
 
		  <table>
			<tr>
				<td>UserName:</td>
				<td><spring:input path="username"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><spring:password path="password"/></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit" value="Login"></td>
				<!-- 
			<a href="${pageContext.request.contextPath}/taikhoan/signup.html">Signup</a>
			 -->
			</tr>
		  </table>
		</spring:form>
		${message }
	</div>
</body>
</html>
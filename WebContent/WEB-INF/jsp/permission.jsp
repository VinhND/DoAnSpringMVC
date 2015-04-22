<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>permission page</title>
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
 	
		<h3>    Permission to user</h3>
		<spring:form method ="post" commandName="tk" action="permission.html">
		  <table>
			<tr>
				<td>UserName:</td>
				<td><spring:input path="username"/></td>
			</tr>
			<tr>
				<td>Permission:</td>
				<td><spring:input path="power"/></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit" value="Submit"></td>
			</tr>
		  </table>
		</spring:form>
		${message }
		<a href="${pageContext.request.contextPath}/showAllUser/quanly.html">Back to Show All User</a>
	</div>
	
</body>
</html>
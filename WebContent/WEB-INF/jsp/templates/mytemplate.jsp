<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>
<tiles:insertAttribute name="head" ignore="true"></tiles:insertAttribute>
<style type="text/css">
	html, body {
	   height:100%;on
	   margin: 0px;
	   background-color: 333333;
	    background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        margin: 0;
        padding: 0;
	}
		#main{
    width: 1200px;
    padding: 0;
    margin-left: auto;
    margin-right: auto;
}
#head{
    height: 90px;
     background-color: 333333;
    border: 1px solid #CDCDCD;
    margin-bottom:5px;
}
#temp{
higth :10px;
background-color: 111111;
float:right;
}
#cont{
    height: 700px;
     background-color: 111111;
    border: 1px solid #CDCDCD;
  }
}
</style>
</head>
<body BACKGROUND="${pageContext.request.contextPath}/resources/image/background-27.jpg">	

<div id="main">
	<div id="head">
  	<h1 style="text-align: center;margin-bottom: 8px;color: #339900">SYSTEM TRAFFIC </h1>
  	
  	<div id="temp">
	<a href="${pageContext.request.contextPath }/mytemplate.html">Home |</a>	 
	<a href="${pageContext.request.contextPath }/mytemplate/aboutus.html">Aboutus |</a>
	<a href="${pageContext.request.contextPath }/taikhoan/login.html">Signin |</a>
	<a href="${pageContext.request.contextPath }/taikhoan/signup.html">SignUp</a>


	</div>
	</div>

	<div id="cont">
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
</div>
</body>
</html>
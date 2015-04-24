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
* {
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
    height: 100px;
    background-color: F5F5F5;
    border: 1px solid #CDCDCD;
    margin-bottom:5px;
}

#head-link{
     height: 30px;
     width:100px
     line-height: 30px;
     padding-left: 10px;
     padding-right: 10px;
     border: 1px solid #CDCDCD;
     background-color: #00AA00;
     margin-bottom:5px;
     clear: both;
}
/*
#temp{
higth :10px;
background-color: 111111;
float:float;
}*/
#cont{
    height: 1700px;
    border: 1px solid #CDCDCD;
  }
}

#head-link ul {
  background: #1F568B;
  list-style-type: none;
	
}
#head-link li {
  color: #f1f1f1;
  float: left;
  width: 100px;
  height:30px;
  line-height:30px;
}
#head-link a {
  text-decoration: none;
  color: #fff;
  display: block;
}
#head-link a:hover {
  background: #33FF33;
  color: #333;
  float:left;
  width:80%
}
</style>
</head>
<body BACKGROUND="${pageContext.request.contextPath}/resources/image/background-27.jpg">	

<div id="main">
	<div id="head">
  	<h1 style="text-align: center;margin-bottom: 8px;color: #339900">SYSTEM TRAFFIC </h1>
	</div>

	<div id=head-link>
	 <ul>

	 <li><a href="${pageContext.request.contextPath }/mytemplate.html">Home </a></li> 
	<li><a href="${pageContext.request.contextPath }/mytemplate/aboutus.html">Aboutus </a></li> 
	<li><a href="${pageContext.request.contextPath }/taikhoan/login.html">Signin </a></li> 
	<li><a href="${pageContext.request.contextPath }/taikhoan/signup.html">SignUp</a></li> 
	</ul>
	 
	</div>
	<div id="cont">
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
</div>
</body>
</html>
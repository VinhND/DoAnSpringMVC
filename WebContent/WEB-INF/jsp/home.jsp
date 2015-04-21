<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<style>
body {
    background-color: SandyBrown;
}
#mainh{
        background-size: cover;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
    padding: 0;
    margin-left: auto;
    margin-right: auto;
}
#tab{
border: 1px solid #CDCDCD;
height:460px;
margin-left: 147px;
margin-right:65px;
 margin-top:15px;
}

#bg
{
max-width:100%; 
max-height:100%;
margin-left: 250px;
display:block;
}

#detail{
	higth:600px;
}
#mapOff{
	higth:600px;
	
}

</style>
</head>
<body onLoad="buildHtmlTable()">
	<div id="mainh">
	<div id="tab">
	<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/traffic3.png">
	</div>
	
	<div id="detail">
			<div id="mapOff">
			
			
			

  
			</div>
	
	
	
	
	
			<div id="mapReal">
			</div>
			<div id="graphic">
			</div>
			<div id="tableReal">
			</div>
			</div>
</div>
</body>
</html>
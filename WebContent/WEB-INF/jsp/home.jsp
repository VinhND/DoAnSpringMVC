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
    background-color: 000000;
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
#head-link-home{
  height: 50px;
     width:100px
     line-height: 30px;
     padding-left: 10px;
     padding-right: 10px;
  /*     border: 1px solid #CDCDCD;
   background-color: #AAAA00;*/
     margin-top:0px;
 /*    clear: both;*/
}
#tab{
border: 1px solid #CDCDCD;
height:460px;
margin-left: 0px;
margin-right:0px;
 margin-top:0px;
}

#bg
{
max-width:100%; 
max-height:100%;
margin-left: 0px;
display:block;
}

#detail{
<<<<<<< HEAD
	higth:600px;	
=======
	higth:600px;
	
>>>>>>> branch 'master' of https://github.com/VinhND/DoAnSpringMVC.git
}
#mapOff{
     width: 580px;
     height: 400px;
     background-color:#669900;
     border: 1px solid #CDCDCD;
     float:left;
      margin-left: 5px;
      margin-top:27px;
     clear:both;
}
#mapReal{
    width: 580px;
   	height: 400px;
   	    background-color:#669900;
     border: 1px solid #CDCDCD;
     float:right;
     margin-top:27px;
     margin-right: 5px;
}
#graphic{
     width: 580px;
     min-height: 400px;
         background-color:#669900;
     border: 1px solid #CDCDCD;
     float:left;
      margin-left: 5px;
      margin-top:15px;
     clear:both;
}
#tableReal{
    width: 580px;
   	height: 400px;
   	    background-color:#669900;
     border: 1px solid #CDCDCD;
     float:right;
     margin-top:15px;
     margin-right: 5px;
}
</style>
</head>
<body>
	<div id="mainh">
	<!-- 
	<div id="tab">
	<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/traffic3.png">
	style="-moz-transform: scale(1); -webkit-transform: scale(1);" 
	</div>
	 -->
	 <div id="head-link-home">
	 
	 <h1 style="text-align: left;margin-bottom: 8px;color: #339900"><i>Danh mục tính năng</i></h1>
	 <hr align="left" color="#00AA00" size="2px" width="500px">
	 </div>
	<div id="detail">
			<div id="mapOff">  
			<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/mapoff2.png" width="580" height="300">
			<h2 style="text-align: left;margin-bottom: 8px;color: 339900"><i>Bản đồ tĩnh</i></h2>
			<p>ádfghjkl</p>
			</div>
				 
			<div id="mapReal">
			<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/mapreal.png" width="580" height="300">
			<h2 style="text-align: left;margin-bottom: 8px;color: 339900"><i>Bản đồ thời gian thực</i></h2>
				<p>ádfghjkl</p>
			</div>
			<div id="graphic">
			<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/grap.png" width="580" height="300">
			<h2 style="text-align: left;margin-bottom: 8px;color: 339900"><i>Đồ thị chi tiết</i></h2>
				<p>ádfghjkl</p>
			</div>
			<div id="tableReal">
			<img alt="" id="gb" src="${pageContext.request.contextPath}/resources/image/tablereal.png" width="580" height="300">
			<h2 style="text-align: left;margin-bottom: 8px;color: 339900"><i>Thống kê đường tắc</i></h2>
				<p>ádfghjkl</p>
			</div>
			</div>
</div>
</body>
</html>

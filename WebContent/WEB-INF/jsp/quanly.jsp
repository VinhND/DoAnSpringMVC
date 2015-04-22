<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#tbl{
	
	float:right;
}
table, th , td  {
	width:1100px;
  border: 2px solid grey;
  border-collapse: black;
  padding: 10px;
}
table tr:nth-child(odd)	{
  background-color: 00FF00;
   padding: 100px;
}
table tr:nth-child(even) {
  background-color: 00FF00;
   padding: 100px;
}
</style>
    <title>HTML dynamic table using JavaScript</title>
    <!-- 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tableAcc.js"></script>
       -->
    <script src="${pageContext.request.contextPath}/resources/js/data.json"></script>
  	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script type="text/javascript">
/*
 function writeTextFile(afilename, output)
 {
	 console.log("3");
	 var txtFile = new File(afilename);
   console.log("4");
   txtFile.writeln(output);
   console.log("5");
   txtFile.close();
   console.log("6");	



 }
 
	function deleteR(obj) {

	var a={};
		 $.getJSON("${pageContext.request.contextPath}/resources/js/data.json",function(data){
			var index =0;
		//	alert("size"+data.length+ ", obj ="+obj);
			delete data[obj];
			a=data;
			console.log(data[0].username);	
		 });
		writeTextFile("a.txt", a);
		console.log("2");
	
		
		
		
	} 
	*/
	function pow(id){
		if (id==0) return "admin";
		if (id==1) return "user";
		return "No permissions :(";
	}
	function load() {
	    
	    console.log("Page load finished");
	    var a={};
	 //   alert(a+"0 ");
	       $.getJSON("${pageContext.request.contextPath}/resources/js/data.json",function(data){
	    	   a=data;
	    	   
	    	    $.each(a, function(idx, elem){
	    	    //	alert(idx);
	    	        $('table#tbl TBODY').append('<tr><td>'
	    	        		+elem.username+'</td><td>'
	    	        		+elem.password +'</td><td>'
	    	     //   		+elem.power
	    	     			+pow(elem.power)
	    	    // 			+'</td><td>'+'<input type="button" value = "Delete" onclick="Javacsript:deleteR('+idx+')" style="width:140px ; hight:40px ">'
	    	  +'</td><td>'  +' <a href="${pageContext.request.contextPath}/showAllUser/permission.html">Permission this account</a>'
	    	        		+'</td></tr>'
	    	        		);
	    	        });	    	                 
	    });	 
	}
 
 </script>   
    
    
</head>
<body onload="load()">


 <table id="tbl">
<thead><tr><th>username</th><th>password</th><th>power</th><th>Permission</th></tr></thead>
<tbody></tbody>
</table>
</body>
</html>
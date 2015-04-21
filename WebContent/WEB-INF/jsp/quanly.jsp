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
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script type="text/javascript">
 function addRow(u,v) {
     
	    var myName = document.getElementById("name");
	    var age = document.getElementById("age");
//var myName =u;
//var age =v;
	    var table = document.getElementById("myTableData");
	 
	    var rowCount = table.rows.length;
	    var row = table.insertRow(rowCount);
	 
	    row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">';
	    row.insertCell(1).innerHTML= myName.value;
	    row.insertCell(2).innerHTML= age.value;
	 
	}
	 
	function deleteRow(obj) {
	      
	    var index = obj.parentNode.parentNode.rowIndex;
	    var table = document.getElementById("myTableData");
	    table.deleteRow(index);
	    
	}
	 
	function addTable() {
	      
	    var myTableDiv = document.getElementById("myDynamicTable");
	      
	    var table = document.createElement('TABLE');
	    table.border='1';
	    
	    var tableBody = document.createElement('TBODY');
	    table.appendChild(tableBody);
	      
	    for (var i=0; i<3; i++){
	       var tr = document.createElement('TR');
	       tableBody.appendChild(tr);
	       
	       for (var j=0; j<4; j++){
	           var td = document.createElement('TD');
	           td.width='75';
	           td.appendChild(document.createTextNode("Cell " + i + "," + j));
	           tr.appendChild(td);
	       }
	    }
	    myTableDiv.appendChild(table);
	    
	}
	 
	function load() {
	    
	    console.log("Page load finished");
	    var a={};
	 //   alert(a+"0 ");
	       $.getJSON("${pageContext.request.contextPath}/resources/js/data.json",function(data){
	    	   a=data;
	    	    $.each(a, function(idx, elem){
	    	        $('table#tbl TBODY').append('<tr><td>'
	    	        		+elem.username+'</td><td>'
	    	        		+elem.password +'</td><td>'
	    	        		+elem.power +'</td></tr>');
	    	        });
	    	                 
	    });
	       /*
	    var accs= JSON.parse(info);
	    for (var i=0;i<accs.length;i++){
	    	var username = accs[i].username;
	    	var password = accs[i].password;
	    	addRow(username,password);
	    	
	    }*/
	 
	}
 
 </script>   
    
    
</head>
<body onload="load()">
<!-- 
<div id="myform">
<b>Simple form with name and age ...</b>
<table>
    <tr>
        <td>Name:</td>
        <td><input type="text" id="name"></td>
    </tr>
    <tr>
        <td>Age:</td>
        <td><input type="text" id="age">
        <input type="button" id="add" value="Add" onclick="Javascript:addRow()"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</div>
<div id="mydata">
<b>Current data in the system ...</b>
<table id="myTableData"  border="1" cellpadding="2">
    <tr>
        <td>&nbsp;</td>
        <td><b>Name</b></td>
        <td><b>Age</b></td>
    </tr>
</table>
&nbsp;
 
</div>
<div id="myDynamicTable">
<input type="button" id="create" value="Click here" onclick="Javascript:addTable()">
to create a Table and add some data using JavaScript
</div>
 -->
 <table id="tbl">
<thead><tr><th>username</th><th>password</th><th>power</th></tr></thead>
<tbody></tbody>
</table>
</body>
</html>
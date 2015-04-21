<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
	<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>
	<script src="${pageContext.request.contextPath}/resources/angular/lib/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/angular/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/angular/controllers.js"></script>
</head>
<body body ng-app="doanapp">
	<div ng-controller="doanCtrl">
 		 
		<table>
	  		<thead><tr><th>Code</th><th>Price</th><th>Time</th></tr></thead>
	 	 	<tbody ng-repeat="price in prices">
	 	 		<tr>
	 	 			<td>{{price.code}}</td>
	 	 			<td>{{price.price.toFixed(2)}}</td>
	 	 			<td>{{price.timeStr}}</td>
	 	 	</tbody>
		</table>
		<p class="new">
		  Code: <input type="text" class="code"/>
		  Price: <input type="text" class="price"/>
		  <button class="add" ng-click="add()">Add</button>
		  <button class="remove-all">Remove All</button>
		</p>
	</div>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$('.add').click(function(e){
				e.preventDefault();
				var code = $('.new .code').val();
				var price = Number($('.new .price').val());
				var jsonstr = JSON.stringify({ 'code': code, 'price': price});
				stompClient.send("/app/addStock", {}, jsonstr);
				return false;
			});
		}); */
		
	/* 	$(document).ready(function() {
			$('.remove-all').click(function(e){
				e.preventDefault();
				stompClient.send("/app/removeAllStocks");
				return false;
			})
		}); */
	</script>
</body>
</html>
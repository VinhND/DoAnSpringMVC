<html ng-app="demoapp">
<head>


<title>Spring MVC Tutorial Series by Crunchify.com</title>
<link href="${pageContext.request.contextPath}/resources/leaflet/leaflet.css" rel="stylesheet" > 
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular/lib/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/lib/angular-leaflet-directive.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/trafficMapControllers.js"></script>

<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<style>
body {
    background-color: 990000;
}

table, th , td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 10px;
}
table tr:nth-child(odd)	{
  background-color: #00FF00;
}
table tr:nth-child(even) {
  background-color: #00FF00;
}
</style>
</head>
 <!--  body ng-controller="trafficMapController"-->
 <body>
 <div ng-controller="trafficMapController">
  	<h1 style="text-align: center;margin-bottom: 6px;">REAL-TIME TRAFFIC</h1>
    <leaflet center="center" paths="paths" defaults="defaults" height="500"></leaflet>
    
<h3>
<!-- <a href="map.html">Click here to See Welcome Message... </a>(to
check Spring MVC Controller... @RequestMapping("/welcome")) -->
<form>
  		{{paths.p2.color}}
        Latitude : <input step="any" ng-model="center.lat" type="number">
        Longitude : <input step="any" ng-model="center.lng" type="number">
        Zoom : <input step="any" ng-model="center.zoom" type="number">
        
        <table>
	  		<thead><tr><th>Road name</th><th>Velocity</th><th>Time</th></tr></thead>
	 	 	<tbody>
	 	 		<tr>
	 	 			<!--  td>{{roadIndex.get(1).getName}}</td-->
	 	 			<td>{{road.name}}</td>
	 	 			<td>{{road.velocity.toFixed(2)}}</td>
	 	 			<td>{{road.timeStr}}</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>{{road.name}}</td>
	 	 			<td>{{road.velocity.toFixed(2)}}</td>
	 	 			<td>{{road.timeStr}}</td>
	 	 		</tr>		 
	 	 		<tr>
	 	 			<td>{{road.name}}</td>
	 	 			<td>{{road.velocity.toFixed(2)}}</td>
	 	 			<td>{{road.timeStr}}</td>
	 	 		</tr>		 
	 	 		<tr>
	 	 			<td>{{road.name}}</td>
	 	 			<td>{{road.velocity.toFixed(2)}}</td>
	 	 			<td>{{road.timeStr}}</td>
	 	 		</tr>		 	 	 			 	 			 			
	 	 	</tbody>
		</table>
		<table>

		<!-- <p class="new">
		  Code: <input type="text" class="code"/>
		  Price: <input type="text" class="price"/>
		  <button class="add" ng-click="add()">Add</button>
		  <button class="remove-all">Remove All</button>
		</p> -->
</form>
</h3>
</div>
</body>
</html>
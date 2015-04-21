
<html ng-app="demoapp">
<head>
<title>Spring MVC Tutorial Series by Crunchify.com</title>
<link href="${pageContext.request.contextPath}/resources/leaflet/leaflet.css" rel="stylesheet" > 
<script src="${pageContext.request.contextPath}/resources/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular/lib/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/lib/angular-leaflet-directive.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/angular-leaflet/trafficMapControllers.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<style>
body {
    background-color: 111111;
}
#main{
    width: 1100px;
    padding: 0;
    margin-left: auto;
    margin-right: auto;
}
#head{
    height: 100px;
    background-color: 111111;
    border: 1px solid #CDCDCD;
    margin-bottom:5px;
}
#out{
	higth:10px;
	float:right;
}
#tableR{
	
	float:right;
}
table, th , td  {
	width:1100px;
  border: 2px solid grey;
  border-collapse: black;
  padding: 10px;
  
  
}
table tr:nth-child(odd)	{
  background-color: #00FF00;
   padding: 100px;
}
table tr:nth-child(even) {
  background-color: #00FF00;
   padding: 100px;
   
   
}
</style>
</head>
 <!--  body ng-controller="trafficMapController"-->
 <body>
 <div ng-controller="trafficMapController">
	<div id="main">
	 <div id="head">
  	<h1 style="text-align: center;margin-bottom: 6px;">REAL-TIME TRAFFIC</h1>
  	<div id="out">
  	<!-- 
		<a href="${pageContext.request.contextPath}/taikhoan/logout.html">Logout</a>
		 -->
		 		<a href="${pageContext.request.contextPath}/map.html">Show Map Offline</a>
 	</div>
 	</div>
    <leaflet center="center" paths="paths" defaults="defaults" bounds="bounds" height="500"></leaflet>
    
<h3>
<!-- <a href="map.html">Click here to See Welcome Message... </a>(to
check Spring MVC Controller... @RequestMapping("/welcome")) -->
<form>

        Latitude : <input step="any" ng-model="center.lat" type="number">
        Longitude : <input step="any" ng-model="center.lng" type="number">
        Zoom : <input step="any" ng-model="center.zoom" type="number">
<div id="tableR">
  <p class="new">
    <button class="add">Show More Roads</button>
    <button class="remove-all">Clear All</button>
  </p>        
        
<table>
    <thead><tr><th>Roads</th><th>Valocity</th><th>Time</th></tr></thead>
    <tbody id="road"></tbody>
  </table>

</div>
 <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
 
  <script>
  
  
  
    //Create stomp client over sockJS protocol
    var socket = new SockJS("/DoAnSpringMVC/ws");
    var stompClient = Stomp.over(socket);

    // Render price data from server into HTML, registered as callback
    // when subscribing to price topic
    function renderRoad(frame) {
      var roads = JSON.parse(frame.body);
      $('#road').empty();
      for(var i in roads) {
        var road= roads[i];
        $('#road').append(
          $('<tr>').append(
            $('<td>').html(road.name),
            $('<td>').html(road.velocity.toFixed(2)),
            $('<td>').html(road.timeStr)
          )
        );
      }
    }
    
    // Callback function to be called when stomp client is connected to server
    var connectCallback = function() {
    	
      stompClient.subscribe('/topic/road', renderRoad);
    }; 

    // Callback function to be called when stomp client could not connect to server
    var errorCallback = function(error) {
      alert(error.headers.message);
    };

    // Connect to server via websocket
    stompClient.connect("guest", "guest", connectCallback, errorCallback);
    
    // Register handler for add button
    $(document).ready(function() {
      $('.add').click(function(e){
        e.preventDefault();
        var road = "null";
        var velocity = 0;
        var jsonstr = JSON.stringify({ 'name': road, 'velocity': velocity });
        stompClient.send("/app/addRoad", {}, jsonstr);
        return false;
      });
    });
    
    // Register handler for remove all button
    $(document).ready(function() {
      $('.remove-all').click(function(e) {
        e.preventDefault();
        stompClient.send("/app/clearRoads");
        return false;
      });
    });

  </script>
</form>
</h3>
</div>
</div>
</body>
</html>
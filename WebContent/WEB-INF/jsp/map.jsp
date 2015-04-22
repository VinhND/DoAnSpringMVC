<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data Transportation Map</title>
<link href="${pageContext.request.contextPath}/resources/leaflet/leaflet.css" rel="stylesheet" >
<script src="${pageContext.request.contextPath}/resources/leaflet/leaflet.js"></script>
<!--  script src="${pageContext.request.contextPath}/resources/js/osmdata.json"></script-->
<!-- script src="${pageContext.request.contextPath}/resources/js/data.json"></script-->
<script src="${pageContext.request.contextPath}/resources/js/modifiedOsmdata.json"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.min.js"></script>

<style type="text/css">
	html, body {
	   height:100%;on
	   margin: 0px;
	   background-color: 111111;
	}
	#main{
    width: 1200px;
    padding: 0;
    margin-left: auto;
    margin-right: auto;
}
#head{
    height: 90px;
     background-color: 111111;
    border: 1px solid #CDCDCD;
    margin-bottom:5px;
}
#out{
higth :10px;
background-color: SaddleBrown;
float:right;
}
#map{
	height:700px;
	width:600px;
	background-color: Saddle;
	float:left;
}
#graph-wrapper{
	height:700px;
	width:600px;
	background-color: Brown;
	float:right;	
}


/* Resets */
.graph-container,
.graph-container div,
.graph-container a,
.graph-container span {
    margin: 0;
    padding: 0;
}
.graph-container, #tooltip, .graph-info a {
    background: #ffffff;
    background: -moz-linear-gradient(top, #ffffff 0%, #f9f9f9 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#f9f9f9));
    background: -webkit-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -o-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -ms-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: linear-gradient(to bottom, #ffffff 0%,#f9f9f9 100%);
 
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.graph-container {
    position: relative;
    width: 550px;
    height: 540px;
    padding: 20px;
    float:right;
 
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    -moz-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    box-shadow: 0px 1px 2px rgba(0,0,0,.1);
}
 
.graph-container > div {
    position: absolute;
    width: inherit;
    height: inherit;
    top: 10px;
    left: 25px;
}
 
.graph-info {
    width: 590px;
    margin-bottom: 10px;
}
.graph-info a {
    position: relative;
    display: inline-block;
    float: left;
    height: 20px;
    padding: 7px 10px 5px 30px;
    margin-right: 10px;
    text-decoration: none;
    cursor: default;
}
.graph-info a:before {
    position: absolute;
    display: block;
    content: '';
    width: 8px;
    height: 8px;
    top: 13px;
    left: 13px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
 
.graph-info .visitors { border-bottom: 2px solid #71c73e; }
.graph-info .returning { border-bottom: 2px solid #77b7c5; }
 
.graph-info .visitors:before { background: #71c73e; }
.graph-info .returning:before { background: #77b7c5; }

#lines, #bars {
    width: 34px;
    height: 32px;
    padding: 0;
    margin-right: 0;
    margin-left: 10px;
    border-bottom: 2px solid #71c73e;
    float: right;
    cursor: pointer;
}
 
#lines.active, #bars.active {
    background: #82d344;
    background: -moz-linear-gradient(top, #82d344 0%, #71c73e 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#82d344), color-stop(100%,#71c73e));
    background: -webkit-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: -o-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: -ms-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: linear-gradient(to bottom, #82d344 0%,#71c73e 100%);
}
 
#lines span, #bars span {
    display: block;
    width: 34px;
    height: 32px;
    background: url('../img/lines.png') no-repeat 9px 12px;
}
 
#bars span { background: url('../img/bars.png') no-repeat center 10px; }
 
#lines.active span { background-image: url('../img/lines_active.png'); }
#bars.active span { background-image: url('../img/bars_active.png'); }
/* Clear Floats */
.graph-info:before, .graph-info:after,
.graph-container:before, .graph-container:after {
    content: '';
    display: block;
    clear: both;
} 

#tooltip {
     position: absolute;
     display: none;
     padding: 5px 10px;
     border: 1px solid #e1e1e1;
 }
</style>
<script type="text/javascript">
var map;


Number.prototype.toRad = function() {
	return this * Math.PI / 180;
}
function distance(lat1, lat2, lon1, lon2) {
	var R = 6371000; // meter
	var Phi1 = lat1.toRad();
	var Phi2 = lat2.toRad();
	var DeltaPhi = (lat2 - lat1).toRad();
	var DeltaLambda = (lon2 - lon1).toRad();

	var a = Math.sin(DeltaPhi / 2) * Math.sin(DeltaPhi / 2)
			+ Math.cos(Phi1) * Math.cos(Phi2) * Math.sin(DeltaLambda / 2)
			* Math.sin(DeltaLambda / 2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	var d = R * c;

	return d;
}

function init() {
	var mapMinZoom = 16;
	var mapMaxZoom = 18;
	map = L.map('map', {
		maxZoom: mapMaxZoom,
		minZoom: mapMinZoom
	}).setView([10.76459, 106.68514], 17);
	
	
	L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
		maxZoom: 18,
		attribution: 'Navis team &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
			'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery Â© <a href="http://mapbox.com">Mapbox</a>',
		id: 'examples.map-i875mjb7'
	}).addTo(map);
	var a= [[10.76124 ,106.68328],[10.76495, 106.68173]];
	var b= [
			[10.76496, 106.68175],
			[10.7645, 106.6813],
			[10.765, 106.682]
		];
/*
	var osmdata= JSON.parse(paths);
	var obj=[];
	var numPaths=osmdata.length;
	var numSegments=0;
	var numLL=0;
	for (var i=0 ; i<numPaths;i++){
	
		numSegments=osmdata[i].segments.length;
		for (var j=0;j<numSegments;j++){
			obj=[];
			numLL=osmdata[i].segments[j].length;
			for (var k=0;k<numLL;k++){
				obj.push(osmdata[i].segments[j][k]);			
			}
			var u = Math.floor(Math.random() * 4)+1;
			var v= Math.floor(Math.random() * 4)+1;
			if (u==1) L.polyline(obj,{color: 'red',weight:8}).addTo(map).bindPopup( "<b>ID duong :</b>"+osmdata[i].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==2) L.polyline(obj,{color: 'green',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[i].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==3) L.polyline(obj,{color: 'yellow',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[i].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==4) L.polyline(obj,{color: 'blue',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[i].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
		}
		
	}
	*/
	
	
	var bounds = map.getBounds();
    console.log(bounds._northEast);
    var center = map.getCenter();
	var osmdata= JSON.parse(paths);
	var radius = distance(center.lat,bounds._northEast.lat,center.lng,bounds._northEast.lng);
	console.log(radius);
	var obj=[];
	var arrR=[];
	var arrS=[];
	var numPaths=osmdata.length;
	//var numPaths=500;
	var numSegments=0;
	var numLL=0;
	for (var i=0 ; i<numPaths;i++){	    	
		numSegments=osmdata[i].segments.length;
		for (var j=0;j<numSegments;j++){
			obj=[];
			numLL=osmdata[i].segments[j].length;
			for (var k=0;k<numLL;k++){
				center = map.getCenter();
				console.log("cen="+center);
			//	console.log("lat="+osmdata[i].segments[j][k][0]);
				//obj.push(osmdata[i].segments[j][k]);
				var d= distance(center.lat,osmdata[i].segments[j][k][0],center.lng,osmdata[i].segments[j][k][1]);
				console.log("d="+d);
				if ( d> radius+100) {							
					break;
				}
				arrR.push(i);
				arrS.push(j);	
			}
			
		}
	}	
		
	for (var index=0;index<arrR.length;index++){
		obj=[];
		for (var k=0; k<osmdata[arrR[index]].segments[arrS[index]].length;k++ ){
			obj.push(osmdata[arrR[index]].segments[arrS[index]][k]);
			}
			
	var u = Math.floor(Math.random() * 4)+1;
	var v= Math.floor(Math.random() * 4)+1;

	if (u==1) 
		L.polyline(obj,{color: 'red',weight:8}).addTo(map).bindPopup( "<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
	if (u==2) 
		L.polyline(obj,{color: 'green',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
	if (u==3) 
		L.polyline(obj,{color: 'yellow',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
	if (u==4) 
		L.polyline(obj,{color: 'blue',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
	
	}
	
	var popup = L.popup();	
	function onMapClick(e) {
		popup
			.setLatLng(e.latlng)
			.setContent("You clicked the map at " + e.latlng.toString())
			.openOn(map);		
		var bounds = map.getBounds();
	     console.log(bounds._northEast);
	     var center = map.getCenter();
	     var zoo = map.getZoom();
	     console.log(center);
	     console.log(zoo);
	}
	map.on('click', onMapClick);
	
	

	
	map.on("dragstart", function(s){
	    var handler = function(e){
	    	
			var bounds = map.getBounds();
		     console.log(bounds._northEast);
		     var center = map.getCenter();
	    	var osmdata= JSON.parse(paths);
	    	var radius = distance(center.lat,bounds._northEast.lat,center.lng,bounds._northEast.lng);
	    	console.log(radius);
	    	var obj=[];
	    	var arrR=[];
	    	var arrS=[];
	    	var numPaths=osmdata.length;
	    	//var numPaths=500;
	    	var numSegments=0;
	    	var numLL=0;
	    	for (var i=0 ; i<numPaths;i++){	    	
	    		numSegments=osmdata[i].segments.length;
	    		for (var j=0;j<numSegments;j++){
	    			obj=[];
	    			numLL=osmdata[i].segments[j].length;
	    			for (var k=0;k<numLL;k++){
	    				center = map.getCenter();
	    				console.log("cen="+center);
	    			//	console.log("lat="+osmdata[i].segments[j][k][0]);
	    				//obj.push(osmdata[i].segments[j][k]);
	    				var d= distance(center.lat,osmdata[i].segments[j][k][0],center.lng,osmdata[i].segments[j][k][1]);
	    				console.log("d="+d);
						if ( d> radius+100) {							
							break;
						}
						arrR.push(i);
						arrS.push(j);	
	    			}
	    			
	    		}
	    	}	
	    		
	    	for (var index=0;index<arrR.length;index++){
	    		obj=[];
	    		for (var k=0; k<osmdata[arrR[index]].segments[arrS[index]].length;k++ ){
	    			obj.push(osmdata[arrR[index]].segments[arrS[index]][k]);
	    			}
	    			
	    	var u = Math.floor(Math.random() * 4)+1;
			var v= Math.floor(Math.random() * 4)+1;
		
			if (u==1) 
				L.polyline(obj,{color: 'red',weight:8}).addTo(map).bindPopup( "<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==2) 
				L.polyline(obj,{color: 'green',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==3) 
				L.polyline(obj,{color: 'yellow',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
			if (u==4) 
				L.polyline(obj,{color: 'blue',weight:8}).addTo(map).bindPopup("<b>ID duong :</b>"+osmdata[arrR[index]].id+"<br>Van toc Trung binh: "+u*0.24+v+ "<br>So xe la : "+v*16);
	  	
	    	}
	    	
	    	
//	        alert("Old point: "+ s.latlng);
//	        alert("New point: "+ e.latlng);
	        this.removeEventListener("dragend", handler);
	    
	    };
	    this.on("dragend", handler);
	});
}
</script>
<script>
$(document).ready(function () {

	// Graph Data ##############################################
	var graphData = [{
			// Visits
			data: [ [1, 5], [2, 4], [3, 7], [4,39], [5, 40], [6, 149], [7, 60], [8, 67],[9,38],[10,30],[11, 10], [12, 91], [13, 90], [14, 39], [15, 16], [16, 18], [17, 19], [18, 18],[19,38],[20,30],[21, 10], [22, 91]  ],
			color: '#71c73e'
		}, {
			// Returning Visits
			data: [ [1, 45.5], [2, 46.3], [3, 37.5], [4,39.5], [5, 40.1], [6, 14.5], [7, 16.5], [8, 17],[9,28],[10,30],[11, 26], [12, 7.5], [13, 12.3], [14, 30], [15, 31], [16, 33], [17, 19], [18, 15.7],[19,20.7],[20,30.5],[21, 34], [22, 40], [23, 45.4]   ],
			color: '#77b7c5',
			points: { radius: 4, fillColor: '#77b7c5' }
		}
	];
graphData[0].data.push([23, 94]);
	// Lines Graph #############################################
	$.plot($('#graph-lines'), graphData, {
		series: {
			points: {
				show: true,
				radius: 5
			},
			lines: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			color: '#646464',
			borderColor: 'transparent',
			borderWidth: 20,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 1,
			tickSize:2
		},
		yaxis: {
			tickSize: 50
		}
	});

	// Bars Graph ##############################################
	$.plot($('#graph-bars'), graphData, {
		series: {
			bars: {
				show: true,
				barWidth: .9,
				align: 'center'
			},
			shadowSize: 0
		},
		grid: {
			color: '#646464',
			borderColor: 'transparent',
			borderWidth: 20,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 1,
			tickSize:2
		},
		yaxis: {
			tickSize: 50
		}
	});

	// Graph Toggle ############################################
	$('#graph-bars').hide();

	$('#lines').on('click', function (e) {
		$('#bars').removeClass('active');
		$('#graph-bars').fadeOut();
		$(this).addClass('active');
		$('#graph-lines').fadeIn();
		e.preventDefault();
	});

	$('#bars').on('click', function (e) {
		$('#lines').removeClass('active');
		$('#graph-lines').fadeOut();
		$(this).addClass('active');
		$('#graph-bars').fadeIn().removeClass('hidden');
		e.preventDefault();
	});

	// Tooltip #################################################
	function showTooltip(x, y, contents) {
		$('<div id="tooltip">' + contents + '</div>').css({
			top: y - 26,
			left: x + 20
		}).appendTo('body').fadeIn();
	}

	var previousPoint = null;

	$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
	    console.log("event= " +event);
        console.log(pos);
        console.log(item);
		if (item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;
				$('#tooltip').remove();
				var x = item.datapoint[0],
					y = item.datapoint[1];
				if (item.seriesIndex==0){
					showTooltip(item.pageX, item.pageY, y + ' Car at' + x + 'h');
				}
				else showTooltip(item.pageX, item.pageY, y + ' km/h at' + x + 'h');
			}
		} else {
			$('#tooltip').remove();
			previousPoint = null;
		}
	});

});
</script>

</head>
<body onload="init();">
<div id="main">
	<div id="head">
  	<h1 style="text-align: center;margin-bottom: 6px;">TRAFFIC OFFLINE</h1>
  	
  	<div id="out">
  	<!-- 
<a href="${pageContext.request.contextPath}/taikhoan/logout.html">Logout</a>
 -->
 <a href="${pageContext.request.contextPath}/realtime">Realtime</a>
	</div>
	</div>
	<div id="map">
	</div>
	<div id="graph-wrapper">
			<h1> This is Graphic</h1>
		    <div class="graph-info">
       		 <a href="javascript:void(0)" class="visitors">Num of Vehicles</a>
      		  <a href="javascript:void(0)" class="returning">Advantage of speed</a>
 
       		 <a href="#" id="bars"><span></span></a>
       		 <a href="#" id="lines" class="active"><span></span></a>
   			 </div>
 
    		<div class="graph-container">
       		 <div id="graph-lines"></div>
       		 <div id="graph-bars"></div>
    		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring MVC Tutorial Series by Crunchify.com</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" >  --%>
<style type="text/css">
	html, body, #OSMMap{
		width: 100%;
		height: 100%;
		margin: 0;
	}
	canvas#drawcanvas {
		pointer-events : none;
	}
	
</style>
<script src="${pageContext.request.contextPath}/resources/js/osm/OpenLayer.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/osm/OptionMap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/osm/CanvasSystem.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/osm/SupportSystem.js"></script>
<script>
	var map;
	var canvas;
	var encodedPoints;
	var markers;
	var pi_180 = Math.PI / 180.0;
	var pi_4   = Math.PI * 4;
	
	function init() {
		map = new OpenLayers.Map("OSMMap", {
            eventListeners: {
                "moveend": CanvasSystem.handleEventMouseEnd,
                "zoomend": CanvasSystem.handleEventMouseEnd,
                "movestart": CanvasSystem.handleEventMouseStart,
                "zoomstart": CanvasSystem.handleEventMouseStart
                // "changelayer": mapLayerChanged,
                // "changebaselayer": mapBaseLayerChanged
            }
        });
		markers = new OpenLayers.Layer.Markers( "Markers" );
		
		var mapLayerOSM         = new OpenLayers.Layer.OSM(OSMOptionLayer.OpenCycleMap.name, OSMOptionLayer.OpenCycleMap.url);
        var centerPosition       = SupportSystem.wgsToSmp(106.47855, 10.75078); //lon, lat
        var zoom           = 10;

        controls = map.getControlsByClass('OpenLayers.Control.Navigation');


        map.addLayer(mapLayerOSM);
        map.addLayer(markers);
        map.setCenter(centerPosition, zoom );
        
        CanvasSystem.init();
        
        encodedPoints = new Array();
        /*$.getScript('Point.js', function(){

            for (var i = 0; i < points.length; i++) {
               var encodedPoint = new Object();
								var sinLatitude = Math.sin(points[i].lat * pi_180);

								encodedPoint.Y = (0.5 - Math.log((1 + sinLatitude) / (1 - sinLatitude)) / (pi_4));
								encodedPoint.X = ((points[i].lon + 180) / 360);
               encodedPoint.lat = points[i].lat;
               encodedPoint.lon = points[i].lon;
								encodedPoints.push(encodedPoint);

            }
            CanvasSystem.draw();
        }); */
	}

</script>
</head>
<body onload="init();">
	<div id="OSMMap"></div>
</body>
</html>
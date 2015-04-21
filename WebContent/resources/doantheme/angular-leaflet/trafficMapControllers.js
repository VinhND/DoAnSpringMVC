var trafficMapControllers = angular.module("trafficMapControllers", ["leaflet-directive"]);

trafficMapControllers.controller("trafficMapController", [ "$scope","leafletData", function($scope,leafletData) {
 leafletData.getMap("mymap").then(function(map) {
	// L.GeoIP.centerMapOnPosition(map);
	 console.log("i got leftletData");
	     				                });
	     				                                                      	
	//initial map
	trafficMapControllers.initialMap($scope);
		
	//initial socket
	trafficMapControllers.initialSocket($scope);
    	
}]);


/**  
 * INITIAL MAP 
 * */

//var json= require("/home/hduser/Desktop/modifiedOsmdataForJava.json");
//console.log(osmdata);
//$.getJSON("/home/hduser/Desktop/modifiedOsmdataForJava.json", function(json) {
//    console.log(json); // this will show the info it in firebug console
//});


//var p1Incluse= [{ "lat": 10.77, "lng": 106.69 },{ "lat": 10.775, "lng": 106.68 },{ "lat": 10.77, "lng": 106.670830249786 }]

//pp.add(data.info[1].segments[0][1][1]);
//pp.add(data.info[1].segments[0][1][2]);
//alert(pp);
trafficMapControllers.initialMap = function($scope) {
	
	   // function to draw path on map
//    $scope.drawRoute = function(shape_id){
//        // get path coordinates
//        Route.getCoords(shape_id, function(points){
//            var newPath = {
//                color:'red',
//                weight: 4,
//                latlngs: []
//            };
//
//            // create array of latlngs
//            angular.forEach(points, function(point){
//                 // each point looks like this: ["1001", "-1.320547", "36.70583"]
//                var coord = {
//                    lat: point[1],
//                    lng: point[2]
//                };
//                newPath.latlngs.push(coord);
//            });
//            var pathName = shape_id;
//
//            // add path to $scope
//            $scope.paths[pathName] = newPath;
//
//        }, function(error){
//            $scope.routeToDraw  = error;
//        });
//    };
//	
	
	
	var pp=[];
//	pp.add(data.info[1].segments[0][1][1]);
//	pp.add(data.info[1].segments[0][1][2]);
//	console.log(pp);
	angular.extend($scope, {
        center: {
        	 lat: 10.77,
             lng: 106.69,
             zoom: 17
        },
        paths: {
         p1:{
            	 color: '#008000',
               weight: 8,
               opacity: 0.8,
               latlngs:pp,
            	
            }           
        }, 
        defaults: {
        	maxZoom: 18,
        	minZoom: 10,
        	doubleClickZoom: true,
            scrollWheelZoom: true,
            attributionControl: true,
            tileLayer: 'https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png',
            tileLayerOptions: {
            	id: 'examples.map-i875mjb7',
                attribution: 'Navis team &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
    			'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    			'Imagery © <a href="http://mapbox.com">Mapbox</a>'
            }
        }
	});
	/*
	 * Get Distance between two poits 
	 */

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
	
	/*
	 * Change color of path
	 */
	$scope.changeColorForPath = function(/** Double*/ velocity) {
		
		$.getJSON('http://localhost:8080/DoAnSpringMVC/resources/js/modifiedOsmdataForJava.json', function(data) {
				latcen=$scope.center.lat;
				lngcen=$scope.center.lng;
				cent= $scope.center;
				zoo= $scope.bounds.southWest;
				var radius = (distance(latcen,zoo.lat,lngcen,zoo.lng));
				var arrRoad=[];
				var arrSeg=[];
				for(var i=0;i<data.info.length;i++){
					//console.log(data.info[i].segments.length);
					for (var j=0;j<data.info[i].segments.length;j++){
					//	console.log(data.info[i].segments[j][j+1][0]);
						var d=distance(data.info[i].segments[j][j+1][0].lat,latcen,data.info[i].segments[j][j+1][0].lng,lngcen);						
						if ( d> radius+100) {							
							break;
						}
						arrRoad.push(i);
						arrSeg.push(j);						
					}
					
				}
				console.log(arrRoad.length+" __  "+arrRoad[0]+" & "+ arrSeg[0]);
				console.log(arrRoad.length);
				for (var index=0;index<arrRoad.length;index++){
				//	console.log(" Ri Sj :"+arrRoad[index]+" & "+ arrSeg[index]);
					var nameRoad= data.info[arrRoad[index]].id+"_"+(arrSeg[index]+1);
				for (var i=0;i<data.info[arrRoad[index]].segments[arrSeg[index]][arrSeg[index]+1].length;i++){
					pp.push(data.info[arrRoad[index]].segments[arrSeg[index]][arrSeg[index]+1][i]);				
				
                $scope.paths[nameRoad] = {
                   	 color: 'green',
                     weight: 8,
                     opacity: 0.8,
                     latlngs: pp
                    };
				}
				 console.log(pp	);
				 var u = Math.floor(Math.random() * 4);
				 if (u==0) $scope.paths[nameRoad].color="red";
				 if (u==1) $scope.paths[nameRoad].color="blue";
				 if (u==2) $scope.paths[nameRoad].color="green";
				 if (u==3) $scope.paths[nameRoad].color="black";
				pp=[];
				}
			});		
//		if (velocity > 3) {
//			$scope.paths.p1.color = "#003";
//		} else {
//			$scope.paths.p1.color = "#000";
//		}	
	}
	}
/** END MAP */

/** 
 * INITIAL SOCKET 
 * */
trafficMapControllers.initialSocket = function($scope) {
	$scope.socket = {
			client: null,
			stomp: null
	};
		
	$scope.connectFunction = function(/**Message */ message) {
		$scope.road= JSON.parse(message.body);
		
		$scope.changeColorForPath($scope.road[0].velocity);
		console.log("$scope.road[0]=");
		console.log($scope.road[0]);
		
		//update $scope
		$scope.$apply();
	}
	
	
	
	$scope.initSockets = function() {
		$scope.socket.client = new SockJS('/DoAnSpringMVC/ws');
		$scope.socket.stomp = Stomp.over($scope.socket.client);
		$scope.socket.stomp.connect({}, function() {
			//this socket will subscribe "road" topic and get all data from it.
			$scope.socket.stomp.subscribe("/topic/road", $scope.connectFunction);
			
		});
		$scope.socket.client.onclose = $scope.reconnect;
	};
	
	$scope.initSockets();
}
/** END SOCKET */
/**
* @author: Truong Hoang Linh
*/

var SupportSystem = {
    /**
     * transform between 2 coordinator
     * @return: OpenLayers.LonLat
     */
    abstracTransform : function(lon, lat, isWGStoSMP) {
       var newPosition = null;
       var fromProjection = (isWGStoSMP) ? new OpenLayers.Projection("EPSG:4326") : new OpenLayers.Projection("EPSG:900913");
       var toProjection = (isWGStoSMP) ? new OpenLayers.Projection("EPSG:900913") : new OpenLayers.Projection("EPSG:4326");


       newPosition  = new OpenLayers.LonLat(lon,lat).transform( fromProjection, toProjection);

       if (newPosition)
         return newPosition;

       alert("Error on SupportSystem.transform");
    },
    wgsToSmp : function(lon, lat) {
      return this.abstracTransform(lon, lat, true);
    },
    smpToWgs : function(lon, lat) {
      return this.abstracTransform(lon, lat, false);
    },


    addMarker: function(lon, lat) {
      if (markers == null) {
          alert("markers mustn't null");
      }
      var position = this.wgsToSmp(lon, lat);
      markers.addMarker(new OpenLayers.Marker(position));
    },


    LatLongToPixelXYOffset: function(latitude, longitude, levelOfDetail) {

				var sinLatitude = Math.sin(latitude * pi_180);
				var pixelY = (0.5 - Math.log((1 + sinLatitude) / (1 - sinLatitude)) /(pi_4)) * 256 * Math.pow(2, levelOfDetail);
				var pixelX = ((longitude + 180) / 360) * 256 * Math.pow(2, levelOfDetail) ;

				var pixel = new Object();
				pixel.x = (0.5 + pixelX) | 0;
				pixel.y = (0.5 + pixelY) | 0;

				return pixel;
		},


    LatLongToPixelXY: function(encodedPoint, mapFactor) {

				var pixelY = encodedPoint.Y * mapFactor;
				var pixelX = encodedPoint.X * mapFactor;

				var pixel = new Object();
				pixel.x = (0.5 + pixelX) | 0;
				pixel.y = (0.5 + pixelY) | 0;

				return pixel;
			}

}

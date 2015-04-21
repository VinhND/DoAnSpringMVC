/*
 * @author: Truong Hoang Linh
 */
var CanvasSystem =  {
    isHasCanvas : false,
  /**
   * [init canvas]
   */
    init: function() {
      canvas = document.createElement('canvas');
      canvas.id = 'drawcanvas';
      canvas.style.position = 'relative';
      canvas.style.zIndex = 1000;
      canvas.height = $('div#OSMMap').height();
      canvas.width = $('div#OSMMap').width();
      // add canvas into viewPort of map
      map.viewPortDiv.appendChild(canvas);
      this.isHasCanvas = true;
    },

    /**
     *
     */
    clearCanvas: function() {
        var context = canvas.getContext("2d");
        context.clearRect(0, 0, canvas.width, canvas.height);
    },


   /**
    * Draw data point in canvas
    */
    draw: function() {
      var context = canvas.getContext("2d");
      //getBounds
      var bounds = map.calculateBounds(map.getCenter(), map.getResolution());
      var zoomLevel = map.getZoom();
      // change lat, lon from SMP to WGS
      var minCoor = SupportSystem.smpToWgs(bounds.left, bounds.bottom);
      var maxCoor = SupportSystem.smpToWgs(bounds.right, bounds.top);

      var maxLatitude = maxCoor.lat; //nord
      var minLatitude = minCoor.lat; //south
      var maxLongitude = maxCoor.lon; //east
      var minLongitude = minCoor.lon; //west


      var topLeftCorner = SupportSystem.LatLongToPixelXYOffset(
      maxCoor.lat, minCoor.lon, zoomLevel);

      var offsetX = topLeftCorner.x;
      var offsetY = topLeftCorner.y;
      // console.log(offsetX + ", " + offsetY);


//      SupportSystem.addMarker(minLongitude, minLatitude);
      var imageData = context.createImageData(canvas.width, canvas.height);
      // console.log(minLatitude + " " + maxLatitude);
      // console.log(minLongitude + " " + maxLongitude);
    //  SupportSystem.addMarker(bounds.right, bounds.top);
      var pointsDrawn = 0;

      var mapFactor = 256 * (2 << (zoomLevel-1));

      var pixelWidth = zoomLevel <= 8.0 ? 0 : Math.round(zoomLevel - 8 );


      for (var i = 0; i < encodedPoints.length; i++) {

          var loc = encodedPoints[i];
          // console.log(loc.lat + ", " + loc.lon);
          //discard coordinates outside the current map view
          if (loc.lat >= minLatitude && loc.lat <= maxLatitude &&
              loc.lon >= minLongitude && loc.lon <= maxLongitude) {

              pointsDrawn++;
            //  var pixelCoordinate = new OpenLayers.Pixel().initializePlus(loc.lon, loc.lat);
//              SupportSystem.addMarker(loc.lon, loc.lat);

               var point = SupportSystem.LatLongToPixelXY(loc, mapFactor);
                var x = point.x - offsetX;
                var y = point.y - offsetY;

              // for(var u = -pixelWidth; u <= pixelWidth; u++) {
							// for(var v = -pixelWidth; v <= pixelWidth;  v++) {
							// 	this.setPixel(imageData, x+u,   y+v, 255, 0, 0, 120);
               this.setPixel(imageData, x, y, 255, 0, 0, 120);
						 //}
					//	}


          }
      }
      // console.log(pointsDrawn);
      context.putImageData(imageData, 0, 0);
    },

    /**
     * Set color for relevent Pixel
     */
    setPixel: function(imageData, x, y, r, g, b, a) {
            //find the pixel index based on it's coordinates
        var  index = (x + y * imageData.width) * 4;
            imageData.data[index + 0] = r;
            imageData.data[index + 1] = g;
            imageData.data[index + 2] = b;
            imageData.data[index + 3] = a;
    },

    /**
     * handle event
     */
    handleEventMouseEnd: function(event) {
      if (!CanvasSystem.isHasCanvas) return;
      CanvasSystem.draw();
    },
    handleEventMouseStart: function(event) {
      if (!CanvasSystem.isHasCanvas) return;
      CanvasSystem.clearCanvas();
    }
}

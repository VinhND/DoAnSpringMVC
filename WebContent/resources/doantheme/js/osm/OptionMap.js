/**
* Other Layer Of OSM
* @author: TrƯơng Hoàng Linh
*/
var OSMOptionLayer = [];
//Layer TransportationMap
OSMOptionLayer.TransportMap = {
      name: "TransportMap",
      url : [ "http://a.tile2.opencyclemap.org/transport/${z}/${x}/${y}.png",
              "http://b.tile2.opencyclemap.org/transport/${z}/${x}/${y}.png",
              "http://c.tile2.opencyclemap.org/transport/${z}/${x}/${y}.png" ]
    };

//Layer CircleMap
OSMOptionLayer.OpenCycleMap = {
      name: "OpenCycleMap",
      url : [ "http://a.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png",
              "http://b.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png",
              "http://c.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png" ]
    };

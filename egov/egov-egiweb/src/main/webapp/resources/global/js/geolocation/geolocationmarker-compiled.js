(function(){var b=!0,d=null,e;
function g(a,c,f){var h={clickable:!1,cursor:"pointer",draggable:!1,flat:b,icon:{url:"https://github.com/googlemaps/js-marker-clusterer/blob/gh-pages/images/pin.png",size:new google.maps.Size(34,34),scaledSize:new google.maps.Size(17,17),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(8,8)},optimized:!1,position:new google.maps.LatLng(0,0),title:"Current location",zIndex:2};c&&(h=k(h,c));c={clickable:!1,radius:0,strokeColor:"1bb6ff",strokeOpacity:0.4,fillColor:"61a0bf",
fillOpacity:0.4,strokeWeight:1,zIndex:1};f&&(c=k(c,f));this.b=new google.maps.Marker(h);this.a=new google.maps.Circle(c);this.map=this.position=this.accuracy=d;this.set("minimum_accuracy",d);this.set("position_options",{enableHighAccuracy:b,maximumAge:1E3});this.a.bindTo("map",this.b);a&&this.c(a)}g.prototype=new google.maps.MVCObject;
g.prototype.set=function(a,c){if(/^(?:position|accuracy)$/i.test(a))throw"'"+a+"' is a read-only property.";/map/i.test(a)?this.c(c):google.maps.MVCObject.prototype.set.apply(this,arguments)};e=g.prototype;e.b=d;e.a=d;e.h=function(){return this.map};e.f=function(){return this.get("position_options")};e.n=function(a){this.set("position_options",a)};e.i=function(){return this.position};e.g=function(){return this.position?this.a.getBounds():d};e.j=function(){return this.accuracy};e.d=function(){return this.get("minimum_accuracy")};
e.m=function(a){this.set("minimum_accuracy",a)};e.e=-1;e.c=function(a){this.map=a;this.notify("map");a?l(this):(this.b.unbind("position"),this.a.unbind("center"),this.a.unbind("radius"),this.position=this.accuracy=d,navigator.geolocation.clearWatch(this.e),this.e=-1,this.b.setMap(a))};e.l=function(a){this.b.setOptions(k({},a))};e.k=function(a){this.a.setOptions(k({},a))};
function l(a){navigator.geolocation&&(a.e=navigator.geolocation.watchPosition(function(c){a:{var f=new google.maps.LatLng(c.coords.latitude,c.coords.longitude),h=a.b.getMap()==d;if(h){if(a.d()!=d&&c.coords.accuracy>a.d())break a;a.b.setMap(a.map);a.b.bindTo("position",a);a.a.bindTo("center",a,"position");a.a.bindTo("radius",a,"accuracy")}a.accuracy!=c.coords.accuracy&&google.maps.MVCObject.prototype.set.call(a,"accuracy",c.coords.accuracy);(h||a.position==d||!a.position.equals(f))&&google.maps.MVCObject.prototype.set.call(a,
"position",f)}},function(c){google.maps.event.trigger(a,"geolocation_error",c)},a.f()))}function k(a,c){for(var f in c)m[f]!==b&&(a[f]=c[f]);return a}var m={map:b,position:b,radius:b};g.prototype.getAccuracy=g.prototype.j;g.prototype.getBounds=g.prototype.g;g.prototype.getMap=g.prototype.h;g.prototype.getMinimumAccuracy=g.prototype.d;g.prototype.getPosition=g.prototype.i;g.prototype.getPositionOptions=g.prototype.f;g.prototype.setCircleOptions=g.prototype.k;g.prototype.setMap=g.prototype.c;g.prototype.setMarkerOptions=g.prototype.l;g.prototype.setMinimumAccuracy=g.prototype.m;g.prototype.setPositionOptions=g.prototype.n;window.GeolocationMarker=g;})()

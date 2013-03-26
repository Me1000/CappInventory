@STATIC;1.0;I;21;Foundation/CPObject.ji;12;CPLocation.jt;3040;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPLocation.j",YES);
CPDirectionsDrivingMode=google.maps.DirectionsTravelMode.DRIVING;
CPDirectionsWalkingMode=google.maps.DirectionsTravelMode.WALKING;
var _1=objj_allocateClassPair(CPLocation,"CPDirections"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_service"),new objj_ivar("_renderer"),new objj_ivar("origin"),new objj_ivar("destination"),new objj_ivar("travelMode"),new objj_ivar("mapView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("origin"),function(_3,_4){
with(_3){
return origin;
}
}),new objj_method(sel_getUid("setOrigin:"),function(_5,_6,_7){
with(_5){
origin=_7;
}
}),new objj_method(sel_getUid("destination"),function(_8,_9){
with(_8){
return destination;
}
}),new objj_method(sel_getUid("setDestination:"),function(_a,_b,_c){
with(_a){
destination=_c;
}
}),new objj_method(sel_getUid("travelMode"),function(_d,_e){
with(_d){
return travelMode;
}
}),new objj_method(sel_getUid("setTravelMode:"),function(_f,_10,_11){
with(_f){
travelMode=_11;
}
}),new objj_method(sel_getUid("mapView"),function(_12,_13){
with(_12){
return mapView;
}
}),new objj_method(sel_getUid("setMapView:"),function(_14,_15,_16){
with(_14){
mapView=_16;
}
}),new objj_method(sel_getUid("init"),function(_17,_18){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPDirections").super_class},"init");
if(_17){
_service=new google.maps.DirectionsService();
_renderer=new google.maps.DirectionsRenderer();
travelMode=CPDirectionsDrivingMode;
}
return _17;
}
}),new objj_method(sel_getUid("setMapView:"),function(_19,_1a,_1b){
with(_19){
mapView=_1b;
if(mapView&&mapView._map){
_renderer.setMap(mapView._map);
}else{
_renderer.setMap(nil);
}
}
}),new objj_method(sel_getUid("routeWithMap:detailsView:"),function(_1c,_1d,_1e,_1f){
with(_1c){
if(!origin||!destination||!travelMode){
return;
}
var _20={"origin":objj_msgSend(origin,"lat")?objj_msgSend(origin,"_gLatLng"):objj_msgSend(origin,"description"),"destination":objj_msgSend(destination,"lat")?objj_msgSend(destination,"_gLatLng"):objj_msgSend(destination,"description"),"travelMode":travelMode};
_service.route(_20,function(_21,_22){
if(_22==google.maps.DirectionsStatus.OK){
_renderer.setMap(_1e._map);
objj_msgSend(_1f,"clear");
_renderer.setPanel(objj_msgSend(_1f,"theDiv"));
_renderer.setDirections(_21);
window.setTimeout(function(){
objj_msgSend(_1f,"_resizeFrame");
},1000);
}else{
_renderer.setDirections(nil);
}
});
}
}),new objj_method(sel_getUid("route:"),function(_23,_24,_25){
with(_23){
if(!origin||!destination||!travelMode){
return;
}
var _26={"origin":objj_msgSend(origin,"lat")?objj_msgSend(origin,"_gLatLng"):objj_msgSend(origin,"description"),"destination":objj_msgSend(destination,"lat")?objj_msgSend(destination,"_gLatLng"):objj_msgSend(destination,"description"),"travelMode":travelMode};
_service.route(_26,function(_27,_28){
if(_28==google.maps.DirectionsStatus.OK){
_renderer.setDirections(_27);
}else{
_renderer.setDirections(nil);
}
});
}
})]);

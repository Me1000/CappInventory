@STATIC;1.0;I;15;AppKit/CPView.ji;12;CPMapImage.ji;13;CPMapMarker.jt;7137;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("CPMapImage.j",YES);
objj_executeFile("CPMapMarker.j",YES);
CPMapTypeRoadmap=google.maps.MapTypeId.ROADMAP;
CPMapTypeSatellite=google.maps.MapTypeId.SATELLITE;
CPMapTypeTerrain=google.maps.MapTypeId.TERRAIN;
CPMapTypeHybrid=google.maps.MapTypeId.HYBRID;
CPMapViewWillLoad="CPMapViewWillLoad";
CPMapViewDidLoad="CPMapViewDidLoad";
var _1=[];
_1[CPMinXEdge]=google.maps.ControlPosition.LEFT;
_1[CPMaxXEdge]=google.maps.ControlPosition.RIGHT;
_1[CPMinYEdge]=google.maps.ControlPosition.TOP;
_1[CPMaxYEdge]=google.maps.ControlPosition.BOTTOM;
_1[CPMinXEdge&CPMinYEdge]=google.maps.ControlPosition.TOP_LEFT;
_1[CPMinXEdge&CPMaxYEdge]=google.maps.ControlPosition.BOTTOM_LEFT;
_1[CPMaxXEdge&CPMinYEdge]=google.maps.ControlPosition.TOP_RIGHT;
_1[CPMaxXEdge&CPMaxYEdge]=google.maps.ControlPosition.BOTTOM_RIGHT;
var _2=objj_allocateClassPair(CPView,"CPMapView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_map"),new objj_ivar("mapLoaded"),new objj_ivar("mapTypeEdge"),new objj_ivar("delegate"),new objj_ivar("location"),new objj_ivar("locationMarker"),new objj_ivar("_overlay")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("mapLoaded"),function(_4,_5){
with(_4){
return mapLoaded;
}
}),new objj_method(sel_getUid("mapTypeEdge"),function(_6,_7){
with(_6){
return mapTypeEdge;
}
}),new objj_method(sel_getUid("setMapTypeEdge:"),function(_8,_9,_a){
with(_8){
mapTypeEdge=_a;
}
}),new objj_method(sel_getUid("delegate"),function(_b,_c){
with(_b){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_d,_e,_f){
with(_d){
delegate=_f;
}
}),new objj_method(sel_getUid("location"),function(_10,_11){
with(_10){
return location;
}
}),new objj_method(sel_getUid("setLocation:"),function(_12,_13,_14){
with(_12){
location=_14;
}
}),new objj_method(sel_getUid("locationMarker"),function(_15,_16){
with(_15){
return locationMarker;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPMapView").super_class},"initWithFrame:",_19);
if(_17){
mapTypeEdge=CPMaxXEdge|CPMinYEdge;
}
return _17;
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPMapView").super_class},"resizeWithOldSuperviewSize:",_1c);
if(_map){
google.maps.event.trigger(_map,"resize");
}
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_1d,_1e){
with(_1d){
window.setTimeout(function(){
var _1f=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1f,"postNotificationName:object:",CPMapViewWillLoad,_1d);
_map=new google.maps.Map(_DOMElement,{mapTypeId:CPMapTypeRoadmap});
mapLoaded=YES;
_overlay=new NilOverlay({"map":_map});
google.maps.event.addListener(_map,"zoom_changed",function(){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("mapViewDidZoom:"))){
objj_msgSend(delegate,"mapViewDidZoom:",_1d);
}
});
google.maps.event.addListener(_map,"maptypeid_changed",function(){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("mapViewDidChangeType:"))){
objj_msgSend(delegate,"mapViewDidChangeType:",_1d);
}
});
objj_msgSend(_1f,"postNotificationName:object:",CPMapViewDidLoad,_1d);
},0);
}
}),new objj_method(sel_getUid("release"),function(_20,_21){
with(_20){
if(_map){
_map=nil;
}
objj_msgSendSuper({receiver:_20,super_class:objj_getClass("CPMapView").super_class},"release");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(delegate){
objj_msgSend(_25,"removeObserver:name:object:",delegate,CPMapViewWillLoad,_22);
objj_msgSend(_25,"removeObserver:name:object:",delegate,CPMapViewDidLoad,_22);
}
delegate=_24;
if(delegate){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("mapViewWillLoad:"))){
objj_msgSend(_25,"addObserver:selector:name:object:",delegate,sel_getUid("mapViewWillLoad:"),CPMapViewWillLoad,_22);
}
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("mapViewDidLoad:"))){
objj_msgSend(_25,"addObserver:selector:name:object:",delegate,sel_getUid("mapViewDidLoad:"),CPMapViewDidLoad,_22);
}
}
}
}),new objj_method(sel_getUid("setLocation:"),function(_26,_27,_28){
with(_26){
if(location){
objj_msgSend(locationMarker,"setMapView:",nil);
locationMarker=nil;
}
location=_28;
if(location){
locationMarker=objj_msgSend(_28,"marker");
window.setTimeout(function(){
if(!_map){
return;
}
var _29=_map.getZoom();
_map.setCenter(objj_msgSend(locationMarker,"_position"));
if(!_29){
_map.setZoom(13);
}
objj_msgSend(locationMarker,"setMapView:",_26);
},0);
}
}
}),new objj_method(sel_getUid("setMapTypeEdge:"),function(_2a,_2b,_2c){
with(_2a){
if(mapTypeEdge===_2c){
return;
}
mapTypeEdge=_2c;
window.setTimeout(function(){
if(!_map){
return;
}
_map.setOptions({mapTypeControlOptions:{position:_1[mapTypeEdge]}});
},0);
}
}),new objj_method(sel_getUid("zoom"),function(_2d,_2e){
with(_2d){
if(!_map){
return;
}
return _map.getZoom();
}
}),new objj_method(sel_getUid("setZoom:"),function(_2f,_30,_31){
with(_2f){
if(!_map){
return;
}
_map.setZoom(_31);
}
}),new objj_method(sel_getUid("mapType"),function(_32,_33){
with(_32){
if(!_map){
return;
}
return _map.getMapTypeId();
}
}),new objj_method(sel_getUid("setMapType:"),function(_34,_35,_36){
with(_34){
if(!_map){
return;
}
_map.setMapTypeId(_36);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_37,_38,_39){
with(_37){
objj_msgSend(objj_msgSend(objj_msgSend(_37,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("pointFromLocation:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=_overlay.getProjection(),_3e=_3d.fromLatLngToDivPixel(objj_msgSend(_3c,"_gLatLng"));
if(_3e){
return CGPointMake(_3e.x,_3e.y);
}
}
}),new objj_method(sel_getUid("locationFromPoint:"),function(_3f,_40,_41){
with(_3f){
var _42=_overlay.getProjection(),_43=new google.maps.Point(_41.x,_41.y),ll=_42.fromDivPixelToLatLng(_43);
if(ll){
var loc=objj_msgSend(objj_msgSend(CPLocation,"alloc"),"init");
objj_msgSend(loc,"_setGLatLng:",ll);
return loc;
}
}
}),new objj_method(sel_getUid("_gBounds"),function(_44,_45){
with(_44){
if(_map){
return _map.getBounds();
}
}
}),new objj_method(sel_getUid("fitLocations:"),function(_46,_47,_48){
with(_46){
var _49=new google.maps.LatLngBounds();
for(var i=0,_4a=objj_msgSend(_48,"count");i<_4a;i++){
_49.extend(objj_msgSend(_48[i],"_gLatLng"));
}
if(_map){
_map.fitBounds(_49);
}
}
})]);
NilOverlay=function(_4b){
this.setValues(_4b);
var div=this.div_=document.createElement("div");
div.className="overlay";
};
NilOverlay.prototype=new google.maps.OverlayView;
NilOverlay.prototype.onAdd=function(){
var _4c=this.getPanes().overlayLayer;
_4c.appendChild(this.div_);
};
NilOverlay.prototype.onRemove=function(){
this.div_.parentNode.removeChild(this.div_);
};
NilOverlay.prototype.draw=function(){
var _4d=this.getProjection(),pos=_4d.fromLatLngToDivPixel(this.getMap().getCenter());
var div=this.div_;
div.style.left=pos.x+"px";
div.style.top=pos.y+"px";
div.style.display="block";
};

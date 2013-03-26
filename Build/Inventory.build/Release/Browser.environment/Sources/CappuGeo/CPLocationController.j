@STATIC;1.0;I;21;Foundation/CPObject.ji;12;CPLocation.ji;11;CPMapView.jt;5346;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPLocation.j",YES);
objj_executeFile("CPMapView.j",YES);
var _1;
CurrentLocationDidChange="CurrentLocationDidChange";
MapsAPIIsLoaded=NO;
geoip_region=nil;
CPLocationControllerLoadMapsAPI=function(_2){
if(MapsAPIIsLoaded){
return;
}
google.load("maps","3",{"other_params":{"sensor":true}});
google.setOnLoadCallback(function(){
MapsAPIIsLoaded=YES;
if(_2){
_2();
}
});
};
var _3=objj_allocateClassPair(CPObject,"CPLocationController"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("currentLocation"),new objj_ivar("trackingInterval"),new objj_ivar("_trackingInterval"),new objj_ivar("_nativeLocationHasFailed"),new objj_ivar("_sensorLocationCallback")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("currentLocation"),function(_5,_6){
with(_5){
return currentLocation;
}
}),new objj_method(sel_getUid("setCurrentLocation:"),function(_7,_8,_9){
with(_7){
currentLocation=_9;
}
}),new objj_method(sel_getUid("trackingInterval"),function(_a,_b){
with(_a){
return trackingInterval;
}
}),new objj_method(sel_getUid("setTrackingInterval:"),function(_c,_d,_e){
with(_c){
trackingInterval=_e;
}
}),new objj_method(sel_getUid("startTrackingLocation"),function(_f,_10){
with(_f){
if(_trackingInterval){
objj_msgSend(_f,"stopTrackingLocation");
}
if(!trackingInterval){
trackingInterval=3*60*1000;
}
_trackingInterval=window.setInterval(function(){
objj_msgSend(_f,"locate");
},trackingInterval);
objj_msgSend(_f,"locate");
}
}),new objj_method(sel_getUid("stopTrackingLocation"),function(_11,_12){
with(_11){
if(!_trackingInterval){
return;
}
window.clearInterval(_trackingInterval);
}
}),new objj_method(sel_getUid("locate"),function(_13,_14){
with(_13){
if(!_nativeLocationHasFailed&&navigator&&navigator.geolocation){
navigator.geolocation.getCurrentPosition(function(loc){
if(!loc||!loc.coords.latitude||!loc.coords.longitude){
_nativeLocationHasFailed=YES;
objj_msgSend(_13,"locate");
return;
}
var _15=objj_msgSend(objj_msgSend(CPLocation,"alloc"),"init");
objj_msgSend(_15,"setLat:",loc.coords.latitude);
objj_msgSend(_15,"setLon:",loc.coords.longitude);
objj_msgSend(_15,"_setSensorLat:",loc.coords.latitude);
objj_msgSend(_15,"_setSensorLon:",loc.coords.longitude);
if(_sensorLocationCallback){
objj_msgSend(_15,"_reverseGeocodeWithCallback:",function(){
currentLocation=_15;
_sensorLocationCallback(_15);
_sensorLocationCallback=nil;
});
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("sensorLocationDidGeocode:"),LocationDidGeocode,_15);
objj_msgSend(_15,"reverseGeocode");
}
},function(_16){
_nativeLocationHasFailed=YES;
objj_msgSend(_13,"locate");
});
}else{
if(NO&&google&&google.loader&&google.loader.ClientLocation){
var loc=google.loader.ClientLocation,_17=objj_msgSend(objj_msgSend(CPLocation,"alloc"),"init");
objj_msgSend(_17,"setLat:",loc.latitude);
objj_msgSend(_17,"setLon:",loc.longitude);
objj_msgSend(_17,"_setSensorLat:",loc.latitude);
objj_msgSend(_17,"_setSensorLon:",loc.longitude);
if(_sensorLocationCallback){
currentLocation=_17;
_sensorLocationCallback(_17);
_sensorLocationCallback=nil;
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("sensorLocationDidGeocode:"),LocationDidGeocode,_17);
objj_msgSend(_17,"reverseGeocode");
}
}else{
var _18=document.createElement("script");
_18.src="http://j.maxmind.com/app/geoip.js";
_18.type="text/javascript";
document.body.appendChild(_18);
var _19=window.setNativeInterval(function(){
if(geoip_region){
window.clearInterval(_19);
var _1a=objj_msgSend(objj_msgSend(CPLocation,"alloc"),"init");
objj_msgSend(_1a,"setCity:",geoip_city());
objj_msgSend(_1a,"setRegion:",geoip_region());
objj_msgSend(_1a,"setPostal:",geoip_postal_code());
objj_msgSend(_1a,"_setSensorLat:",geoip_latitude());
objj_msgSend(_1a,"_setSensorLon:",geoip_longitude());
geoip_region=nil;
document.body.removeChild(_18);
if(_sensorLocationCallback){
currentLocation=_1a;
_sensorLocationCallback(_1a);
_sensorLocationCallback=nil;
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("sensorLocationDidGeocode:"),LocationDidGeocode,_1a);
objj_msgSend(_1a,"geocode");
}
}
},100);
}
}
}
}),new objj_method(sel_getUid("_locateWithCallback:"),function(_1b,_1c,_1d){
with(_1b){
_sensorLocationCallback=_1d;
objj_msgSend(_1b,"locate");
}
}),new objj_method(sel_getUid("sensorLocationDidGeocode:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1e,LocationDidGeocode,objj_msgSend(_20,"object"));
objj_msgSend(_1e,"setCurrentLocation:",objj_msgSend(_20,"object"));
}
}),new objj_method(sel_getUid("setCurrentLocation:"),function(_21,_22,_23){
with(_21){
currentLocation=_23;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CurrentLocationDidChange,_21);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedController"),function(_24,_25){
with(_24){
if(!_1){
_1=objj_msgSend(objj_msgSend(objj_msgSend(_24,"class"),"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("loadMapsAPI"),function(_26,_27){
with(_26){
CPLocationControllerLoadMapsAPI();
}
})]);

@STATIC;1.0;I;21;Foundation/CPObject.jt;10406;
objj_executeFile("Foundation/CPObject.j",NO);
LocationDidGeocode="LocationDidGeocode";
Number.prototype.toRad=function(){
return this*PI/180;
};
Number.prototype.toDeg=function(){
return this*180/PI;
};
latLonDistance=function(_1,_2,_3,_4){
var r=6371,_5=(_3-_1).toRad(),_6=(_4-_2).toRad();
_1=(new Number(_1)).toRad();
_3=(new Number(_3)).toRad();
var _7=SIN(_5/2);
_7=_7*_7;
var _8=SIN(_6/2);
_8=_8*_8;
var _9=COS(_1)*COS(_3);
var a=_7+_9*_8,c=2*ATAN2(SQRT(a),SQRT(1-a));
return r*c;
};
var _a=objj_allocateClassPair(CPObject,"CPLocation"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("name"),new objj_ivar("lat"),new objj_ivar("lon"),new objj_ivar("_sensorLat"),new objj_ivar("_sensorLon"),new objj_ivar("street"),new objj_ivar("area"),new objj_ivar("city"),new objj_ivar("region"),new objj_ivar("country"),new objj_ivar("postal"),new objj_ivar("_geocoder"),new objj_ivar("_geocodeCallback")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("name"),function(_c,_d){
with(_c){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_e,_f,_10){
with(_e){
name=_10;
}
}),new objj_method(sel_getUid("lat"),function(_11,_12){
with(_11){
return lat;
}
}),new objj_method(sel_getUid("setLat:"),function(_13,_14,_15){
with(_13){
lat=_15;
}
}),new objj_method(sel_getUid("lon"),function(_16,_17){
with(_16){
return lon;
}
}),new objj_method(sel_getUid("setLon:"),function(_18,_19,_1a){
with(_18){
lon=_1a;
}
}),new objj_method(sel_getUid("_sensorLat"),function(_1b,_1c){
with(_1b){
return _sensorLat;
}
}),new objj_method(sel_getUid("_setSensorLat:"),function(_1d,_1e,_1f){
with(_1d){
_sensorLat=_1f;
}
}),new objj_method(sel_getUid("_sensorLon"),function(_20,_21){
with(_20){
return _sensorLon;
}
}),new objj_method(sel_getUid("_setSensorLon:"),function(_22,_23,_24){
with(_22){
_sensorLon=_24;
}
}),new objj_method(sel_getUid("street"),function(_25,_26){
with(_25){
return street;
}
}),new objj_method(sel_getUid("setStreet:"),function(_27,_28,_29){
with(_27){
street=_29;
}
}),new objj_method(sel_getUid("area"),function(_2a,_2b){
with(_2a){
return area;
}
}),new objj_method(sel_getUid("setArea:"),function(_2c,_2d,_2e){
with(_2c){
area=_2e;
}
}),new objj_method(sel_getUid("city"),function(_2f,_30){
with(_2f){
return city;
}
}),new objj_method(sel_getUid("setCity:"),function(_31,_32,_33){
with(_31){
city=_33;
}
}),new objj_method(sel_getUid("region"),function(_34,_35){
with(_34){
return region;
}
}),new objj_method(sel_getUid("setRegion:"),function(_36,_37,_38){
with(_36){
region=_38;
}
}),new objj_method(sel_getUid("country"),function(_39,_3a){
with(_39){
return country;
}
}),new objj_method(sel_getUid("setCountry:"),function(_3b,_3c,_3d){
with(_3b){
country=_3d;
}
}),new objj_method(sel_getUid("postal"),function(_3e,_3f){
with(_3e){
return postal;
}
}),new objj_method(sel_getUid("setPostal:"),function(_40,_41,_42){
with(_40){
postal=_42;
}
}),new objj_method(sel_getUid("initWithString:"),function(_43,_44,_45){
with(_43){
_43=objj_msgSend(_43,"init");
if(_43){
street=_45;
objj_msgSend(_43,"geocode");
street=nil;
}
return _43;
}
}),new objj_method(sel_getUid("description"),function(_46,_47){
with(_46){
var _48=[street||"",city||"",region||"",country||""];
objj_msgSend(_48,"removeObject:","");
return objj_msgSend(_48,"componentsJoinedByString:",", ");
}
}),new objj_method(sel_getUid("isEqual:"),function(_49,_4a,_4b){
with(_49){
return objj_msgSend(_49,"description")==objj_msgSend(_4b,"description");
}
}),new objj_method(sel_getUid("compareFromCurrentLocation:"),function(_4c,_4d,_4e){
with(_4c){
var lhs=_4c,rhs=_4e,_4f=objj_msgSend(objj_msgSend(CPLocationController,"sharedController"),"currentLocation");
var _50=objj_msgSend(lhs,"distance:",_4f),_51=objj_msgSend(rhs,"distance:",_4f);
if(_50>_51){
return CPOrderedDescending;
}else{
if(_50<_51){
return CPOrderedAscending;
}else{
return CPOrderedSame;
}
}
}
}),new objj_method(sel_getUid("distance:"),function(_52,_53,_54){
with(_52){
return latLonDistance(lat,lon,objj_msgSend(_54,"lat"),objj_msgSend(_54,"lon"));
}
}),new objj_method(sel_getUid("areaDescription"),function(_55,_56){
with(_55){
if(city&&region){
return city+", "+region;
}else{
if(region&&country){
return region+", "+country;
}
}
}
}),new objj_method(sel_getUid("distanceDescription"),function(_57,_58){
with(_57){
var _59=FLOOR(objj_msgSend(_57,"distance:",objj_msgSend(objj_msgSend(CPLocationController,"sharedController"),"currentLocation"))*(MeasurementUnits=="m"?0.621371192:1));
return _59==0?"Right here!":_59+(MeasurementUnits=="m"?(_59==1?" mile":" miles"):"km")+" away";
}
}),new objj_method(sel_getUid("coords"),function(_5a,_5b){
with(_5a){
return lat+","+lon;
}
}),new objj_method(sel_getUid("_sensorCoords"),function(_5c,_5d){
with(_5c){
return _sensorLat+","+_sensorLon;
}
}),new objj_method(sel_getUid("_gLatLng"),function(_5e,_5f){
with(_5e){
if(lat&&lon){
return new google.maps.LatLng(lat,lon);
}
}
}),new objj_method(sel_getUid("_setGLatLng:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_60,"setLat:",_62.lat());
objj_msgSend(_60,"setLon:",_62.lng());
}
}),new objj_method(sel_getUid("marker"),function(_63,_64){
with(_63){
var _65=objj_msgSend(objj_msgSend(CPMapMarker,"alloc"),"init");
objj_msgSend(_65,"setLocation:",_63);
return _65;
}
}),new objj_method(sel_getUid("geocode"),function(_66,_67){
with(_66){
if(!_geocoder){
_geocoder=new google.maps.Geocoder();
}
var _68=[];
if(street){
objj_msgSend(_68,"addObject:",street);
}
if(city){
objj_msgSend(_68,"addObject:",city);
}
if(region){
objj_msgSend(_68,"addObject:",region);
}
if(country){
objj_msgSend(_68,"addObject:",country);
}
if(postal){
objj_msgSend(_68,"addObject:",postal);
}
if(objj_msgSend(_68,"count")<1){
return objj_msgSend(CPException,"raise:reason:","NoAddress","Tried to geocode without address.");
}
_geocoder.geocode({"address":objj_msgSend(_68,"componentsJoinedByString:",", ")},function(_69,_6a){
objj_msgSend(_66,"_processGeocoderResponse:withStatus:",_69,_6a);
});
}
}),new objj_method(sel_getUid("reverseGeocode"),function(_6b,_6c){
with(_6b){
if(!_geocoder){
_geocoder=new google.maps.Geocoder();
}
var ll=objj_msgSend(_6b,"_gLatLng");
if(!ll){
return objj_msgSend(CPException,"raise:reason:","NoLatLon","Tried to reverse geocode without coordinates.");
}
_geocoder.geocode({"latLng":ll},function(_6d,_6e){
objj_msgSend(_6b,"_processGeocoderResponse:withStatus:",_6d,_6e);
});
}
}),new objj_method(sel_getUid("_reverseGeocodeWithCallback:"),function(_6f,_70,_71){
with(_6f){
_geocodeCallback=_71;
objj_msgSend(_6f,"reverseGeocode");
}
}),new objj_method(sel_getUid("_processGeocoderResponse:withStatus:"),function(_72,_73,_74,_75){
with(_72){
if(_75==google.maps.GeocoderStatus.OK){
var _76=objj_msgSend(_74,"count"),_77=[];
for(var i=0;i<_76;i++){
var _78=objj_msgSend(objj_msgSend(CPLocation,"alloc"),"init"),_79=_74[i];
objj_msgSend(_78,"setLat:",_79.geometry.location.lat());
objj_msgSend(_78,"setLon:",_79.geometry.location.lng());
var _7a={};
for(var j=0,_7b=_79.address_components.length;j<_7b;j++){
var _7c=_79.address_components[j],_7d=_7c.types[0];
if(_7d=="street_number"){
_7a.street=_7c.short_name;
}else{
if(_7d=="route"){
_7a.route=_7c.short_name;
}else{
if(_7d=="locality"){
_7a.locale=_7c.long_name;
}else{
if(_7d=="administrative_area_level_1"){
_7a.region=_7c.short_name;
}else{
if(_7d=="administrative_area_level_3"){
_7a.city=_7c.long_name;
}else{
if(_7d=="postal_code"){
_7a.postal=_7c.long_name;
}else{
if(_7d=="country"){
_7a.country=_7c.long_name;
}
}
}
}
}
}
}
}
if(_7a.route){
objj_msgSend(_78,"setStreet:",(_7a.street?(_7a.street+" "):"")+_7a.route);
}
if(_7a.region){
objj_msgSend(_78,"setRegion:",_7a.region);
}
if(_7a.country){
objj_msgSend(_78,"setCountry:",_7a.country);
}
if(_7a.postal){
objj_msgSend(_78,"setPostal:",_7a.postal);
}
if(_7a.country=="United States"){
if(_7a.city){
objj_msgSend(_78,"setCity:",_7a.city);
}else{
if(_7a.locale){
objj_msgSend(_78,"setCity:",_7a.locale);
}
}
if(_7a.locale){
objj_msgSend(_78,"setArea:",_7a.locale);
}
}else{
if(_7a.locale){
objj_msgSend(_78,"setCity:",_7a.locale);
}
if(_7a.city){
objj_msgSend(_78,"setArea:",_7a.city);
}
}
objj_msgSend(_77,"addObject:",_78);
}
var _7e=_77[0];
lat=objj_msgSend(_7e,"lat")||lat;
lon=objj_msgSend(_7e,"lon")||lon;
street=objj_msgSend(_7e,"street")||street;
area=objj_msgSend(_7e,"area")||area;
city=objj_msgSend(_7e,"city")||city;
region=objj_msgSend(_7e,"region")||region;
country=objj_msgSend(_7e,"country")||country;
postal=objj_msgSend(_7e,"postal")||postal;
if(_geocodeCallback){
_geocodeCallback();
_geocodeCallback=nil;
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",LocationDidGeocode,_72,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_77,"ResultsList"));
}
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",LocationDidGeocode,_72);
}
}
})]);
var _a=objj_getClass("CPLocation");
if(!_a){
throw new SyntaxError("*** Could not find definition for class \"CPLocation\"");
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(_7f,_80,_81){
with(_7f){
_7f=objj_msgSend(_7f,"init");
if(_7f){
lat=objj_msgSend(_81,"decodeFloatForKey:","lat");
lon=objj_msgSend(_81,"decodeFloatForKey:","lon");
_sensorLat=objj_msgSend(_81,"decodeFloatForKey:","sensorLat");
_sensorLon=objj_msgSend(_81,"decodeFloatForKey:","sensorLon");
street=objj_msgSend(_81,"decodeObjectForKey:","street");
area=objj_msgSend(_81,"decodeObjectForKey:","area");
city=objj_msgSend(_81,"decodeObjectForKey:","city");
region=objj_msgSend(_81,"decodeObjectForKey:","region");
country=objj_msgSend(_81,"decodeObjectForKey:","country");
postal=objj_msgSend(_81,"decodeObjectForKey:","postal");
}
return _7f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_84,"encodeFloat:forKey:",lat,"lat");
objj_msgSend(_84,"encodeFloat:forKey:",lon,"lon");
objj_msgSend(_84,"encodeFloat:forKey:",_sensorLat,"sensorLat");
objj_msgSend(_84,"encodeFloat:forKey:",_sensorLon,"sensorLon");
objj_msgSend(_84,"encodeObject:forKey:",street,"street");
objj_msgSend(_84,"encodeObject:forKey:",area,"area");
objj_msgSend(_84,"encodeObject:forKey:",city,"city");
objj_msgSend(_84,"encodeObject:forKey:",region,"region");
objj_msgSend(_84,"encodeObject:forKey:",country,"country");
objj_msgSend(_84,"encodeObject:forKey:",postal,"postal");
}
})]);

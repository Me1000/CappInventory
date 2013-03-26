@STATIC;1.0;t;1982;
MKLocationStringRegEx=/\s*<(\-?\d*\.?\d*),\s*(\-?\d*\.?\d*)>\s*$/;
var _1=objj_allocateClassPair(CPObject,"MKLocation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_latitude"),new objj_ivar("_longitude")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("latitude"),function(_3,_4){
with(_3){
return _latitude;
}
}),new objj_method(sel_getUid("setLatitude:"),function(_5,_6,_7){
with(_5){
_latitude=_7;
}
}),new objj_method(sel_getUid("longitude"),function(_8,_9){
with(_8){
return _longitude;
}
}),new objj_method(sel_getUid("setLongitude:"),function(_a,_b,_c){
with(_a){
_longitude=_c;
}
}),new objj_method(sel_getUid("initWithLatLng:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(_d,"initWithLatitude:andLongitude:",_f.lat(),_f.lng());
}
}),new objj_method(sel_getUid("initWithLatitude:andLongitude:"),function(_10,_11,_12,_13){
with(_10){
if(_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("MKLocation").super_class},"init")){
_latitude=_12;
_longitude=_13;
}
return _10;
}
}),new objj_method(sel_getUid("googleLatLng"),function(_14,_15){
with(_14){
var gm=objj_msgSend(MKMapView,"gmNamespace");
return new gm.LatLng(_latitude,_longitude);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_18,"encodeObject:forKey:",[_latitude,_longitude],"location");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("location"),function(_19,_1a){
with(_19){
return objj_msgSend(objj_msgSend(MKLocation,"alloc"),"init");
}
}),new objj_method(sel_getUid("locationWithLatitude:andLongitude:"),function(_1b,_1c,_1d,_1e){
with(_1b){
return objj_msgSend(objj_msgSend(MKLocation,"alloc"),"initWithLatitude:andLongitude:",_1d,_1e);
}
}),new objj_method(sel_getUid("locationFromString:"),function(_1f,_20,_21){
with(_1f){
var res=MKLocationStringRegEx.exec(_21);
if(res&&res.length===3){
return objj_msgSend(MKLocation,"locationWithLatitude:andLongitude:",res[1],res[2]);
}
return nil;
}
})]);

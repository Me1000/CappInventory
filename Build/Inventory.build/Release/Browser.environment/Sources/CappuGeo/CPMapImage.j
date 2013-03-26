@STATIC;1.0;I;20;AppKit/CPImageView.jt;2872;
objj_executeFile("AppKit/CPImageView.j",NO);
var _1=objj_allocateClassPair(CPImageView,"CPMapImage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("location"),new objj_ivar("mapStyle"),new objj_ivar("markerColor"),new objj_ivar("markerLabel"),new objj_ivar("markerSize")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("location"),function(_3,_4){
with(_3){
return location;
}
}),new objj_method(sel_getUid("setLocation:"),function(_5,_6,_7){
with(_5){
location=_7;
}
}),new objj_method(sel_getUid("mapStyle"),function(_8,_9){
with(_8){
return mapStyle;
}
}),new objj_method(sel_getUid("setMapStyle:"),function(_a,_b,_c){
with(_a){
mapStyle=_c;
}
}),new objj_method(sel_getUid("markerColor"),function(_d,_e){
with(_d){
return markerColor;
}
}),new objj_method(sel_getUid("setMarkerColor:"),function(_f,_10,_11){
with(_f){
markerColor=_11;
}
}),new objj_method(sel_getUid("markerLabel"),function(_12,_13){
with(_12){
return markerLabel;
}
}),new objj_method(sel_getUid("setMarkerLabel:"),function(_14,_15,_16){
with(_14){
markerLabel=_16;
}
}),new objj_method(sel_getUid("markerSize"),function(_17,_18){
with(_17){
return markerSize;
}
}),new objj_method(sel_getUid("setMarkerSize:"),function(_19,_1a,_1b){
with(_19){
markerSize=_1b;
}
}),new objj_method(sel_getUid("setLocation:"),function(_1c,_1d,_1e){
with(_1c){
if(location==_1e){
return;
}
location=_1e;
if(location){
var _1f=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(_1c,"staticMapURL"),"absoluteString"),objj_msgSend(_1c,"bounds").size);
objj_msgSend(_1c,"setImage:",_1f);
}else{
objj_msgSend(_1c,"setImage:",nil);
}
}
}),new objj_method(sel_getUid("staticMapURL"),function(_20,_21){
with(_20){
if(!location){
return;
}
var url=["http://maps.google.com/maps/api/staticmap?key=",GMAPS_KEY,"&sensor=true"];
objj_msgSend(url,"addObject:","&maptype=");
if(mapStyle==CPMapTypeSatellite){
objj_msgSend(url,"addObject:","satellite");
}else{
if(mapStyle==CPMapTypeTerrain){
objj_msgSend(url,"addObject:","terrain");
}else{
if(mapStyle==CPMapTypeHybrid){
objj_msgSend(url,"addObject:","hybrid");
}else{
objj_msgSend(url,"addObject:","roadmap");
}
}
}
objj_msgSend(url,"addObject:","&zoom=12");
objj_msgSend(url,"addObjectsFromArray:",["&size=",CGRectGetWidth(objj_msgSend(_20,"bounds")),"x",CGRectGetHeight(objj_msgSend(_20,"bounds"))]);
objj_msgSend(url,"addObject:","&markers=");
if(markerColor){
objj_msgSend(url,"addObjectsFromArray:",["color:0x",objj_msgSend(markerColor,"hexString"),"|"]);
}
if(markerLabel){
objj_msgSend(url,"addObjectsFromArray:",["label:",markerLabel,"|"]);
}
if(markerSize){
objj_msgSend(url,"addObjectsFromArray:",["size:",markerSize,"|"]);
}
objj_msgSend(url,"addObject:",objj_msgSend(location,"coords"));
return objj_msgSend(CPURL,"URLWithString:",objj_msgSend(url,"componentsJoinedByString:",""));
}
})]);

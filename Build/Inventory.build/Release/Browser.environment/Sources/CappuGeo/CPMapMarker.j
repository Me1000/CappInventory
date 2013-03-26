@STATIC;1.0;I;21;Foundation/CPObject.jt;4434;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPMapMarker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_marker"),new objj_ivar("location"),new objj_ivar("mapView"),new objj_ivar("title"),new objj_ivar("image"),new objj_ivar("draggable"),new objj_ivar("target"),new objj_ivar("action"),new objj_ivar("mouseOverAction"),new objj_ivar("mouseOutAction"),new objj_ivar("dragAction"),new objj_ivar("tag")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("location"),function(_3,_4){
with(_3){
return location;
}
}),new objj_method(sel_getUid("setLocation:"),function(_5,_6,_7){
with(_5){
location=_7;
}
}),new objj_method(sel_getUid("mapView"),function(_8,_9){
with(_8){
return mapView;
}
}),new objj_method(sel_getUid("setMapView:"),function(_a,_b,_c){
with(_a){
mapView=_c;
}
}),new objj_method(sel_getUid("title"),function(_d,_e){
with(_d){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_f,_10,_11){
with(_f){
title=_11;
}
}),new objj_method(sel_getUid("image"),function(_12,_13){
with(_12){
return image;
}
}),new objj_method(sel_getUid("setImage:"),function(_14,_15,_16){
with(_14){
image=_16;
}
}),new objj_method(sel_getUid("draggable"),function(_17,_18){
with(_17){
return draggable;
}
}),new objj_method(sel_getUid("setDraggable:"),function(_19,_1a,_1b){
with(_19){
draggable=_1b;
}
}),new objj_method(sel_getUid("target"),function(_1c,_1d){
with(_1c){
return target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_1e,_1f,_20){
with(_1e){
target=_20;
}
}),new objj_method(sel_getUid("action"),function(_21,_22){
with(_21){
return action;
}
}),new objj_method(sel_getUid("setAction:"),function(_23,_24,_25){
with(_23){
action=_25;
}
}),new objj_method(sel_getUid("mouseOverAction"),function(_26,_27){
with(_26){
return mouseOverAction;
}
}),new objj_method(sel_getUid("setMouseOverAction:"),function(_28,_29,_2a){
with(_28){
mouseOverAction=_2a;
}
}),new objj_method(sel_getUid("mouseOutAction"),function(_2b,_2c){
with(_2b){
return mouseOutAction;
}
}),new objj_method(sel_getUid("setMouseOutAction:"),function(_2d,_2e,_2f){
with(_2d){
mouseOutAction=_2f;
}
}),new objj_method(sel_getUid("dragAction"),function(_30,_31){
with(_30){
return dragAction;
}
}),new objj_method(sel_getUid("setDragAction:"),function(_32,_33,_34){
with(_32){
dragAction=_34;
}
}),new objj_method(sel_getUid("tag"),function(_35,_36){
with(_35){
return tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_37,_38,_39){
with(_37){
tag=_39;
}
}),new objj_method(sel_getUid("init"),function(_3a,_3b){
with(_3a){
_3a=objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("CPMapMarker").super_class},"init");
if(_3a){
_marker=new google.maps.Marker({});
google.maps.event.addListener(_marker,"click",function(){
if(action){
objj_msgSend(target,action,_3a);
}
});
google.maps.event.addListener(_marker,"mouseover",function(){
if(mouseOverAction){
objj_msgSend(target,mouseOverAction,_3a);
}
});
google.maps.event.addListener(_marker,"mouseout",function(){
if(mouseOutAction){
objj_msgSend(target,mouseOutAction,_3a);
}
});
google.maps.event.addListener(_marker,"dragend",function(){
if(draggable&&dragAction){
objj_msgSend(target,dragAction,_3a);
}
});
}
return _3a;
}
}),new objj_method(sel_getUid("setLocation:"),function(_3c,_3d,_3e){
with(_3c){
location=_3e;
var ll=objj_msgSend(_3e,"_gLatLng");
if(ll){
_marker.setPosition(ll);
}
var _3f=objj_msgSend(_3e,"description");
if(_3f){
objj_msgSend(_3c,"setTitle:",_3f);
}
}
}),new objj_method(sel_getUid("setMapView:"),function(_40,_41,_42){
with(_40){
mapView=_42;
if(mapView&&mapView._map){
_marker.setMap(mapView._map);
}else{
_marker.setMap(nil);
}
}
}),new objj_method(sel_getUid("setTitle:"),function(_43,_44,_45){
with(_43){
title=_45;
_marker.setTitle(title);
}
}),new objj_method(sel_getUid("setImage:"),function(_46,_47,_48){
with(_46){
image=_48;
_marker.setIcon(objj_msgSend(image,"filename"));
}
}),new objj_method(sel_getUid("setDraggable:"),function(_49,_4a,_4b){
with(_49){
draggable=_4b;
_marker.setDraggable(draggable);
}
}),new objj_method(sel_getUid("_gLatLng"),function(_4c,_4d){
with(_4c){
return objj_msgSend(_4c,"_position");
}
}),new objj_method(sel_getUid("_position"),function(_4e,_4f){
with(_4e){
return _marker.getPosition();
}
}),new objj_method(sel_getUid("frameOrigin"),function(_50,_51){
with(_50){
return objj_msgSend(mapView,"pointFromLocation:",location);
}
})]);

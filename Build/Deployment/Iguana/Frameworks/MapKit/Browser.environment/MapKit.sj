@STATIC;1.0;p;8;MapKit.jt;175;@STATIC;1.0;i;12;MKGeometry.ji;11;MKMapView.ji;9;MKTypes.jt;111;
objj_executeFile("MKGeometry.j",YES);
objj_executeFile("MKMapView.j",YES);
objj_executeFile("MKTypes.j",YES);
p;11;MKMapView.jt;11818;@STATIC;1.0;I;15;AppKit/CPView.ji;12;MKGeometry.ji;9;MKTypes.jt;11748;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MKGeometry.j",YES);
objj_executeFile("MKTypes.j",YES);
var _1=objj_allocateClassPair(CPView,"MKMapView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("m_centerCoordinate"),new objj_ivar("m_zoomLevel"),new objj_ivar("m_mapType"),new objj_ivar("m_scrollWheelZoomEnabled"),new objj_ivar("m_previousTrackingLocation"),new objj_ivar("m_DOMMapElement"),new objj_ivar("m_DOMGuardElement"),new objj_ivar("m_map"),new objj_ivar("queue")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithFrame:centerCoordinate:",_5,nil);
}
}),new objj_method(sel_getUid("initWithFrame:centerCoordinate:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("MKMapView").super_class},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",229/255,227/255,223/255,1));
objj_msgSend(_6,"setCenterCoordinate:",_9||new CLLocationCoordinate2D(52,-1));
objj_msgSend(_6,"setZoomLevel:",6);
objj_msgSend(_6,"setMapType:",MKMapTypeStandard);
objj_msgSend(_6,"setScrollWheelZoomEnabled:",YES);
queue=[];
objj_msgSend(_6,"_buildDOM");
}
return _6;
}
}),new objj_method(sel_getUid("dequeue"),function(_a,_b){
with(_a){
if(!objj_msgSend(queue,"count")){
return;
}
for(var i=0;i<objj_msgSend(queue,"count");i++){
var _c=queue[i];
objj_msgSend(_a,objj_msgSend(_c,"valueForKey:","selector"),objj_msgSend(_c,"valueForKey:","argument"));
objj_msgSend(queue,"removeObjectAtIndex:",i);
}
}
}),new objj_method(sel_getUid("_buildDOM"),function(_d,_e){
with(_d){
_f(function(){
m_DOMMapElement=document.createElement("div");
m_DOMMapElement.id="MKMapView"+objj_msgSend(_d,"UID");
var _10=m_DOMMapElement.style,_11=objj_msgSend(_d,"bounds"),_12=CGRectGetWidth(_11),_13=CGRectGetHeight(_11);
_10.overflow="hidden";
_10.position="absolute";
_10.visibility="visible";
_10.zIndex=0;
_10.left=-_12+"px";
_10.top=-_13+"px";
_10.width=_12+"px";
_10.height=_13+"px";
document.body.appendChild(m_DOMMapElement);
m_map=new google.maps.Map2(m_DOMMapElement,{size:new GSize(_12,_13)});
m_map.setCenter(LatLngFromCLLocationCoordinate2D(m_centerCoordinate));
m_map.setZoom(m_zoomLevel);
m_map.enableContinuousZoom();
m_map.setMapType(objj_msgSend(objj_msgSend(_d,"class"),"_mapTypeObjectForMapType:",m_mapType));
m_map.checkResize();
_10.left="0px";
_10.top="0px";
document.body.removeChild(m_DOMMapElement);
_DOMElement.appendChild(m_DOMMapElement);
m_DOMGuardElement=document.createElement("div");
var _10=m_DOMGuardElement.style;
_10.overflow="hidden";
_10.position="absolute";
_10.visibility="visible";
_10.zIndex=0;
_10.left="0px";
_10.top="0px";
_10.width="100%";
_10.height="100%";
_DOMElement.appendChild(m_DOMGuardElement);
objj_msgSend(_d,"dequeue");
var _14=function(){
var _15=CLLocationCoordinate2DFromLatLng(m_map.getCenter()),_16=objj_msgSend(_d,"centerCoordinate");
if(!CLLocationCoordinate2DEqualToCLLocationCoordinate2D(_16,_15)){
objj_msgSend(_d,"setCenterCoordinate:",_15);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
};
var _17=function(){
var _18=m_map.getZoom(),_19=objj_msgSend(_d,"zoomLevel");
if(_18!==_19){
objj_msgSend(_d,"setZoomLevel:",_18);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
};
google.maps.Event.addListener(m_map,"moveend",_14);
google.maps.Event.addListener(m_map,"resize",_14);
google.maps.Event.addListener(m_map,"zoomend",_17);
});
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("MKMapView").super_class},"setFrameSize:",_1c);
if(m_DOMMapElement){
var _1d=objj_msgSend(_1a,"bounds"),_1e=m_DOMMapElement.style;
_1e.width=CGRectGetWidth(_1d)+"px";
_1e.height=CGRectGetHeight(_1d)+"px";
m_map.checkResize();
}
}
}),new objj_method(sel_getUid("region"),function(_1f,_20){
with(_1f){
if(m_map){
return MKCoordinateRegionFromLatLngBounds(m_map.getBounds());
}
return nil;
}
}),new objj_method(sel_getUid("setRegion:"),function(_21,_22,_23){
with(_21){
m_region=_23;
if(m_map){
objj_msgSend(_21,"setZoomLevel:",m_map.getBoundsZoomLevel(LatLngBoundsFromMKCoordinateRegion(_23)));
objj_msgSend(_21,"setCenterCoordinate:",_23.center);
}
}
}),new objj_method(sel_getUid("setCenterCoordinate:"),function(_24,_25,_26){
with(_24){
if(m_centerCoordinate&&CLLocationCoordinate2DEqualToCLLocationCoordinate2D(m_centerCoordinate,_26)){
return;
}
m_centerCoordinate=new CLLocationCoordinate2D(_26);
if(m_map){
m_map.setCenter(LatLngFromCLLocationCoordinate2D(_26));
}
}
}),new objj_method(sel_getUid("centerCoordinate"),function(_27,_28){
with(_27){
return new CLLocationCoordinate2D(m_centerCoordinate);
}
}),new objj_method(sel_getUid("setCenterCoordinateLatitude:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"setCenterCoordinate:",new CLLocationCoordinate2D(_2b,objj_msgSend(_29,"centerCoordinateLongitude")));
}
}),new objj_method(sel_getUid("centerCoordinateLatitude"),function(_2c,_2d){
with(_2c){
return objj_msgSend(_2c,"centerCoordinate").latitude;
}
}),new objj_method(sel_getUid("setCenterCoordinateLongitude:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_2e,"setCenterCoordinate:",new CLLocationCoordinate2D(objj_msgSend(_2e,"centerCoordinateLatitude"),_30));
}
}),new objj_method(sel_getUid("centerCoordinateLongitude"),function(_31,_32){
with(_31){
return objj_msgSend(_31,"centerCoordinate").longitude;
}
}),new objj_method(sel_getUid("setZoomLevel:"),function(_33,_34,_35){
with(_33){
m_zoomLevel=+_35||0;
if(m_map){
m_map.setZoom(m_zoomLevel);
}
}
}),new objj_method(sel_getUid("zoomLevel"),function(_36,_37){
with(_36){
return m_zoomLevel;
}
}),new objj_method(sel_getUid("setMapType:"),function(_38,_39,_3a){
with(_38){
m_mapType=_3a;
if(m_map){
m_map.setMapType(objj_msgSend(objj_msgSend(_38,"class"),"_mapTypeObjectForMapType:",m_mapType));
}
}
}),new objj_method(sel_getUid("mapType"),function(_3b,_3c){
with(_3b){
return m_mapType;
}
}),new objj_method(sel_getUid("setScrollWheelZoomEnabled:"),function(_3d,_3e,_3f){
with(_3d){
m_scrollWheelZoomEnabled=_3f;
if(m_map){
m_map.setScrollWheelZoomEnabled(m_scrollWheelZoomEnabled);
}
}
}),new objj_method(sel_getUid("scrollWheelZoomEnabled"),function(_40,_41){
with(_40){
return m_scrollWheelZoomEnabled;
}
}),new objj_method(sel_getUid("takeStringAddressFrom:"),function(_42,_43,_44){
with(_42){
try{
var _45=new google.maps.ClientGeocoder();
_45.getLatLng(objj_msgSend(_44,"stringValue"),function(_46){
if(!_46){
return;
}
objj_msgSend(_42,"setCenterCoordinate:",CLLocationCoordinate2DFromLatLng(_46));
objj_msgSend(_42,"setZoomLevel:",7);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
});
}
catch(err){
var _47=objj_msgSend(CPDictionary,"new");
objj_msgSend(_47,"setValue:forKey:",_44,"argument");
objj_msgSend(_47,"setValue:forKey:",sel_getUid("takeStringAddressFrom:"),"selector");
objj_msgSend(queue,"addObject:",_47);
window.setTimeout(function(){
objj_msgSend(_42,"dequeue");
},500);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_48,_49,_4a){
with(_48){
if(objj_msgSend(_4a,"clickCount")===2){
m_map.zoomIn(LatLngFromCLLocationCoordinate2D(objj_msgSend(_48,"convertPoint:toCoordinateFromView:",objj_msgSend(_4a,"locationInWindow"),nil)),YES,YES);
return;
}
objj_msgSend(_48,"trackPan:",_4a);
objj_msgSendSuper({receiver:_48,super_class:objj_getClass("MKMapView").super_class},"mouseDown:",_4a);
}
}),new objj_method(sel_getUid("trackPan:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_4d,"type"),_4f=objj_msgSend(_4b,"convertPoint:fromView:",objj_msgSend(_4d,"locationInWindow"),nil);
if(_4e===CPLeftMouseUp){
}else{
if(_4e===CPLeftMouseDown){
}else{
if(_4e===CPLeftMouseDragged){
var _50=objj_msgSend(_4b,"centerCoordinate"),_51=objj_msgSend(_4b,"convertPoint:toCoordinateFromView:",m_previousTrackingLocation,_4b),_52=objj_msgSend(_4b,"convertPoint:toCoordinateFromView:",_4f,_4b),_53=new CLLocationCoordinate2D(_52.latitude-_51.latitude,_52.longitude-_51.longitude);
_50.latitude-=_53.latitude;
_50.longitude-=_53.longitude;
objj_msgSend(_4b,"setCenterCoordinate:",_50);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_4b,sel_getUid("trackPan:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
m_previousTrackingLocation=_4f;
}
}),new objj_method(sel_getUid("convertCoordinate:toPointToView:"),function(_54,_55,_56,_57){
with(_54){
if(!m_map){
return CGPointMakeZero();
}
var _58=m_map.fromLatLngToContainerPixel(LatLngFromCLLocationCoordinate2D(_56));
return objj_msgSend(_54,"convertPoint:toView:",CGPointMake(_58.x,_58.y),_57);
}
}),new objj_method(sel_getUid("convertPoint:toCoordinateFromView:"),function(_59,_5a,_5b,_5c){
with(_59){
if(!m_map){
return new CLLocationCoordinate2D();
}
var _5d=objj_msgSend(_59,"convertPoint:fromView:",_5b,_5c),_5e=m_map.fromContainerPixelToLatLng(new google.maps.Point(_5d.x,_5d.y));
return CLLocationCoordinate2DFromLatLng(_5e);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingCenterCoordinateLatitude"),function(_5f,_60){
with(_5f){
return objj_msgSend(CPSet,"setWithObjects:","centerCoordinate");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCenterCoordinateLongitude"),function(_61,_62){
with(_61){
return objj_msgSend(CPSet,"setWithObjects:","centerCoordinate");
}
}),new objj_method(sel_getUid("_mapTypeObjectForMapType:"),function(_63,_64,_65){
with(_63){
return [G_NORMAL_MAP,G_HYBRID_MAP,G_SATELLITE_MAP,G_PHYSICAL_MAP][_65];
}
})]);
var _66=[];
var _f=function(_67){
_66.push(_67);
_f=function(){
_66.push(_67);
};
if(window.google&&google.maps&&google.maps.Map2){
_MKMapViewMapsLoaded();
}else{
var _68=document.createElement("script");
_68.src="http://www.google.com/jsapi?callback=_MKMapViewGoogleAjaxLoaderLoaded";
_68.type="text/javascript";
document.getElementsByTagName("head")[0].appendChild(_68);
}
};
_MKMapViewGoogleAjaxLoaderLoaded=function(){
google.load("maps","2",{"callback":_MKMapViewMapsLoaded});
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_MKMapViewMapsLoaded=function(){
_f=function(_69){
_69();
};
var _6a=0,_6b=_66.length;
for(;_6a<_6b;++_6a){
_66[_6a]();
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
var _6c="MKMapViewCenterCoordinateKey",_6d="MKMapViewZoomLevelKey",_6e="MKMapViewMapTypeKey";
var _1=objj_getClass("MKMapView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MKMapView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6f,_70,_71){
with(_6f){
_6f=objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("MKMapView").super_class},"initWithCoder:",_71);
if(_6f){
objj_msgSend(_6f,"setCenterCoordinate:",CLLocationCoordinate2DFromString(objj_msgSend(_71,"decodeObjectForKey:",_6c)));
objj_msgSend(_6f,"setZoomLevel:",objj_msgSend(_71,"decodeObjectForKey:",_6d));
objj_msgSend(_6f,"setMapType:",objj_msgSend(_71,"decodeObjectForKey:",_6e));
objj_msgSend(_6f,"_buildDOM");
}
return _6f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_72,_73,_74){
with(_72){
objj_msgSendSuper({receiver:_72,super_class:objj_getClass("MKMapView").super_class},"encodeWithCoder:",_74);
objj_msgSend(_74,"encodeObject:forKey:",CPStringFromCLLocationCoordinate2D(objj_msgSend(_72,"centerCoordinate")),_6c);
objj_msgSend(_74,"encodeObject:forKey:",objj_msgSend(_72,"zoomLevel"),_6d);
objj_msgSend(_74,"encodeObject:forKey:",objj_msgSend(_72,"mapType"),_6e);
}
})]);
p;12;MKGeometry.jt;2257;@STATIC;1.0;t;2238;
MKCoordinateSpan=function(_1,_2){
this.latitudeDelta=_1;
this.longitudeDelta=_2;
return this;
};
MKCoordinateSpan.prototype.toString=function(){
return "{"+this.latitudeDelta+", "+this.longitudeDelta+"}";
};
MKCoordinateSpanMake=function(_3,_4){
return new MKCoordinateSpan(_3,_4);
};
MKCoordinateSpanFromLatLng=function(_5){
return new MKCoordinateSpan(_5.lat(),_5.lng());
};
CLLocationCoordinate2D=function(_6,_7){
if(arguments.length===1){
var _8=arguments[0];
this.latitude=_8.latitude;
this.longitude=_8.longitude;
}else{
this.latitude=+_6||0;
this.longitude=+_7||0;
}
return this;
};
CPStringFromCLLocationCoordinate2D=function(_9){
return "{"+_9.latitude+", "+_9.longitude+"}";
};
CLLocationCoordinate2DFromString=function(_a){
var _b=_a.indexOf(",");
return new CLLocationCoordinate2D(parseFloat(_a.substr(1,_b-1)),parseFloat(_a.substring(_b+1,_a.length)));
};
CLLocationCoordinate2D.prototype.toString=function(){
return CPStringFromCLLocationCoordinate2D(this);
};
CLLocationCoordinate2DEqualToCLLocationCoordinate2D=function(_c,_d){
return _c===_d||_c.latitude===_d.latitude&&_c.longitude===_d.longitude;
};
CLLocationCoordinate2DMake=function(_e,_f){
return new CLLocationCoordinate2D(_e,_f);
};
CLLocationCoordinate2DFromLatLng=function(_10){
return new CLLocationCoordinate2D(_10.lat(),_10.lng());
};
LatLngFromCLLocationCoordinate2D=function(_11){
return new google.maps.LatLng(_11.latitude,_11.longitude);
};
MKCoordinateRegion=function(_12,_13){
this.center=_12;
this.span=_13;
return this;
};
MKCoordinateRegion.prototype.toString=function(){
return "{"+this.center.latitude+", "+this.center.longitude+", "+this.span.latitudeDelta+", "+this.span.longitudeDelta+"}";
};
MKCoordinateRegionMake=function(_14,_15){
return new MKCoordinateRegion(_14,_15);
};
MKCoordinateRegionFromLatLngBounds=function(_16){
return new MKCoordinateRegion(CLLocationCoordinate2DFromLatLng(_16.getCenter()),MKCoordinateSpanFromLatLng(_16.toSpan()));
};
LatLngBoundsFromMKCoordinateRegion=function(_17){
var _18=_17.center.latitude,_19=_17.center.longitude,_1a=_17.span.latitudeDelta,_1b=_17.span.longitudeDelta,_1c=google.maps.LatLng,_1d=google.maps.LatLngBounds;
return new _1d(new _1c(_18-_1a/2,_19-_1b/2),new _1c(_18+_1a/2,_19+_1b/2));
};
p;9;MKTypes.jt;100;@STATIC;1.0;t;83;
MKMapTypeStandard=0;
MKMapTypeHybrid=1;
MKMapTypeSatellite=2;
MKMapTypeTerrain=3;

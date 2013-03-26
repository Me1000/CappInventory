@STATIC;1.0;t;7662;
var _1=objj_allocateClassPair(CPView,"RLMapView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("mapView"),new objj_ivar("editView"),new objj_ivar("addressField"),new objj_ivar("mapTypeMenu"),new objj_ivar("changeButton"),new objj_ivar("bigCurl"),new objj_ivar("isEditing")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("RLMapView").super_class},"initWithFrame:",_5);
if(_3){
isEditing=NO;
var _6=objj_msgSend(CPBundle,"mainBundle"),_7=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6,"pathForResource:","content-background.png"),CGSizeMake(159,159));
editView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,_5.size.width,_5.size.height));
objj_msgSend(editView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(editView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_7));
_3._DOMElement.style.border="1px solid #bbb";
addressField=objj_msgSend(LocationEditView,"customMultiLineTextField");
objj_msgSend(addressField,"setDelegate:",_3);
objj_msgSend(addressField,"setFrame:",CGRectMake(15,15,_5.size.width-30,60));
objj_msgSend(addressField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(addressField,"setPlaceholderString:","Location Address");
objj_msgSend(addressField,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(addressField,"setTarget:",_3);
objj_msgSend(addressField,"setAction:",sel_getUid("updateAddress:"));
objj_msgSend(editView,"addSubview:",addressField);
var _8=objj_msgSend(CPTextField,"new");
objj_msgSend(_8,"setFrameOrigin:",CGPointMake(15,90));
objj_msgSend(_8,"setStringValue:","Map Type:");
objj_msgSend(_8,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_8,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",79/255,0.8),"text-color");
objj_msgSend(_8,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",240/255,1),"text-shadow-color");
objj_msgSend(_8,"setValue:forThemeAttribute:inState:",CGSizeMake(0,1),"text-shadow-offset",CPThemeStateBordered);
objj_msgSend(_8,"sizeToFit");
objj_msgSend(editView,"addSubview:",_8);
mapTypeMenu=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(15,110,_5.size.width-30,24));
objj_msgSend(mapTypeMenu,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(mapTypeMenu,"addItemsWithTitles:",["Standard","Hybrid","Satellite","Terrain"]);
objj_msgSend(mapTypeMenu,"setTarget:",_3);
objj_msgSend(mapTypeMenu,"setAction:",sel_getUid("setMapType:"));
objj_msgSend(editView,"addSubview:",mapTypeMenu);
var _9=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_5.size.width-115,_5.size.height-39,100,24));
objj_msgSend(_9,"setTitle:","Done");
objj_msgSend(_9,"setDefaultButton:",YES);
objj_msgSend(_9,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_9,"setTarget:",_3);
objj_msgSend(_9,"setAction:",sel_getUid("hideEditView:"));
objj_msgSend(editView,"addSubview:",_9);
mapView=objj_msgSend(objj_msgSend(MKMapView,"alloc"),"initWithFrame:",CGRectMake(0,0,_5.size.width,_5.size.height));
objj_msgSend(mapView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(mapView,"setDoubleTarget:",_3);
objj_msgSend(mapView,"setDoubleAction:",sel_getUid("showEditView:"));
objj_msgSend(_3,"addSubview:",mapView);
changeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_5.size.width-45,_5.size.height-40,45,40));
objj_msgSend(changeButton,"setBordered:",NO);
objj_msgSend(changeButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_6,"pathForResource:","RLMapViewCorner.png"),CGSizeMake(45,40)));
objj_msgSend(changeButton,"setImagePosition:",CPImageOnly);
objj_msgSend(changeButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin);
objj_msgSend(changeButton,"setTarget:",_3);
objj_msgSend(changeButton,"setAction:",sel_getUid("showEditView:"));
objj_msgSend(_3,"addSubview:",changeButton);
}
return _3;
}
}),new objj_method(sel_getUid("mapViewDidLoad:"),function(_a,_b,_c){
with(_a){
console.log("bam");
}
}),new objj_method(sel_getUid("mapViewWillLoad:"),function(_d,_e,_f){
with(_d){
console.log("load");
}
}),new objj_method(sel_getUid("updateAddress:"),function(_10,_11,_12){
with(_10){
}
}),new objj_method(sel_getUid("showEditView:"),function(_13,_14,_15){
with(_13){
isEditing=YES;
var _16={modalView:editView};
objj_msgSend(_13,"addSubview:",editView);
var _17=objj_msgSend(CPDictionary,"new"),_18=objj_msgSend(mapView,"frame");
objj_msgSend(_13,"addSubview:",editView);
objj_msgSend(_17,"setValue:forKey:",editView,CPViewAnimationTargetKey);
objj_msgSend(_17,"setValue:forKey:",_18,CPViewAnimationStartFrameKey);
objj_msgSend(_17,"setValue:forKey:",_18,CPViewAnimationEndFrameKey);
objj_msgSend(_17,"setValue:forKey:",CPViewAnimationFadeInEffect,CPViewAnimationEffectKey);
var _19=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_17]);
objj_msgSend(_19,"startAnimation");
}
}),new objj_method(sel_getUid("hideEditView:"),function(_1a,_1b,_1c){
with(_1a){
isEditing=NO;
objj_msgSend(_1a,"addSubview:",editView);
var _1d=objj_msgSend(CPDictionary,"new"),_1e=objj_msgSend(mapView,"frame");
objj_msgSend(_1d,"setValue:forKey:",editView,CPViewAnimationTargetKey);
objj_msgSend(_1d,"setValue:forKey:",_1e,CPViewAnimationStartFrameKey);
objj_msgSend(_1d,"setValue:forKey:",_1e,CPViewAnimationEndFrameKey);
objj_msgSend(_1d,"setValue:forKey:",CPViewAnimationFadeOutEffect,CPViewAnimationEffectKey);
var _1f=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_1d]);
objj_msgSend(_1f,"startAnimation");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_20,_21,_22){
with(_20){
if(objj_msgSend(_22,"clickCount")<2){
return;
}
if(isEditing){
objj_msgSend(_20,"hideEditView:",_20);
}else{
objj_msgSend(_20,"showEditView:",_20);
}
}
}),new objj_method(sel_getUid("setAddress:"),function(_23,_24,_25){
with(_23){
objj_msgSend(addressField,"setStringValue:",_25);
objj_msgSend(mapView,"takeStringAddressFrom:",addressField);
}
}),new objj_method(sel_getUid("setMapType:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
var _28=objj_msgSend(_28,"indexOfSelectedItem");
}else{
}
objj_msgSend(mapView,"setMapType:",_28);
}
})]);
var _1=objj_getClass("MKMapView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MKMapView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setDoubleTarget:"),function(_29,_2a,_2b){
with(_29){
doubleTarget=_2b;
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_2c,_2d,_2e){
with(_2c){
doubleAction=_2e;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_2f,_30,_31){
with(_2f){
if(objj_msgSend(_31,"clickCount")===2&&doubleTarget&&doubleAction){
objj_msgSend(doubleTarget,doubleAction,_2f);
return;
}
objj_msgSend(_2f,"trackPan:",_31);
objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("MKMapView").super_class},"mouseDown:",_31);
}
}),new objj_method(sel_getUid("addMarker:atLocation:"),function(_32,_33,_34,_35){
with(_32){
if(_mapReady){
var _36=objj_msgSend(_34,"gMarker");
_36.setLatLng(objj_msgSend(_35,"googleLatLng"));
m_map.addOverlay(_36);
}else{
}
return marker;
}
}),new objj_method(sel_getUid("clearOverlays"),function(_37,_38){
with(_37){
if(_mapReady){
m_map.clearOverlays();
}
}
})]);

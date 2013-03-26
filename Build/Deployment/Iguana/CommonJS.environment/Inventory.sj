@STATIC;1.0;p;10;Animator.jt;8378;@STATIC;1.0;I;15;AppKit/CPView.jt;8339;
objj_executeFile("AppKit/CPView.j",NO);
CPAnimationEase=4;
var _1=[];
_1[CPAnimationEaseInOut]=objj_msgSend(CAMediaTimingFunction,"functionWithName:",kCAMediaTimingFunctionEaseInEaseOut);
_1[CPAnimationEaseIn]=objj_msgSend(CAMediaTimingFunction,"functionWithName:",kCAMediaTimingFunctionEaseIn);
_1[CPAnimationEaseOut]=objj_msgSend(CAMediaTimingFunction,"functionWithName:",kCAMediaTimingFunctionEaseOut);
_1[CPAnimationLinear]=objj_msgSend(CAMediaTimingFunction,"functionWithName:",kCAMediaTimingFunctionLinear);
_1[CPAnimationEase]=objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.25,0.1,0.25,1);
var _2=function(_3,_4,_5){
if(typeof (_3[_4])=="undefined"){
_3[_4]=_5;
}
return _3[_4];
};
var _6=objj_getClass("CPView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("fadeIn"),function(_8,_9){
with(_8){
objj_msgSend(_8,"fade:",{from:0,to:1});
}
}),new objj_method(sel_getUid("fadeOut"),function(_a,_b){
with(_a){
objj_msgSend(_a,"fade:",{from:objj_msgSend(_a,"alphaValue"),to:0});
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("fade:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_c,"alphaValue"),_10=_2(_e,"from",_f>0?_f:0),to=_2(_e,"to",_f>0?0:1),_11=_2(_e,"duration",1),_12=_2(_e,"curve",CPAnimationEase),_13=_2(_e,"delay",NO),_14=_2(_e,"_delay",NO);
objj_msgSend(_c,"removeTransitionForProperty:","opacity");
if(_11>0){
objj_msgSend(_c,"setAlphaValue:",_10);
objj_msgSend(_c,"addTransitionForProperty:duration:animationCurve:","opacity",_11,_12);
objj_msgSend(_c,"_applyTransitions");
setTimeout(function(){
objj_msgSend(_c,"removeTransitionForProperty:","opacity");
objj_msgSend(_c,"_applyTransitions");
},_11*1000);
}
objj_msgSend(_c,"setAlphaValue:",to);
}
}),new objj_method(sel_getUid("flip:"),function(_15,_16,_17){
with(_15){
var _18=_17.modalView;
if(!objj_msgSend(_18,"isKindOfClass:",CPView)){
return;
}
var _19=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(_15,"window"),"frame"),CPBorderlessWindowMask);
objj_msgSend(_19,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(objj_msgSend(_19,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.1,0.6));
objj_msgSend(objj_msgSend(_19,"contentView"),"setAlphaValue:",0);
objj_msgSend(_19,"contentView")._DOMElement.style["-webkit-perspective"]="1200px";
objj_msgSend(_19,"orderFront:",_15);
setTimeout(function(){
objj_msgSend(objj_msgSend(_19,"contentView"),"fadeIn");
},0);
var _1a=objj_msgSend(_18,"frame").size;
objj_msgSend(_18,"setFrame:",objj_msgSend(_15,"frame"));
objj_msgSend(_18,"setAffineTransform:","rotateY(-170deg)");
objj_msgSend(objj_msgSend(_19,"contentView"),"addSubview:",_18);
var _1b=objj_msgSend(_15,"alphaValue"),_1c=objj_msgSend(_15,"affineTransform"),_1d=_2(_17,"duration",1),_1e=_2(_17,"curve",CPAnimationEaseInOut);
_17._currentAlpha=_1b;
_17._currentTransform=_1c;
_17._lightboxWindow=_19;
_15._flipOptions=_17;
if(_1d>0){
objj_msgSend(_15,"superview")._DOMElement.style["-webkit-perspective"]="1200px";
objj_msgSend(_15,"addTransitionForProperty:duration:animationCurve:","-webkit-transform",_1d,_1e);
_DOMElement.style["-webkit-transform-style"]="preserve-3d";
_DOMElement.style["-webkit-backface-visibility"]="hidden";
objj_msgSend(_15,"_applyTransitions");
objj_msgSend(_18,"addTransitionForProperty:duration:animationCurve:","left",_1d*0.4,_1e);
objj_msgSend(_18,"addTransitionForProperty:duration:animationCurve:","top",_1d*0.4,_1e);
objj_msgSend(_18,"addTransitionForProperty:duration:animationCurve:","width",_1d*0.4,_1e);
objj_msgSend(_18,"addTransitionForProperty:duration:animationCurve:","height",_1d*0.4,_1e);
objj_msgSend(_18,"addTransitionForProperty:duration:animationCurve:","-webkit-transform",_1d,_1e);
_18._DOMElement.style["-webkit-transform-style"]="preserve-3d";
_18._DOMElement.style["-webkit-backface-visibility"]="hidden";
objj_msgSend(_18,"_applyTransitions");
}
var _1f="rotateY(170deg)";
objj_msgSend(_15,"setAffineTransform:",_1f);
setTimeout(function(){
objj_msgSend(_18,"setAffineTransform:",CGAffineTransformMakeIdentity());
},0);
setTimeout(function(){
var _20=objj_msgSend(objj_msgSend(_15,"window"),"contentView"),_21=objj_msgSend(_20,"bounds");
objj_msgSend(_18,"setFrame:",CGRectMake(CGRectGetMidX(_21)-_1a.width*0.5,CGRectGetMidY(_21)-_1a.height*0.5,_1a.width,_1a.height));
},_1d*0.5*1000);
}
}),new objj_method(sel_getUid("unflip"),function(_22,_23){
with(_22){
var _24=_22._flipOptions;
if(!_24){
return;
}
delete _22._flipOptions;
var _25=_24._currentAlpha,_26=_24._currentTransform,_27=_24._lightboxWindow,_28=_24.modalView,_29=_24.duration;
if(_29>0){
setTimeout(function(){
objj_msgSend(_22,"removeTransitionForProperty:","-webkit-transform");
objj_msgSend(_22,"superview")._DOMElement.style["-webkit-perspective"]=null;
_DOMElement.style["-webkit-transform-style"]=null;
objj_msgSend(_22,"_applyTransitions");
objj_msgSend(_28,"removeTransitionForProperty:","-webkit-transform");
objj_msgSend(_28,"removeTransitionForProperty:","left");
objj_msgSend(_28,"removeTransitionForProperty:","top");
objj_msgSend(_28,"removeTransitionForProperty:","width");
objj_msgSend(_28,"removeTransitionForProperty:","height");
objj_msgSend(_28,"_applyTransitions");
},_29*1000);
}
objj_msgSend(_22,"setAffineTransform:",_26);
objj_msgSend(_28,"setAffineTransform:","rotateY(-170deg)");
objj_msgSend(_28,"setFrame:",objj_msgSend(_22,"frame"));
setTimeout(function(){
objj_msgSend(objj_msgSend(_27,"contentView"),"fadeOut");
},_29*0.5*1000);
setTimeout(function(){
objj_msgSend(_27,"orderOut:",_22);
},_29*1000);
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("addTransitionForProperty:duration:animationCurve:"),function(_2a,_2b,_2c,_2d,_2e){
with(_2a){
var _2f=_2a._transitionProperties;
if(!_2f){
_2f={};
_2a._transitionProperties=_2f;
}
var _30=_2f[_2c];
if(!_30){
_30={};
_2f[_2c]=_30;
}
_30.duration=_2d+"s";
if(!objj_msgSend(_2e,"isKindOfClass:",CAMediaTimingFunction)){
_2e=_1[_2e]||objj_msgSend(_1,"lastObject");
}
_30.curve="cubic-bezier("+[_2e._c1x,_2e._c1y,_2e._c2x,_2e._c2y].join(", ")+")";
}
}),new objj_method(sel_getUid("removeTransitionForProperty:"),function(_31,_32,_33){
with(_31){
var _34=_31._transitionProperties;
if(!_34){
return;
}
delete _34[_33];
}
}),new objj_method(sel_getUid("_applyTransitions"),function(_35,_36){
with(_35){
var _37=_35._transitionProperties;
if(!_37){
_37={};
}
var _38=[],_39=[],_3a=[];
for(property in _37){
var _3b=_37[property];
_38.push(property);
_39.push(_3b.duration);
_3a.push(_3b.curve);
}
var _3c=_DOMElement.style,_3d=["webkit","moz","o"];
for(var i=0,_3e=_3d.length;i<_3e;i++){
var _3f=_3d[i];
_3c[_3f+"TransitionProperty"]=_38.join(", ");
_3c[_3f+"TransitionDuration"]=_39.join(", ");
_3c[_3f+"TransitionTimingFunction"]=_3a.join(", ");
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelectors");
}
}),new objj_method(sel_getUid("setAffineTransform:"),function(_40,_41,_42){
with(_40){
if(!_42){
_42=CGAffineTransformMakeIdentity();
}
if(!_42.isa){
if(_transform&&!_transform.isa&&CGAffineTransformEqualToTransform(_transform,_42)){
return;
}
_transform=CGAffineTransformMakeCopy(_42);
if(CGAffineTransformIsIdentity(_transform)){
_DOMElement.style["-webkit-transform"]=null;
}else{
_DOMElement.style["-webkit-transform"]="matrix("+_transform.a+", "+_transform.b+", "+_transform.c+", "+_transform.d+", "+_transform.tx+", "+_transform.ty+")";
}
}else{
_transform=_42;
if(objj_msgSend(_transform,"isKindOfClass:",CPString)){
_DOMElement.style["-webkit-transform"]=_transform;
}
}
}
})]);
CGAffineTransform3DFrom2D=function(_43){
return CGAffineTransformMake([_43.a,_43.b,0,0],[_43.c,_43.d,0,0],[0,0,1,0],[_43.e,_43.f],[0],[1]);
};
CGAffineTransform3DConcat=function(lhs,rhs){
};
CGAffineTransform3DMakeRotationY=function(_44){
var sin=SIN(_44),cos=COS(_44);
return CGAffineTransformMake([cos,0,-sin,0],[0,1,0,0],[sin,0,cos,0],[0,0],[0],[1]);
};
CGAffineTransform3DRotateY=function(_45,_46){
};
p;15;AppController.jt;26351;@STATIC;1.0;I;21;AppKit/CPScrollView.jI;21;Foundation/CPObject.jI;15;MapKit/MapKit.ji;21;CappuGeo/CPLocation.ji;31;CappuGeo/CPLocationController.ji;23;CappuGeo/CPDirections.ji;21;CappuGeo/CPMapImage.ji;22;CappuGeo/CPMapMarker.ji;20;CappuGeo/CPMapView.ji;22;LPMultiLineTextField.ji;22;LPCardFlipController.ji;22;SourceViewController.ji;10;ItemView.ji;20;ItemViewController.ji;14;LocationView.ji;18;LocationEditView.ji;16;NoLocationView.ji;10;Location.ji;20;LocationController.ji;6;Item.ji;16;ItemController.ji;16;ItemAttachment.ji;23;RLOfflineLocalStorage.ji;24;RLOfflineDatabaseStore.ji;11;RLMapView.ji;17;NATokenTextView.ji;9;Stepper.ji;12;DatePicker.ji;18;CPDate+Additions.ji;41;DeepDropFileUpload/DCFileDropController.ji;40;DeepDropFileUpload/DCFileUploadManager.ji;11;MediaView.jt;25560;
saveAppData=function(){
objj_msgSend(objj_msgSend(CPApp,"delegate"),"serialize");
};
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("MapKit/MapKit.j",NO);
objj_executeFile("CappuGeo/CPLocation.j",YES);
objj_executeFile("CappuGeo/CPLocationController.j",YES);
objj_executeFile("CappuGeo/CPDirections.j",YES);
objj_executeFile("CappuGeo/CPMapImage.j",YES);
objj_executeFile("CappuGeo/CPMapMarker.j",YES);
objj_executeFile("CappuGeo/CPMapView.j",YES);
objj_executeFile("LPMultiLineTextField.j",YES);
objj_executeFile("LPCardFlipController.j",YES);
objj_executeFile("SourceViewController.j",YES);
objj_executeFile("ItemView.j",YES);
objj_executeFile("ItemViewController.j",YES);
objj_executeFile("LocationView.j",YES);
objj_executeFile("LocationEditView.j",YES);
objj_executeFile("NoLocationView.j",YES);
objj_executeFile("Location.j",YES);
objj_executeFile("LocationController.j",YES);
objj_executeFile("Item.j",YES);
objj_executeFile("ItemController.j",YES);
objj_executeFile("ItemAttachment.j",YES);
objj_executeFile("RLOfflineLocalStorage.j",YES);
objj_executeFile("RLOfflineDatabaseStore.j",YES);
objj_executeFile("RLMapView.j",YES);
objj_executeFile("NATokenTextView.j",YES);
objj_executeFile("Stepper.j",YES);
objj_executeFile("DatePicker.j",YES);
objj_executeFile("CPDate+Additions.j",YES);
objj_executeFile("DeepDropFileUpload/DCFileDropController.j",YES);
objj_executeFile("DeepDropFileUpload/DCFileUploadManager.j",YES);
objj_executeFile("MediaView.j",YES);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("outsideSplitView"),new objj_ivar("sourceViewController"),new objj_ivar("allLocations"),new objj_ivar("mainWindow"),new objj_ivar("mainToolbar"),new objj_ivar("undoManager"),new objj_ivar("locationController"),new objj_ivar("newLocationTitle"),new objj_ivar("newLocationType")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("sourceViewController"),function(_3,_4){
with(_3){
return sourceViewController;
}
}),new objj_method(sel_getUid("setSourceViewController:"),function(_5,_6,_7){
with(_5){
sourceViewController=_7;
}
}),new objj_method(sel_getUid("allLocations"),function(_8,_9){
with(_8){
return allLocations;
}
}),new objj_method(sel_getUid("setAllLocations:"),function(_a,_b,_c){
with(_a){
allLocations=_c;
}
}),new objj_method(sel_getUid("mainToolbar"),function(_d,_e){
with(_d){
return mainToolbar;
}
}),new objj_method(sel_getUid("setMainToolbar:"),function(_f,_10,_11){
with(_f){
mainToolbar=_11;
}
}),new objj_method(sel_getUid("undoManager"),function(_12,_13){
with(_12){
return undoManager;
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_14,_15,_16){
with(_14){
undoManager=_16;
}
}),new objj_method(sel_getUid("locationController"),function(_17,_18){
with(_17){
return locationController;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_19,_1a,_1b){
with(_19){
locationController=_1b;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_1c,_1d,_1e){
with(_1c){
allLocations=[];
undoManager=objj_msgSend(objj_msgSend(RLUndoManager,"alloc"),"init");
objj_msgSend(undoManager,"setDelegate:",_1c);
mainWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(50,75,1100,650),CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask);
var _1f=objj_msgSend(mainWindow,"contentView");
objj_msgSend(mainWindow,"setFullBridge:",YES);
outsideSplitView=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",objj_msgSend(_1f,"bounds"));
objj_msgSend(outsideSplitView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(outsideSplitView,"setDelegate:",_1c);
objj_msgSend(outsideSplitView,"setIsPaneSplitter:",YES);
var _20=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,500,CGRectGetHeight(objj_msgSend(_1f,"bounds"))));
objj_msgSend(_20,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
locationController=objj_msgSend(objj_msgSend(LocationController,"alloc"),"initWithContentView:",_20);
var _21=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,230,CGRectGetHeight(objj_msgSend(_1f,"bounds"))));
objj_msgSend(outsideSplitView,"addSubview:",_21);
objj_msgSend(outsideSplitView,"addSubview:",_20);
sourceViewController=objj_msgSend(objj_msgSend(SourceViewController,"alloc"),"initWithContainerView:",_21);
objj_msgSend(outsideSplitView,"setVertical:",YES);
objj_msgSend(outsideSplitView,"setPosition:ofDividerAtIndex:",230,0);
objj_msgSend(_1f,"addSubview:",outsideSplitView);
objj_msgSend(mainWindow,"orderFront:",_1c);
var _22=objj_msgSend(CPApp,"mainMenu"),_23=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_24=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_25=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo"),"z"),_26=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo"),"Z"),_27=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("serialize"),"s"),_28=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("load"),"o");
objj_msgSend(_25,"setTarget:",undoManager);
objj_msgSend(_26,"setTarget:",undoManager);
objj_msgSend(_27,"setTarget:",_1c);
objj_msgSend(_28,"setTarget:",_1c);
objj_msgSend(_24,"addItem:",_25);
objj_msgSend(_24,"addItem:",_26);
objj_msgSend(_24,"addItem:",_27);
objj_msgSend(_24,"addItem:",_28);
objj_msgSend(_23,"setSubmenu:",_24);
objj_msgSend(_24,"_setMenuName:","CPMainMenu");
objj_msgSend(CPApp,"setMainMenu:",_24);
objj_msgSend(_22,"removeAllItems");
objj_msgSend(_1c,"load");
mainToolbar=objj_msgSend(objj_msgSend(CPToolbar,"alloc"),"initWithIdentifier:","maintoolbar");
objj_msgSend(mainToolbar,"setDelegate:",_1c);
objj_msgSend(mainWindow,"setToolbar:",mainToolbar);
objj_msgSend(mainToolbar,"validateVisibleItems");
}
}),new objj_method(sel_getUid("confirmRemovalOfLocation:"),function(_29,_2a,_2b){
with(_29){
if(!_2b){
return;
}
var _2c=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,120),CPDocModalWindowMask),_2d=objj_msgSend(_2c,"contentView"),_2e=objj_msgSend(CPTextField,"labelWithTitle:","Delete Location");
objj_msgSend(_2e,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_2e,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_2d,"addSubview:",_2e);
var _2f=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68));
var _30=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_30,"setImage:",_2f);
objj_msgSend(_2d,"addSubview:",_30);
var _31=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,325,60));
objj_msgSend(_31,"setStringValue:","Are you sure you want to remove this location? ");
objj_msgSend(_31,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_2d,"addSubview:",_31);
var _32=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(285,85,100,24));
objj_msgSend(_32,"setTitle:","Remove");
objj_msgSend(_32,"setTag:",0);
objj_msgSend(_32,"setTarget:",_29);
objj_msgSend(_32,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_2d,"addSubview:",_32);
objj_msgSend(_2c,"setDefaultButton:",_32);
var _33=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,85,100,24));
objj_msgSend(_33,"setTag:",-1);
objj_msgSend(_33,"setTitle:","Cancel");
objj_msgSend(_33,"setTarget:",_29);
objj_msgSend(_33,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_2d,"addSubview:",_33);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_2c,mainWindow,_29,sel_getUid("didEndSheet:returnCode:contextInfo:"),_2b);
}
}),new objj_method(sel_getUid("addNewLocation:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,150),CPDocModalWindowMask),_38=objj_msgSend(_37,"contentView"),_39=objj_msgSend(CPTextField,"labelWithTitle:","Add New Location");
objj_msgSend(_39,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_39,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_38,"addSubview:",_39);
var _3a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68)),_3b=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_3b,"setImage:",_3a);
objj_msgSend(_38,"addSubview:",_3b);
var _3c=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(280,115,100,24));
objj_msgSend(_3c,"setTitle:","Create");
objj_msgSend(_3c,"setTag:",1);
objj_msgSend(_3c,"setTarget:",_34);
objj_msgSend(_3c,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_38,"addSubview:",_3c);
objj_msgSend(_37,"setDefaultButton:",_3c);
var _3d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,115,100,24));
objj_msgSend(_3d,"setTag:",-1);
objj_msgSend(_3d,"setTitle:","Cancel");
objj_msgSend(_3d,"setTarget:",_34);
objj_msgSend(_3d,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_38,"addSubview:",_3d);
newLocationTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,287,28));
objj_msgSend(newLocationTitle,"setBezeled:",YES);
objj_msgSend(newLocationTitle,"setEditable:",YES);
objj_msgSend(newLocationTitle,"setPlaceholderString:","Add new location");
objj_msgSend(newLocationTitle,"setTarget:",_3c);
objj_msgSend(newLocationTitle,"setAction:",sel_getUid("performClick:"));
objj_msgSend(newLocationTitle,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_38,"addSubview:",newLocationTitle);
newLocationType=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(105,70,200,24));
objj_msgSend(newLocationType,"setBordered:",NO);
objj_msgSend(newLocationType,"setTitle:","Select Type");
objj_msgSend(newLocationType,"addItems:",objj_msgSend(LocationItemTypes,"menuItems"));
objj_msgSend(_38,"addSubview:",newLocationType);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_37,mainWindow,_34,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
objj_msgSend(_37,"makeFirstResponder:",newLocationTitle);
}
}),new objj_method(sel_getUid("removeLocation:"),function(_3e,_3f,_40){
with(_3e){
if(!_40){
return;
}
var _41=objj_msgSend(_40,"superLocation");
if(_41){
objj_msgSend(_41,"removeSubLocation:",_40);
}else{
objj_msgSend(allLocations,"removeObject:",_40);
}
var _42=objj_msgSend(sourceViewController,"sourceList");
objj_msgSend(_42,"reloadData");
objj_msgSend(_42,"_noteSelectionDidChange");
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_3e,sel_getUid("addLocation:"),_40);
}
}),new objj_method(sel_getUid("addLocation:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_45,"superLocation")){
objj_msgSend(objj_msgSend(_45,"superLocation"),"addSubLocation:",_45);
}else{
objj_msgSend(allLocations,"addObject:",_45);
}
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_43,sel_getUid("removeLocation:"),_45);
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("moveItem:fromLocation:to:"),function(_46,_47,_48,_49,_4a){
with(_46){
objj_msgSend(_4a,"addItem:",_48);
objj_msgSend(_49,"removeItem:",_48);
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"itemTableView"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"collectionView"),"reloadContent");
var _4b=objj_msgSend(CPInvocation,"invocationWithMethodSignature:","MoveItem:FromLocation:to:");
objj_msgSend(_4b,"setTarget:",_46);
objj_msgSend(_4b,"setSelector:",sel_getUid("moveItem:fromLocation:to:"));
objj_msgSend(_4b,"setArgument:atIndex:",_48,2);
objj_msgSend(_4b,"setArgument:atIndex:",_4a,3);
objj_msgSend(_4b,"setArgument:atIndex:",_49,4);
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_4b,sel_getUid("invoke"),nil);
}
}),new objj_method(sel_getUid("closeSheet:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(CPApp,"endSheet:returnCode:",objj_msgSend(_4e,"window"),objj_msgSend(_4e,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_4f,_50,_51,_52,_53){
with(_4f){
objj_msgSend(_51,"orderOut:",_4f);
switch(_52){
case 0:
objj_msgSend(_4f,"removeLocation:",_53);
break;
case 1:
var _54=objj_msgSend(newLocationTitle,"stringValue");
if(!_54){
alert("You gotta enter a name for this location dude!");
return;
}
var _55=objj_msgSend(objj_msgSend(Location,"alloc"),"initWithName:",objj_msgSend(newLocationTitle,"stringValue"));
objj_msgSend(_55,"setType:",(objj_msgSend(newLocationType,"titleOfSelectedItem")||""));
objj_msgSend(_4f,"addLocation:",_55);
break;
}
}
}),new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"),function(_56,_57,_58){
with(_56){
return [CPToolbarFlexibleSpaceItemIdentifier,CPToolbarSeparatorItemIdentifier,CPToolbarSpaceItemIdentifier,"searchfield","newItem","newLocation","undo","redo"];
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_59,_5a,_5b){
with(_59){
return ["newItem","newLocation",CPToolbarSeparatorItemIdentifier,"undo","redo",CPToolbarFlexibleSpaceItemIdentifier,"searchfield"];
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
var _61=objj_msgSend(CPBundle,"mainBundle"),_62=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_5f);
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityHigh);
switch(_5f){
case "newItem":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","itemIcon.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","itemIcon.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",locationController);
objj_msgSend(_62,"setAction:",sel_getUid("addNewItem:"));
objj_msgSend(_62,"setLabel:","New Item");
objj_msgSend(_62,"setTag:","NewItem");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "newLocation":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","SignPost.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","SignPost.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",_5c);
objj_msgSend(_62,"setAction:",sel_getUid("addNewLocation:"));
objj_msgSend(_62,"setLabel:","New Location");
objj_msgSend(_62,"setTag:","NewLocation");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "searchfield":
var _65=objj_msgSend(objj_msgSend(CPSearchField,"alloc"),"initWithFrame:",CGRectMake(0,10,140,30));
objj_msgSend(_65,"setTarget:",_5c);
objj_msgSend(_65,"setAction:",sel_getUid("searchFieldDidChange:"));
objj_msgSend(_65,"setSendsSearchStringImmediately:",YES);
objj_msgSend(_62,"setView:",_65);
objj_msgSend(_62,"setLabel:","Search Items");
objj_msgSend(_62,"setTag:","SearchItems");
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityHigh);
objj_msgSend(_62,"setMinSize:",CGSizeMake(200,30));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(200,30));
break;
case "undo":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","undo.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","undo.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",undoManager);
objj_msgSend(_62,"setAction:",sel_getUid("undo"));
objj_msgSend(_62,"setLabel:","Undo");
objj_msgSend(_62,"setTag:","Undo");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "redo":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","redo.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","redo.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",undoManager);
objj_msgSend(_62,"setAction:",sel_getUid("redo"));
objj_msgSend(_62,"setLabel:","Redo");
objj_msgSend(_62,"setTag:","Redo");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
}
return _62;
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_66,_67,_68){
with(_66){
return YES;
}
}),new objj_method(sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"),function(_69,_6a,_6b,_6c,_6d){
with(_69){
return 140;
}
}),new objj_method(sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"),function(_6e,_6f,_70,_71,_72){
with(_6e){
return 400;
}
}),new objj_method(sel_getUid("undoManagerStackDidChange:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_73,"serialize");
window.setTimeout(function(){
objj_msgSend(mainToolbar,"validateVisibleItems");
},0);
}
}),new objj_method(sel_getUid("serialize"),function(_76,_77){
with(_76){
var _78=JSON.stringify(allLocations),_79=objj_msgSend(objj_msgSend(RLOfflineLocalStorage,"alloc"),"init");
if(objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")){
objj_msgSend(_79,"setValue:forKey:",_78,"InventoryData");
}else{
alert("You're using a bad browser. Get one that supports local storage.");
return;
}
}
}),new objj_method(sel_getUid("load"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(objj_msgSend(RLOfflineLocalStorage,"alloc"),"init");
if(objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")){
var _7d=objj_msgSend(_7c,"getValueForKey:","InventoryData");
}else{
alert("You're using a bad browser. Get one that supports local storage.");
return;
}
if(!_7d||_7d==="null"){
return;
}
_7d=JSON.parse(_7d);
allLocations=[];
for(var i=0;i<_7d.length;i++){
var _7e=objj_msgSend(Location,"decodeJSON:",_7d[i]);
objj_msgSend(allLocations,"addObject:",_7e);
}
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_7f,_80,_81){
with(_7f){
if(objj_msgSend(_7f,"hasThemeState:",CPThemeStateBordered)){
return;
}
var _82=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_82);
CGContextTranslateCTM(_82,FLOOR(CGRectGetWidth(_81)-19),12);
CGContextRotateCTM(_82,PI);
CGContextMoveToPoint(_82,0,0);
CGContextAddLineToPoint(_82,5,0);
CGContextAddLineToPoint(_82,2.5,5);
CGContextAddLineToPoint(_82,0,0);
CGContextClosePath(_82);
var _83=objj_msgSend(CPColor,"grayColor");
CGContextSetFillColor(_82,_83);
CGContextFillPath(_82);
CGContextTranslateCTM(_82,5,-2.5);
CGContextRotateCTM(_82,PI);
CGContextMoveToPoint(_82,0,0);
CGContextAddLineToPoint(_82,5,0);
CGContextAddLineToPoint(_82,2.5,5);
CGContextAddLineToPoint(_82,0,0);
CGContextClosePath(_82);
var _83=objj_msgSend(CPColor,"grayColor");
CGContextSetFillColor(_82,_83);
CGContextFillPath(_82);
}
})]);
var _1=objj_getClass("CPMenu");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("removeAllItems"),function(_84,_85){
with(_84){
return;
for(var i=0;i<objj_msgSend(_84,"numberOfItems");i++){
objj_msgSend(_84,"removeItemAtIndex:",i);
}
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addItems:"),function(_86,_87,_88){
with(_86){
for(var i=0;i<_88.length;i++){
objj_msgSend(_86,"addItem:",_88[i]);
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"LocationItemTypes"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("menuItems"),function(_89,_8a){
with(_89){
var _8b=[],_8c=objj_msgSend(CPBundle,"mainBundle"),_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Building",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Building"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Computer",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Computer"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Safe",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Safe"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Car",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Car"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Bank",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Bank"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Yard",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Yard"));
objj_msgSend(_8b,"addObject:",_8d);
return _8b;
}
}),new objj_method(sel_getUid("imageForItemWithTitle:"),function(_8e,_8f,_90){
with(_8e){
var _91=objj_msgSend(CPBundle,"mainBundle");
switch(_90){
case "Building":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","building.png"),CGSizeMake(16,16));
break;
case "Computer":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","computer.png"),CGSizeMake(16,16));
break;
case "Safe":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","safe.png"),CGSizeMake(16,16));
break;
case "Car":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","car.png"),CGSizeMake(16,16));
break;
case "Bank":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","bank.png"),CGSizeMake(16,16));
break;
case "Yard":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","yard.png"),CGSizeMake(16,16));
break;
default:
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","SignPost.png"),CGSizeMake(20,20));
break;
}
}
})]);
var _1=objj_allocateClassPair(CPUndoManager,"RLUndoManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_92,_93){
with(_92){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_94,_95,_96){
with(_94){
delegate=_96;
}
}),new objj_method(sel_getUid("init"),function(_97,_98){
with(_97){
_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("RLUndoManager").super_class},"init");
if(_97){
delegate=nil;
}
return _97;
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_99,_9a,_9b,_9c,_9d){
with(_99){
objj_msgSendSuper({receiver:_99,super_class:objj_getClass("RLUndoManager").super_class},"registerUndoWithTarget:selector:object:",_9b,_9c,_9d);
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("undoManagerStackDidChange:"))){
objj_msgSend(delegate,"undoManagerStackDidChange:",_99);
}
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_9e,_9f,_a0){
with(_9e){
var _a1=objj_msgSend(_a0,"itemIdentifier");
if(_a1==="undo"){
return objj_msgSend(_9e,"canUndo");
}else{
if(_a1==="redo"){
return objj_msgSend(_9e,"canRedo");
}
}
}
})]);
p;18;CPDate+Additions.jt;1136;@STATIC;1.0;t;1117;
var _1=objj_getClass("CPDate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("monthByName"),function(_3,_4){
with(_3){
var _5=_3.getMonth();
switch(_5){
case 0:
_5="January";
break;
case 1:
_5="February";
break;
case 2:
_5="March";
break;
case 3:
_5="April";
break;
case 4:
_5="May";
break;
case 5:
_5="June";
break;
case 6:
_5="July";
break;
case 7:
_5="August";
break;
case 8:
_5="September";
break;
case 9:
_5="October";
break;
case 10:
_5="November";
break;
case 11:
_5="December";
break;
}
return _5;
}
}),new objj_method(sel_getUid("longStringDate"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"monthByName")+" "+objj_msgSend(_6,"enlongatedDay")+", "+_6.getFullYear();
}
}),new objj_method(sel_getUid("enlongatedDay"),function(_8,_9){
with(_8){
var _a=String(_8.getDate());
if(_a.length===2&&_a[1]==="1"){
return _a+"st";
}
if(_a[_a.length]==="1"){
return _a+"st";
}else{
if(_a[_a.length]==="2"){
return _a+"nd";
}else{
if(_a[_a.length]==="3"){
return _a+"rd";
}else{
return _a+"th";
}
}
}
}
})]);
p;12;DatePicker.jt;42952;@STATIC;1.0;I;18;AppKit/CPControl.ji;9;Stepper.jt;42896;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("Stepper.j",YES);
var _1=objj_allocateClassPair(CPControl,"DatePicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_theView"),new objj_ivar("_theStepper"),new objj_ivar("segments"),new objj_ivar("superController"),new objj_ivar("_date"),new objj_ivar("_minDate"),new objj_ivar("_maxDate"),new objj_ivar("bezel"),new objj_ivar("bezelFocused"),new objj_ivar("dateSegmentFocused"),new objj_ivar("focused"),new objj_ivar("inputManager"),new objj_ivar("currentFocusedSegment"),new objj_ivar("lastFocusedSegment"),new objj_ivar("_delegate"),new objj_ivar("activeDateSegment"),new objj_ivar("prevActiveDateSegment"),new objj_ivar("superController"),new objj_ivar("_dontsetfirsttome")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_theView"),function(_3,_4){
with(_3){
return _theView;
}
}),new objj_method(sel_getUid("_setTheView:"),function(_5,_6,_7){
with(_5){
_theView=_7;
}
}),new objj_method(sel_getUid("_theStepper"),function(_8,_9){
with(_8){
return _theStepper;
}
}),new objj_method(sel_getUid("_setTheStepper:"),function(_a,_b,_c){
with(_a){
_theStepper=_c;
}
}),new objj_method(sel_getUid("segments"),function(_d,_e){
with(_d){
return segments;
}
}),new objj_method(sel_getUid("setSegments:"),function(_f,_10,_11){
with(_f){
segments=_11;
}
}),new objj_method(sel_getUid("superController"),function(_12,_13){
with(_12){
return superController;
}
}),new objj_method(sel_getUid("setSuperController:"),function(_14,_15,_16){
with(_14){
superController=_16;
}
}),new objj_method(sel_getUid("focused"),function(_17,_18){
with(_17){
return focused;
}
}),new objj_method(sel_getUid("setFocused:"),function(_19,_1a,_1b){
with(_19){
focused=_1b;
}
}),new objj_method(sel_getUid("inputManager"),function(_1c,_1d){
with(_1c){
return inputManager;
}
}),new objj_method(sel_getUid("setInputManager:"),function(_1e,_1f,_20){
with(_1e){
inputManager=_20;
}
}),new objj_method(sel_getUid("currentFocusedSegment"),function(_21,_22){
with(_21){
return currentFocusedSegment;
}
}),new objj_method(sel_getUid("setCurrentFocusedSegment:"),function(_23,_24,_25){
with(_23){
currentFocusedSegment=_25;
}
}),new objj_method(sel_getUid("lastFocusedSegment"),function(_26,_27){
with(_26){
return lastFocusedSegment;
}
}),new objj_method(sel_getUid("setLastFocusedSegment:"),function(_28,_29,_2a){
with(_28){
lastFocusedSegment=_2a;
}
}),new objj_method(sel_getUid("activeDateSegment"),function(_2b,_2c){
with(_2b){
return activeDateSegment;
}
}),new objj_method(sel_getUid("setActiveDateSegment:"),function(_2d,_2e,_2f){
with(_2d){
activeDateSegment=_2f;
}
}),new objj_method(sel_getUid("prevActiveDateSegment"),function(_30,_31){
with(_30){
return prevActiveDateSegment;
}
}),new objj_method(sel_getUid("setPrevActiveDateSegment:"),function(_32,_33,_34){
with(_32){
prevActiveDateSegment=_34;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_35,_36,_37){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("DatePicker").super_class},"initWithFrame:",_37);
if(_35){
_theView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(4,3,CGRectGetWidth(_37)-20,23));
bezel=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-0.png"),CGSizeMake(2,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-1.png"),CGSizeMake(1,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-2.png"),CGSizeMake(2,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-3.png"),CGSizeMake(2,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-5.png"),CGSizeMake(2,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-6.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-7.png"),CGSizeMake(1,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-8.png"),CGSizeMake(2,2))]));
bezelFocused=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-0.png"),CGSizeMake(6,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-1.png"),CGSizeMake(1,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-2.png"),CGSizeMake(6,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-3.png"),CGSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-5.png"),CGSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-6.png"),CGSizeMake(6,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-7.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleWithPath:","Frameworks/AppKit/Resources/Aristo.blend"),"pathForResource:","textfield-bezel-square-focused-8.png"),CGSizeMake(6,5))]));
objj_msgSend(_theView,"setBackgroundColor:",bezel);
inputManager=_35;
objj_msgSend(inputManager,"setSuperController:",_35);
_theStepper=objj_msgSend(objj_msgSend(Stepper,"alloc"),"initWithFrame:",CGRectMake(_37.size.width-13,3,13,23));
objj_msgSend(_theStepper,"setTarget:",_35);
objj_msgSend(_theStepper,"setAction:",sel_getUid("stepperAction:"));
objj_msgSend(_35,"addSubview:",_theView);
objj_msgSend(_35,"addSubview:",_theStepper);
_date=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",0);
_maxDate=objj_msgSend(CPDate,"distantFuture");
_minDate=objj_msgSend(CPDate,"distantPast");
segments=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
focused=NO;
objj_msgSend(_theStepper,"setEnabled:",NO);
objj_msgSend(_theStepper,"setMaxValue:",9999);
objj_msgSend(_theStepper,"setMinValue:",-1);
}
return _35;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_3b,"removeObserver:name:object:",_delegate,"datePickerDidChangeNotification",_38);
}
_delegate=_3a;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("datePickerDidChange:"))){
objj_msgSend(_3b,"addObserver:selector:name:object:",_delegate,sel_getUid("datePickerDidChange:"),"datePickerDidChangeNotification",_38);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("datePickerDidLoseFocus:"))){
objj_msgSend(_3b,"addObserver:selector:name:object:",_delegate,sel_getUid("datePickerDidLoseFocus:"),"datePickerDidLoseFocusNotification",_38);
}
}
}),new objj_method(sel_getUid("addDateSegmentOfType:withInitialValue:withSeperatorAtEnd:"),function(_3c,_3d,_3e,_3f,_40){
with(_3c){
var _41=objj_msgSend(_3c,"makeFrameForType:",_3e);
var _42=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(6,7,20,18));
objj_msgSend(dateSegmentes,"addObject:",_42);
objj_msgSend(_3c,"addSubview:",_42);
}
}),new objj_method(sel_getUid("displayPreset:"),function(_43,_44,_45){
with(_43){
if(_45==1){
var _46=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(6,7,20,18));
objj_msgSend(_46,"setStringValue:","00");
objj_msgSend(_46,"sizeToFit");
objj_msgSend(_46,"setDelegate:",_43);
objj_msgSend(_46,"setInputManager:",_43);
objj_msgSend(_46,"setSuperController:",_43);
objj_msgSend(_46,"setDateType:",1);
if(CGRectGetHeight(objj_msgSend(_43,"frame"))-CGRectGetHeight(objj_msgSend(_46,"frame"))<14){
objj_msgSend(_43,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_43,"frame")),CGRectGetMinY(objj_msgSend(_43,"frame")),CGRectGetWidth(objj_msgSend(_43,"frame")),CGRectGetHeight(objj_msgSend(_46,"frame"))+14));
objj_msgSend(_theView,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_theView,"frame")),CGRectGetMinY(objj_msgSend(_theView,"frame")),CGRectGetWidth(objj_msgSend(_theView,"frame")),CGRectGetHeight(objj_msgSend(_46,"frame"))+6));
}
var _47=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(28,7,20,18));
objj_msgSend(_47,"setStringValue:","00");
objj_msgSend(_47,"sizeToFit");
objj_msgSend(_47,"setDelegate:",_43);
objj_msgSend(_47,"setInputManager:",_43);
objj_msgSend(_47,"setSuperController:",_43);
objj_msgSend(_47,"setDateType:",2);
var _48=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(50,7,35,18));
objj_msgSend(_48,"setStringValue:","0000");
objj_msgSend(_48,"sizeToFit");
objj_msgSend(_48,"setDelegate:",_43);
objj_msgSend(_48,"setInputManager:",_43);
objj_msgSend(_48,"setSuperController:",_43);
objj_msgSend(_48,"setDateType:",3);
objj_msgSend(_43,"addSubview:",_46);
objj_msgSend(_43,"addSubview:",_47);
objj_msgSend(_43,"addSubview:",_48);
objj_msgSend(segments,"addObject:",_46);
objj_msgSend(segments,"addObject:",_47);
objj_msgSend(segments,"addObject:",_48);
var _49=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(23,7,15,18));
objj_msgSend(_49,"setStringValue:","/");
objj_msgSend(_49,"sizeToFit");
var _4a=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(44,7,15,18));
objj_msgSend(_4a,"setStringValue:","/");
objj_msgSend(_4a,"sizeToFit");
objj_msgSend(_43,"addSubview:",_49);
objj_msgSend(_43,"addSubview:",_4a);
}else{
if(_45==2){
var _4b=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(6,7,20,18));
objj_msgSend(_4b,"setStringValue:","00");
objj_msgSend(_4b,"sizeToFit");
objj_msgSend(_4b,"setDelegate:",_43);
objj_msgSend(_4b,"setInputManager:",_43);
objj_msgSend(_4b,"setSuperController:",_43);
objj_msgSend(_4b,"setDateType:",9);
if(CGRectGetHeight(objj_msgSend(_43,"frame"))-CGRectGetHeight(objj_msgSend(_4b,"frame"))<14){
objj_msgSend(_43,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_43,"frame")),CGRectGetMinY(objj_msgSend(_43,"frame")),CGRectGetWidth(objj_msgSend(_43,"frame")),CGRectGetHeight(objj_msgSend(_4b,"frame"))+14));
objj_msgSend(_theView,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_theView,"frame")),CGRectGetMinY(objj_msgSend(_theView,"frame")),CGRectGetWidth(objj_msgSend(_theView,"frame")),CGRectGetHeight(objj_msgSend(_4b,"frame"))+6));
}
var _4c=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(28,7,20,18));
objj_msgSend(_4c,"setStringValue:","00");
objj_msgSend(_4c,"sizeToFit");
objj_msgSend(_4c,"setDelegate:",_43);
objj_msgSend(_4c,"setInputManager:",_43);
objj_msgSend(_4c,"setSuperController:",_43);
objj_msgSend(_4c,"setDateType:",8);
var _4d=objj_msgSend(objj_msgSend(DateSegment,"alloc"),"initWithFrame:",CGRectMake(45,7,20,18));
objj_msgSend(_4d,"setStringValue:","AM");
objj_msgSend(_4d,"sizeToFit");
objj_msgSend(_4d,"setDelegate:",_43);
objj_msgSend(_4d,"setInputManager:",_43);
objj_msgSend(_4d,"setSuperController:",_43);
objj_msgSend(_4d,"setDateType:",10);
objj_msgSend(_43,"addSubview:",_4b);
objj_msgSend(_43,"addSubview:",_4c);
objj_msgSend(_43,"addSubview:",_4d);
objj_msgSend(segments,"addObject:",_4b);
objj_msgSend(segments,"addObject:",_4c);
objj_msgSend(segments,"addObject:",_4d);
var _49=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(23,7,15,18));
objj_msgSend(_49,"setStringValue:",":");
objj_msgSend(_43,"addSubview:",_49);
}
}
objj_msgSend(_43,"updatePickerDisplay");
}
}),new objj_method(sel_getUid("minDate"),function(_4e,_4f){
with(_4e){
return _minDate;
}
}),new objj_method(sel_getUid("setMinDate:"),function(_50,_51,_52){
with(_50){
_minDate=objj_msgSend(_52,"copy");
if(objj_msgSend(_50,"_mutableDate")<objj_msgSend(_50,"minDate")){
objj_msgSend(_50,"setDate:",objj_msgSend(_50,"minDate"));
}
}
}),new objj_method(sel_getUid("maxDate"),function(_53,_54){
with(_53){
return _maxDate;
}
}),new objj_method(sel_getUid("setMaxDate:"),function(_55,_56,_57){
with(_55){
_maxDate=objj_msgSend(_57,"copy");
if(objj_msgSend(_55,"_mutableDate")<objj_msgSend(_55,"maxDate")){
objj_msgSend(_55,"setDate:",objj_msgSend(_55,"maxDate"));
}
}
}),new objj_method(sel_getUid("date"),function(_58,_59){
with(_58){
return objj_msgSend(_date,"copy");
}
}),new objj_method(sel_getUid("_mutableDate"),function(_5a,_5b){
with(_5a){
return _date;
}
}),new objj_method(sel_getUid("setDate:"),function(_5c,_5d,_5e){
with(_5c){
_date=objj_msgSend(_5e,"copy");
objj_msgSend(_5c,"updatePickerDisplay");
}
}),new objj_method(sel_getUid("updatePickerDisplay"),function(_5f,_60){
with(_5f){
for(var i=0;i<objj_msgSend(segments,"count");i++){
var _61=objj_msgSend(segments,"objectAtIndex:",i);
if(objj_msgSend(_61,"dateType")==1){
if(objj_msgSend(_5f,"_mutableDate")){
var _62=objj_msgSend(_5f,"_mutableDate").getMonth()+1;
}else{
var _62="--";
}
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"singleNumber:",_62));
}else{
if(objj_msgSend(_61,"dateType")==2){
if(objj_msgSend(_5f,"_mutableDate")){
var _62=objj_msgSend(_5f,"_mutableDate").getDate();
}else{
var _62="--";
}
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"doubleNumber:",_62));
}else{
if(objj_msgSend(_61,"dateType")==3){
if(objj_msgSend(_5f,"_mutableDate")){
var _62=objj_msgSend(_5f,"_mutableDate").getFullYear();
}else{
var _62="----";
}
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"quadNumber:",_62));
}else{
if(objj_msgSend(_61,"dateType")==8){
var _62=objj_msgSend(_5f,"_mutableDate").getMinutes();
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"doubleNumber:",_62));
}else{
if(objj_msgSend(_61,"dateType")==9){
var _62=objj_msgSend(_5f,"_mutableDate").getHours();
if(_62>12){
_62=_62-12;
}else{
if(objj_msgSend(_5f,"_mutableDate").getHours()==0){
_62=12;
}
}
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"singleNumber:",_62));
}else{
if(objj_msgSend(_61,"dateType")==10){
var _62=objj_msgSend(_5f,"_mutableDate").getHours();
if(_62>11){
_62="PM";
}else{
_62="AM";
}
objj_msgSend(_61,"setStringValue:",objj_msgSend(_61,"singleNumber:",_62));
}
}
}
}
}
}
}
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_63,_64){
with(_63){
if(!currentFocusedSegment){
objj_msgSend(_63,"setActiveDateSegment:",objj_msgSend(segments,"objectAtIndex:",0));
}
return YES;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_65,_66){
with(_65){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_67,_68){
with(_67){
objj_msgSend(_67,"setPrevActiveDateSegment:",objj_msgSend(_67,"activeDateSegment"));
objj_msgSend(_67,"setActiveDateSegment:",nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:","datePickerDidLoseFocusNotification",superController,nil);
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_69,_6a,_6b){
with(_69){
objj_msgSendSuper({receiver:_69,super_class:objj_getClass("DatePicker").super_class},"mouseDown:",_6b);
if(!currentFocusedSegment){
objj_msgSend(_69,"setActiveDateSegment:",objj_msgSend(segments,"objectAtIndex:",0));
objj_msgSend(objj_msgSend(_69,"window"),"makeFirstResponder:",_69);
}
}
}),new objj_method(sel_getUid("setFocused:"),function(_6c,_6d,val){
with(_6c){
if(focused===val){
return;
}
focused=val;
if(focused){
objj_msgSend(_theView,"setFrame:",CGRectMake(objj_msgSend(_theView,"frame").origin.x-4,objj_msgSend(_theView,"frame").origin.y-3,objj_msgSend(_theView,"frame").size.width+8,objj_msgSend(_theView,"frame").size.height+6));
objj_msgSend(_theView,"setBackgroundColor:",bezelFocused);
}else{
objj_msgSend(_theView,"setBackgroundColor:",bezel);
objj_msgSend(_theView,"setFrame:",CGRectMake(objj_msgSend(_theView,"frame").origin.x+4,objj_msgSend(_theView,"frame").origin.y+3,objj_msgSend(_theView,"frame").size.width-8,objj_msgSend(_theView,"frame").size.height-6));
}
}
}),new objj_method(sel_getUid("maxDays"),function(_6e,_6f){
with(_6e){
if(objj_msgSend(_6e,"_mutableDate").getFullYear()>=objj_msgSend(_6e,"maxYear")&&objj_msgSend(_6e,"_mutableDate").getMonth()>=objj_msgSend(_6e,"maxMonth")){
return objj_msgSend(_6e,"maxDate").getDate();
}
var _70=objj_msgSend(_6e,"_mutableDate").getMonth();
var _71=nil;
if(_70==0||_70==2||_70==4||_70==6||_70==7||_70==9||_70==11){
_71=31;
}else{
if(_70==1){
_71=28;
if(objj_msgSend(_6e,"isLeapYear")){
_71++;
}
}else{
if(_70==3||_70==5||_70==8||_70==10){
_71=30;
}else{
_71=0;
}
}
}
return _71;
}
}),new objj_method(sel_getUid("maxMonth"),function(_72,_73){
with(_72){
if(objj_msgSend(_72,"_mutableDate").getFullYear()>=objj_msgSend(_72,"maxYear")){
return objj_msgSend(_72,"maxDate").getMonth()+1;
}else{
return 12;
}
}
}),new objj_method(sel_getUid("maxYear"),function(_74,_75){
with(_74){
if(objj_msgSend(_74,"maxDate")){
return objj_msgSend(_74,"maxDate").getFullYear();
}else{
return 9999;
}
}
}),new objj_method(sel_getUid("minDays"),function(_76,_77){
with(_76){
if(objj_msgSend(_76,"_mutableDate").getFullYear()<=objj_msgSend(_76,"minYear")&&objj_msgSend(_76,"_mutableDate").getMonth()<=objj_msgSend(_76,"minMonth")){
return objj_msgSend(_76,"minDate").getDate();
}
var _78=1;
return _78;
}
}),new objj_method(sel_getUid("minMonth"),function(_79,_7a){
with(_79){
if(objj_msgSend(_79,"_mutableDate").getFullYear()<=objj_msgSend(_79,"minYear")){
return objj_msgSend(_79,"minDate").getMonth()+1;
}else{
return 1;
}
}
}),new objj_method(sel_getUid("minYear"),function(_7b,_7c){
with(_7b){
var _7d=objj_msgSend(_7b,"minDate").getFullYear();
if(objj_msgSend(_7b,"minDate")){
return objj_msgSend(_7b,"minDate").getFullYear();
}else{
return 1;
}
}
}),new objj_method(sel_getUid("maxHours"),function(_7e,_7f){
with(_7e){
return 12;
}
}),new objj_method(sel_getUid("maxMins"),function(_80,_81){
with(_80){
return 59;
}
}),new objj_method(sel_getUid("maxAMPM"),function(_82,_83){
with(_82){
return 1;
}
}),new objj_method(sel_getUid("minHours"),function(_84,_85){
with(_84){
return 1;
}
}),new objj_method(sel_getUid("minMins"),function(_86,_87){
with(_86){
return 0;
}
}),new objj_method(sel_getUid("minAMPM"),function(_88,_89){
with(_88){
return 0;
}
}),new objj_method(sel_getUid("isLeapYear"),function(_8a,_8b){
with(_8a){
var yr=objj_msgSend(_8a,"_mutableDate").getFullYear();
return !(yr%4)&&(yr%100)||!(yr%400)?true:false;
}
}),new objj_method(sel_getUid("setActiveDateSegment:"),function(_8c,_8d,_8e){
with(_8c){
if(activeDateSegment===_8e){
return;
}
if(objj_msgSend(_8c,"activeDateSegment")){
objj_msgSend(_8c,"setLastFocusedSegment:",activeDateSegment);
objj_msgSend(activeDateSegment,"makeInactive");
}
activeDateSegment=_8e;
if(activeDateSegment){
objj_msgSend(_8c,"setFocused:",YES);
objj_msgSend(activeDateSegment,"makeActive");
objj_msgSend(_8c,"setCurrentFocusedSegment:",activeDateSegment);
objj_msgSend(objj_msgSend(_8c,"window"),"makeFirstResponder:",_8c);
}else{
objj_msgSend(_8c,"setFocused:",NO);
objj_msgSend(_8c,"setCurrentFocusedSegment:",activeDateSegment);
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"interpretKeyEvents:",_91);
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_92,_93,_94){
with(_92){
var key=objj_msgSend(_94,"keyCode");
if(key==CPTabKeyCode){
if(objj_msgSend(_92,"activeDateSegment")==objj_msgSend(segments,"objectAtIndex:",objj_msgSend(objj_msgSend(superController,"segments"),"count")-1)){
objj_msgSend(objj_msgSend(_92,"window"),"selectNextKeyView:",_92);
return;
}else{
var i=objj_msgSend(segments,"indexOfObject:",objj_msgSend(_92,"activeDateSegment"));
i++;
i=objj_msgSend(segments,"objectAtIndex:",i);
}
objj_msgSend(_92,"setActiveDateSegment:",i);
}else{
if(key==CPRightArrowKeyCode||key==189||key==188||key==190||key==191||key==186){
if(objj_msgSend(_92,"activeDateSegment")==objj_msgSend(segments,"objectAtIndex:",objj_msgSend(segments,"count")-1)){
i=objj_msgSend(segments,"objectAtIndex:",0);
}else{
var i=objj_msgSend(segments,"indexOfObject:",objj_msgSend(_92,"activeDateSegment"));
i++;
i=objj_msgSend(segments,"objectAtIndex:",i);
}
objj_msgSend(_92,"setActiveDateSegment:",i);
}else{
if(key==CPLeftArrowKeyCode){
if(objj_msgSend(_92,"activeDateSegment")==objj_msgSend(segments,"objectAtIndex:",0)){
i=objj_msgSend(segments,"objectAtIndex:",objj_msgSend(segments,"count")-1);
}else{
var i=objj_msgSend(segments,"indexOfObject:",objj_msgSend(_92,"activeDateSegment"));
i--;
i=objj_msgSend(segments,"objectAtIndex:",i);
}
objj_msgSend(_92,"setActiveDateSegment:",i);
}else{
if(key==CPDeleteKeyCode&&objj_msgSend(activeDateSegment,"dateType")!==10){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"removeLastChar");
}else{
if(key==CPUpArrowKeyCode){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"increment");
}else{
if(key==CPDownArrowKeyCode){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"decrement");
}else{
if(key==48||key==96){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","0");
}else{
if(key==49||key==97){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","1");
}else{
if(key==50||key==98){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","2");
}else{
if(key==51||key==99){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","3");
}else{
if(key==52||key==100){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","4");
}else{
if(key==53||key==101){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","5");
}else{
if(key==54||key==102){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","6");
}else{
if(key==55||key==103){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","7");
}else{
if(key==56||key==104){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","8");
}else{
if(key==57||key==105){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","9");
}else{
if(key==65&&objj_msgSend(activeDateSegment,"dateType")==10){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","A");
}else{
if(key==80&&objj_msgSend(activeDateSegment,"dateType")==10){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_92,"updatePickerDisplay");
}
objj_msgSend(activeDateSegment,"sendNewInput:","P");
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}),new objj_method(sel_getUid("stepperAction:"),function(_95,_96,_97){
with(_95){
if(!_date){
_date=objj_msgSend(CPDate,"date");
objj_msgSend(_95,"updatePickerDisplay");
}
if(!activeDateSegment){
objj_msgSend(_95,"setActiveDateSegment:",(prevActiveDateSegment)?prevActiveDateSegment:objj_msgSend(segments,"objectAtIndex:",0));
}
var _98=objj_msgSend(_theStepper,"intValue");
if(objj_msgSend(activeDateSegment,"dateType")==1){
var _99=objj_msgSend(_95,"maxMonth");
var _9a=objj_msgSend(_95,"minMonth");
if(_98>_99){
_98=_9a;
}else{
if(_98<_9a){
_98=_99;
}
}
objj_msgSend(_95,"_mutableDate").setMonth(_98-1);
}else{
if(objj_msgSend(activeDateSegment,"dateType")==2){
var _99=objj_msgSend(_95,"maxDays");
var _9a=objj_msgSend(_95,"minDays");
if(_98>_99){
_98=_9a;
}else{
if(_98<_9a){
_98=_99;
}
}
objj_msgSend(superController,"_mutableDate").setDate(_98);
_98=objj_msgSend(activeDateSegment,"doubleNumber:",_98);
}else{
if(objj_msgSend(activeDateSegment,"dateType")==3){
var _99=objj_msgSend(_95,"maxYear");
var _9a=objj_msgSend(_95,"minYear");
if(_98>_99){
_98=_9a;
}else{
if(_98<_9a){
_98=_99;
}
}
objj_msgSend(superController,"_mutableDate").setFullYear(_98);
}else{
if(objj_msgSend(activeDateSegment,"dateType")==8){
var _99=objj_msgSend(_95,"maxMins");
var _9a=objj_msgSend(_95,"minMins");
if(_98>_99){
_98=_9a;
}else{
if(_98<_9a){
_98=_99;
}
}
objj_msgSend(superController,"_mutableDate").setMinutes(_98);
_98=objj_msgSend(activeDateSegment,"doubleNumber:",_98);
}else{
if(objj_msgSend(activeDateSegment,"dateType")==9){
var _99=objj_msgSend(_95,"maxHours");
var _9a=objj_msgSend(_95,"minHours");
if(_98>_99){
_98=_9a;
}else{
if(_98<_9a){
_98=_99;
}
}
var _9b=_98;
var _9c=objj_msgSend(segments,"objectAtIndex:",objj_msgSend(segments,"count")-1);
if(objj_msgSend(_9c,"stringValue")==="PM"&&_98!==12){
_98=_98+12;
}else{
if(objj_msgSend(_9c,"stringValue")==="AM"&&_98==12){
_98=0;
}
}
objj_msgSend(_95,"_mutableDate").setHours(_98);
_98=_9b;
}else{
if(objj_msgSend(activeDateSegment,"dateType")==10){
var _99=objj_msgSend(_95,"maxAMPM");
var _9a=objj_msgSend(_95,"minAMPM");
if(_98==_99||_98<_9a){
_98=_99;
var _9d="PM";
var _9e=objj_msgSend(_95,"_mutableDate").getHours();
if(_9e<12){
_9e=_9e+12;
}
}else{
if(_98==_9a||_98>_99){
_98=_9a;
var _9d="AM";
var _9e=objj_msgSend(_95,"_mutableDate").getHours();
if(_9e>11){
_9e=_9e-12;
}
}
}
objj_msgSend(_95,"_mutableDate").setHours(_9e);
objj_msgSend(activeDateSegment,"setStringValue:",_9d);
objj_msgSend(objj_msgSend(_95,"_theStepper"),"setIntValue:",_98);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:","datePickerDidChangeNotification",superController,nil);
return;
}
}
}
}
}
}
objj_msgSend(activeDateSegment,"setStringValue:",_98);
objj_msgSend(_theStepper,"setIntValue:",objj_msgSend(activeDateSegment,"stringValue"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:","datePickerDidChangeNotification",superController,nil);
}
})]);
var _1=objj_allocateClassPair(CPTextField,"DateSegment"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("inputManager"),new objj_ivar("superController"),new objj_ivar("dateType"),new objj_ivar("focusedBackground")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("inputManager"),function(_9f,_a0){
with(_9f){
return inputManager;
}
}),new objj_method(sel_getUid("setInputManager:"),function(_a1,_a2,_a3){
with(_a1){
inputManager=_a3;
}
}),new objj_method(sel_getUid("superController"),function(_a4,_a5){
with(_a4){
return superController;
}
}),new objj_method(sel_getUid("setSuperController:"),function(_a6,_a7,_a8){
with(_a6){
superController=_a8;
}
}),new objj_method(sel_getUid("dateType"),function(_a9,_aa){
with(_a9){
return dateType;
}
}),new objj_method(sel_getUid("setDateType:"),function(_ab,_ac,_ad){
with(_ab){
dateType=_ad;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_ae,_af,_b0){
with(_ae){
_ae=objj_msgSendSuper({receiver:_ae,super_class:objj_getClass("DateSegment").super_class},"initWithFrame:",_b0);
if(_ae){
focusedBackground=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","DatePicker/date-segment-left.png"),CGSizeMake(4,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","DatePicker/date-segment-center.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","DatePicker/date-segment-right.png"),CGSizeMake(4,18))],NO));
objj_msgSend(_ae,"setValue:forThemeAttribute:",CPRightTextAlignment,"alignment");
}
return _ae;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_b1,_b2,_b3){
with(_b1){
objj_msgSend(inputManager,"setActiveDateSegment:",_b1);
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setIntValue:",objj_msgSend(_b1,"stringValue"));
if(objj_msgSend(_b1,"dateType")==10&&objj_msgSend(_b1,"stringValue")==="AM"){
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setIntValue:",0);
}else{
if(objj_msgSend(_b1,"dateType")==10&&objj_msgSend(_b1,"stringValue")==="PM"){
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setIntValue:",1);
}
}
}
}),new objj_method(sel_getUid("setStringValue:"),function(_b4,_b5,_b6){
with(_b4){
objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("DateSegment").super_class},"setStringValue:",_b6);
if(objj_msgSend(inputManager,"activeDateSegment")===_b4){
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",objj_msgSend(_b4,"intValue"));
if(objj_msgSend(_b4,"dateType")==10&&objj_msgSend(_b4,"stringValue")=="PM"){
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",1);
}
}
}
}),new objj_method(sel_getUid("sendNewInput:"),function(_b7,_b8,_b9){
with(_b7){
var _ba=nil;
if(objj_msgSend(_b7,"dateType")==1){
_ba=objj_msgSend(_b7,"numMonthDateInput:",_b9);
objj_msgSend(superController,"_mutableDate").setMonth(_ba-1);
}else{
if(objj_msgSend(_b7,"dateType")==2){
_ba=objj_msgSend(_b7,"numDayDateInput:",_b9);
objj_msgSend(superController,"_mutableDate").setDate(_ba);
}else{
if(objj_msgSend(_b7,"dateType")==3){
_ba=objj_msgSend(_b7,"fullYearDateInput:",_b9);
objj_msgSend(superController,"_mutableDate").setFullYear(_ba);
}else{
if(objj_msgSend(_b7,"dateType")==8){
_ba=objj_msgSend(_b7,"fullMinutesInput:",_b9);
objj_msgSend(superController,"_mutableDate").setMinutes(_ba);
}else{
if(objj_msgSend(_b7,"dateType")==9){
_ba=objj_msgSend(_b7,"fullHoursInput:",_b9);
var _bb=objj_msgSend(objj_msgSend(superController,"segments"),"objectAtIndex:",objj_msgSend(objj_msgSend(superController,"segments"),"count")-1);
if(objj_msgSend(_bb,"stringValue")==="PM"&&_ba!==12){
var hrs=_ba+12;
}else{
if(objj_msgSend(_bb,"stringValue")==="AM"&&_ba==12){
var hrs=0;
}else{
hrs=_ba;
}
}
objj_msgSend(superController,"_mutableDate").setHours(hrs);
}else{
if(objj_msgSend(_b7,"dateType")==10){
_ba=objj_msgSend(_b7,"fullAMPMInput:",_b9);
var _bc=objj_msgSend(objj_msgSend(objj_msgSend(superController,"segments"),"objectAtIndex:",0),"intValue")-1;
if(_ba=="PM"){
_bc=_bc+12;
}
objj_msgSend(superController,"_mutableDate").setHours(_bc);
}
}
}
}
}
}
objj_msgSend(_b7,"setStringValue:",_ba);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:","datePickerDidChangeNotification",superController,nil);
}
}),new objj_method(sel_getUid("makeActive"),function(_bd,_be){
with(_bd){
objj_msgSend(_bd,"setBackgroundColor:",focusedBackground);
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",objj_msgSend(_bd,"intValue"));
}
}),new objj_method(sel_getUid("makeInactive"),function(_bf,_c0){
with(_bf){
objj_msgSend(_bf,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
if(objj_msgSend(_bf,"dateType")==10){
return;
}
var _c1=objj_msgSend(_bf,"stringValue");
if(_c1==0&&objj_msgSend(_bf,"dateType")!==8){
_c1=1;
}
if(objj_msgSend(_bf,"dateType")==1){
objj_msgSend(_bf,"setStringValue:",objj_msgSend(_bf,"singleNumber:",_c1));
}else{
if(objj_msgSend(_bf,"dateType")==2){
objj_msgSend(_bf,"setStringValue:",objj_msgSend(_bf,"doubleNumber:",_c1));
}else{
if(objj_msgSend(_bf,"dateType")==3){
objj_msgSend(_bf,"setStringValue:",objj_msgSend(_bf,"quadNumber:",_c1));
}else{
if(objj_msgSend(_bf,"dateType")==8){
objj_msgSend(_bf,"setStringValue:",objj_msgSend(_bf,"doubleNumber:",_c1));
}else{
if(objj_msgSend(_bf,"dateType")==9){
objj_msgSend(_bf,"setStringValue:",objj_msgSend(_bf,"singleNumber:",_c1));
}
}
}
}
}
}
}),new objj_method(sel_getUid("increment"),function(_c2,_c3){
with(_c2){
if(objj_msgSend(_c2,"dateType")==10){
if(objj_msgSend(_c2,"stringValue")=="AM"){
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",1);
}else{
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",0);
}
}else{
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",objj_msgSend(_c2,"intValue")+1);
}
objj_msgSend(objj_msgSend(superController,"_theStepper"),"sendAction:to:",sel_getUid("stepperAction:"),inputManager);
}
}),new objj_method(sel_getUid("decrement"),function(_c4,_c5){
with(_c4){
if(objj_msgSend(_c4,"dateType")==10){
if(objj_msgSend(_c4,"stringValue")=="AM"){
objj_msgSend(_c4,"setStringValue:","PM");
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",1);
}else{
objj_msgSend(_c4,"setStringValue:","AM");
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",0);
}
}else{
objj_msgSend(objj_msgSend(superController,"_theStepper"),"setDoubleValue:",objj_msgSend(_c4,"intValue")-1);
}
objj_msgSend(objj_msgSend(superController,"_theStepper"),"sendAction:to:",sel_getUid("stepperAction:"),inputManager);
}
}),new objj_method(sel_getUid("removeLastChar"),function(_c6,_c7){
with(_c6){
var _c8=objj_msgSend(_c6,"stringValue");
if(objj_msgSend(_c8,"length")>0){
var _c9=objj_msgSend(_c8,"stringByPaddingToLength:withString:startingAtIndex:",objj_msgSend(_c8,"length")-1,"",1);
objj_msgSend(_c6,"setStringValue:",_c9);
}
}
}),new objj_method(sel_getUid("description"),function(_ca,_cb){
with(_ca){
switch(objj_msgSend(_ca,"dateType")){
case 1:
return "number month field";
case 2:
return "number day field";
case 3:
return "full number year field";
case 4:
return "short name month field";
case 5:
return "short year field";
case 6:
return "day of week short";
case 7:
return "day of week long";
case 8:
return "minutes field";
case 9:
return "hours field";
case 10:
return "am-pm field";
case 11:
return "seconds field";
default:
return "date segment field";
}
}
})]);
var _1=objj_getClass("DateSegment");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"DateSegment\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("numMonthDateInput:"),function(_cc,_cd,_ce){
with(_cc){
var _cf=objj_msgSend(superController,"maxMonth");
var _d0=objj_msgSend(_cc,"stringValue");
var _d1=objj_msgSend(_ce,"characterAtIndex:",0);
if(objj_msgSend(objj_msgSend(_d0,"stringByAppendingString:",_d1),"intValue")>_cf){
var _d2=_d1;
}else{
if(objj_msgSend(objj_msgSend(_d0,"stringByAppendingString:",_d1),"intValue")<=_cf){
var _d2=objj_msgSend(_d0,"stringByAppendingString:",_d1);
}else{
var _d2=(objj_msgSend(_d1,"intValue"))?objj_msgSend(_d1,"intValue"):"";
}
}
return objj_msgSend(_d2,"intValue");
}
}),new objj_method(sel_getUid("numDayDateInput:"),function(_d3,_d4,_d5){
with(_d3){
var _d6=objj_msgSend(superController,"maxDays");
var _d7=objj_msgSend(_d3,"stringValue");
var _d8=objj_msgSend(_d5,"characterAtIndex:",0);
if(objj_msgSend(objj_msgSend(_d7,"stringByAppendingString:",_d8),"intValue")>_d6){
var _d9=_d8;
}else{
if(objj_msgSend(objj_msgSend(_d7,"stringByAppendingString:",_d8),"intValue")<=_d6){
var _d9=objj_msgSend(_d7,"stringByAppendingString:",_d8);
}else{
var _d9=(objj_msgSend(_d8,"intValue"))?objj_msgSend(_d8,"intValue"):"";
}
}
return objj_msgSend(_d9,"intValue");
}
}),new objj_method(sel_getUid("fullYearDateInput:"),function(_da,_db,_dc){
with(_da){
var _dd=objj_msgSend(superController,"maxYear");
var _de=objj_msgSend(_da,"stringValue");
var _df=objj_msgSend(_dc,"characterAtIndex:",0);
if(objj_msgSend(objj_msgSend(_de,"stringByAppendingString:",_df),"intValue")>_dd){
var _e0=_df;
}else{
if(objj_msgSend(objj_msgSend(_de,"stringByAppendingString:",_df),"intValue")<=_dd){
var _e0=objj_msgSend(_de,"stringByAppendingString:",_df);
}else{
var _e0=(objj_msgSend(_df,"intValue"))?objj_msgSend(_df,"intValue"):"";
}
}
return objj_msgSend(_e0,"intValue");
}
}),new objj_method(sel_getUid("fullMinutesInput:"),function(_e1,_e2,_e3){
with(_e1){
var _e4=objj_msgSend(superController,"maxMins");
var _e5=objj_msgSend(_e1,"stringValue");
var _e6=objj_msgSend(_e3,"characterAtIndex:",0);
if(objj_msgSend(objj_msgSend(_e5,"stringByAppendingString:",_e6),"intValue")>_e4){
var _e7=_e6;
}else{
if(objj_msgSend(objj_msgSend(_e5,"stringByAppendingString:",_e6),"intValue")<=_e4){
var _e7=objj_msgSend(_e5,"stringByAppendingString:",_e6);
}else{
var _e7=(objj_msgSend(_e6,"intValue"))?objj_msgSend(_e6,"intValue"):"";
}
}
return objj_msgSend(_e7,"intValue");
}
}),new objj_method(sel_getUid("fullHoursInput:"),function(_e8,_e9,_ea){
with(_e8){
var _eb=objj_msgSend(superController,"maxHours");
var _ec=objj_msgSend(_e8,"stringValue");
var _ed=objj_msgSend(_ea,"characterAtIndex:",0);
if(objj_msgSend(objj_msgSend(_ec,"stringByAppendingString:",_ed),"intValue")>_eb){
var _ee=_ed;
}else{
if(objj_msgSend(objj_msgSend(_ec,"stringByAppendingString:",_ed),"intValue")<=_eb){
var _ee=objj_msgSend(_ec,"stringByAppendingString:",_ed);
}else{
var _ee=(objj_msgSend(_ed,"intValue"))?objj_msgSend(_ed,"intValue"):"";
}
}
return objj_msgSend(_ee,"intValue");
}
}),new objj_method(sel_getUid("fullAMPMInput:"),function(_ef,_f0,_f1){
with(_ef){
var _f2=objj_msgSend(_ef,"stringValue");
var _f3=objj_msgSend(_f1,"characterAtIndex:",0);
if(_f3==="p"||_f3==="P"){
return "PM";
}else{
if(_f3==="a"||_f3==="A"){
return "AM";
}else{
return _f2;
}
}
}
}),new objj_method(sel_getUid("singleNumber:"),function(_f4,_f5,_f6){
with(_f4){
return _f6;
}
}),new objj_method(sel_getUid("doubleNumber:"),function(_f7,_f8,_f9){
with(_f7){
if(objj_msgSend(_f9,"class")===CPNumber){
var _fa=objj_msgSend(objj_msgSend(_f9,"stringValue"),"length");
}else{
var _fa=objj_msgSend(_f9,"length");
}
var _fb="0";
while(_fa<2){
var _f9=objj_msgSend(_fb,"stringByAppendingString:",_f9);
_fa++;
}
return _f9;
}
}),new objj_method(sel_getUid("quadNumber:"),function(_fc,_fd,_fe){
with(_fc){
if(objj_msgSend(_fe,"class")===CPNumber){
var _ff=objj_msgSend(objj_msgSend(_fe,"stringValue"),"length");
}else{
var _ff=objj_msgSend(_fe,"length");
}
var _100="0";
while(_ff<4){
var _fe=objj_msgSend(_100,"stringByAppendingString:",_fe);
_ff++;
}
return _fe;
}
})]);
var _1=objj_allocateClassPair(CPControl,"DatePickerInputManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("activeDateSegment"),new objj_ivar("superController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("activeDateSegment"),function(self,_101){
with(self){
return activeDateSegment;
}
}),new objj_method(sel_getUid("setActiveDateSegment:"),function(self,_102,_103){
with(self){
activeDateSegment=_103;
}
}),new objj_method(sel_getUid("superController"),function(self,_104){
with(self){
return superController;
}
}),new objj_method(sel_getUid("setSuperController:"),function(self,_105,_106){
with(self){
superController=_106;
}
}),new objj_method(sel_getUid("init"),function(self,_107){
with(self){
var _108=CGRectMake(0,0,0,0);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("DatePickerInputManager").super_class},"initWithFrame:",_108);
return self;
}
})]);
var _1=objj_getClass("DatePicker");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"DatePicker\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_109,_10a){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("DatePicker").super_class},"initWithCoder:",_10a);
if(self){
objj_msgSend(self,"setDelegate:",objj_msgSend(_10a,"decodeObjectForKey:",datePickerDelegate));
segments=objj_msgSend(_10a,"decodeObjectForKey:",datePickerSegments);
_theView=objj_msgSend(_10a,"decodeObjectForKey:",datePickerView);
_theStepper=objj_msgSend(_10a,"decodeObjectForKey:",datePickerStepper);
objj_msgSend(self,"setDate:",objj_msgSend(_10a,"decodeObjectForKey:",datePickerDate));
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_10b,_10c){
with(self){
objj_msgSend(_10c,"encodeObject:forKey:",_date,datePickerDate);
objj_msgSend(_10c,"encodeObject:forKey:",segments,datePickerSegments);
objj_msgSend(_10c,"encodeObject:forKey:",_delegate,dataPickerDelegate);
objj_msgSend(_10c,"encodeObject:forKey:",_theView,datePickerView);
objj_msgSend(_10c,"encodeObject:forKey:",_theStepper,datePickerStepper);
}
})]);
p;16;HelpController.jt;573;@STATIC;1.0;t;555;
var _1=objj_allocateClassPair(CPObject,"HelpController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("helpWindow"),new objj_ivar("webview")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("showHelp:"),function(_3,_4,_5){
with(_3){
if(!helpWindow){
helpWindow=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,465,450),CPClosableWindowMask);
objj_msgSend(helpWindow,"setTitle:","Iguana Help");
}
objj_msgSend(helpWindow,"center");
objj_msgSend(helpWindow,"orderFront:",nil);
}
})]);
p;6;Item.jt;6819;@STATIC;1.0;t;6800;
ItemAttachmentsDidChangeNotification="ItemAttachmentsDidChangeNotification";
var _1=objj_allocateClassPair(CPObject,"Item"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("make"),new objj_ivar("model"),new objj_ivar("notes"),new objj_ivar("serial"),new objj_ivar("dateAcquired"),new objj_ivar("price"),new objj_ivar("attachments"),new objj_ivar("tags"),new objj_ivar("extras")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("make"),function(_8,_9){
with(_8){
return make;
}
}),new objj_method(sel_getUid("setMake:"),function(_a,_b,_c){
with(_a){
make=_c;
}
}),new objj_method(sel_getUid("model"),function(_d,_e){
with(_d){
return model;
}
}),new objj_method(sel_getUid("setModel:"),function(_f,_10,_11){
with(_f){
model=_11;
}
}),new objj_method(sel_getUid("notes"),function(_12,_13){
with(_12){
return notes;
}
}),new objj_method(sel_getUid("setNotes:"),function(_14,_15,_16){
with(_14){
notes=_16;
}
}),new objj_method(sel_getUid("serial"),function(_17,_18){
with(_17){
return serial;
}
}),new objj_method(sel_getUid("setSerial:"),function(_19,_1a,_1b){
with(_19){
serial=_1b;
}
}),new objj_method(sel_getUid("dateAcquired"),function(_1c,_1d){
with(_1c){
return dateAcquired;
}
}),new objj_method(sel_getUid("setDateAcquired:"),function(_1e,_1f,_20){
with(_1e){
dateAcquired=_20;
}
}),new objj_method(sel_getUid("price"),function(_21,_22){
with(_21){
return price;
}
}),new objj_method(sel_getUid("setPrice:"),function(_23,_24,_25){
with(_23){
price=_25;
}
}),new objj_method(sel_getUid("attachments"),function(_26,_27){
with(_26){
return attachments;
}
}),new objj_method(sel_getUid("setAttachments:"),function(_28,_29,_2a){
with(_28){
attachments=_2a;
}
}),new objj_method(sel_getUid("tags"),function(_2b,_2c){
with(_2b){
return tags;
}
}),new objj_method(sel_getUid("setTags:"),function(_2d,_2e,_2f){
with(_2d){
tags=_2f;
}
}),new objj_method(sel_getUid("extras"),function(_30,_31){
with(_30){
return extras;
}
}),new objj_method(sel_getUid("setExtras:"),function(_32,_33,_34){
with(_32){
extras=_34;
}
}),new objj_method(sel_getUid("initWithName:"),function(_35,_36,_37){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("Item").super_class},"init");
if(_35){
name=_37;
make="Unknown";
model="";
notes="";
serial="";
dateAcquired=objj_msgSend(CPDate,"date");
attachments=[];
tags=[];
extras=objj_msgSend(CPDictionary,"dictionary");
}
return _35;
}
}),new objj_method(sel_getUid("addAttachment:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(attachments,"addObject:",_3a);
}
}),new objj_method(sel_getUid("removeAttachment:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(attachments,"removeObject:",_3d);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",ItemAttachmentsDidChangeNotification,_3b,nil);
saveAppData();
}
}),new objj_method(sel_getUid("setObject:forExtrasKey:"),function(_3e,_3f,_40,_41){
with(_3e){
objj_msgSend(extras,"setObject:forKey:",_40,_41);
}
}),new objj_method(sel_getUid("valueForExtrasWithKey:"),function(_42,_43,_44){
with(_42){
return objj_msgSend(extras,"objectValueForKey:",_44);
}
}),new objj_method(sel_getUid("isEqual:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_47,"class")===objj_msgSend(_45,"class")){
var one=(objj_msgSend(name,"isEqual:",objj_msgSend(_47,"name"))&&objj_msgSend(make,"isEqual:",objj_msgSend(_47,"make"))&&objj_msgSend(model,"isEqual:",objj_msgSend(_47,"model"))&&objj_msgSend(notes,"isEqual:",objj_msgSend(_47,"notes"))&&objj_msgSend(make,"isEqual:",objj_msgSend(_47,"make"))&&price===objj_msgSend(_47,"price")&&objj_msgSend(attachments,"isEqual:",objj_msgSend(_47,"attachments"))&&objj_msgSend(tags,"isEqual:",objj_msgSend(_47,"tags"))&&objj_msgSend(extras,"isEqual:",objj_msgSend(_47,"extras")));
if(one){
if(dateAcquired){
return objj_msgSend(dateAcquired,"isEqual:",objj_msgSend(_47,"dateAcquired"));
}else{
return YES;
}
}
}
return NO;
}
}),new objj_method(sel_getUid("copy"),function(_48,_49){
with(_48){
var _4a=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",name);
objj_msgSend(_4a,"setMake:",make);
objj_msgSend(_4a,"setModel:",model);
objj_msgSend(_4a,"setNotes:",notes);
objj_msgSend(_4a,"setDateAcquired:",objj_msgSend(dateAcquired,"copy"));
objj_msgSend(_4a,"setPrice:",price);
objj_msgSend(_4a,"setSerial:",serial);
objj_msgSend(_4a,"setAttachments:",objj_msgSend(attachments,"copy"));
objj_msgSend(_4a,"setTags:",objj_msgSend(tags,"copy"));
objj_msgSend(_4a,"setExtras:",objj_msgSend(extras,"copy"));
return _4a;
}
}),new objj_method(sel_getUid("toJSON"),function(_4b,_4c){
with(_4b){
var _4d={};
_4d.name=name;
_4d.attachments=attachments;
_4d.make=make;
_4d.model=model;
_4d.price=price;
_4d.serial=serial;
_4d.notes=notes;
_4d.dateAcquired=objj_msgSend(dateAcquired,"toJSON");
_4d.tags=tags;
_4d.extras=objj_msgSend(extras,"toJSON");
return _4d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_4e,_4f,_50){
with(_4e){
var _51=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",_50.name);
objj_msgSend(_51,"setMake:",_50.make);
objj_msgSend(_51,"setModel:",_50.model);
objj_msgSend(_51,"setPrice:",_50.price);
objj_msgSend(_51,"setNotes:",_50.notes);
objj_msgSend(_51,"setSerial:",_50.serial);
objj_msgSend(_51,"setDateAcquired:",objj_msgSend(CPDate,"decodeJSON:",_50.dateAcquired));
if(_50.tags){
objj_msgSend(_51,"setTags:",_50.tags);
}else{
objj_msgSend(_51,"setTags:",[]);
}
if(_50.attachments){
var _52=[];
for(var i=0;i<_50.attachments.length;i++){
var _53=objj_msgSend(ItemAttachment,"decodeJSON:",_50.attachments[i]);
_52.push(_53);
}
objj_msgSend(_51,"setAttachments:",_52);
}else{
objj_msgSend(_51,"setAttachments:",[]);
}
objj_msgSend(_51,"setExtras:",objj_msgSend(CPDictionary,"dictionaryWithJSObject:",_50.extras));
return _51;
}
})]);
var _1=objj_getClass("CPDate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_54,_55){
with(_54){
return _54.getTime();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_56,_57,_58){
with(_56){
_56=objj_msgSend(CPDate,"date");
_56.setTime(_58);
return _56;
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_59,_5a){
with(_59){
var _5b={},_5c=objj_msgSend(_59,"allKeys"),_5d=objj_msgSend(_59,"allValues");
for(var i=0;i<objj_msgSend(_5c,"count");i++){
_5b[_5c[i]]=_5d[i];
}
return _5b;
}
})]);
p;16;ItemAttachment.jt;4521;@STATIC;1.0;t;4502;
var _1=objj_allocateClassPair(CPObject,"ItemAttachment"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("type"),new objj_ivar("displaySize"),new objj_ivar("data"),new objj_ivar("globalID"),new objj_ivar("uploadManager"),new objj_ivar("representedView"),new objj_ivar("errorString")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("type"),function(_8,_9){
with(_8){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_a,_b,_c){
with(_a){
type=_c;
}
}),new objj_method(sel_getUid("displaySize"),function(_d,_e){
with(_d){
return displaySize;
}
}),new objj_method(sel_getUid("setDisplaySize:"),function(_f,_10,_11){
with(_f){
displaySize=_11;
}
}),new objj_method(sel_getUid("data"),function(_12,_13){
with(_12){
return data;
}
}),new objj_method(sel_getUid("setData:"),function(_14,_15,_16){
with(_14){
data=_16;
}
}),new objj_method(sel_getUid("globalID"),function(_17,_18){
with(_17){
return globalID;
}
}),new objj_method(sel_getUid("setGlobalID:"),function(_19,_1a,_1b){
with(_19){
globalID=_1b;
}
}),new objj_method(sel_getUid("uploadManager"),function(_1c,_1d){
with(_1c){
return uploadManager;
}
}),new objj_method(sel_getUid("setUploadManager:"),function(_1e,_1f,_20){
with(_1e){
uploadManager=_20;
}
}),new objj_method(sel_getUid("representedView"),function(_21,_22){
with(_21){
return representedView;
}
}),new objj_method(sel_getUid("setRepresentedView:"),function(_23,_24,_25){
with(_23){
representedView=_25;
}
}),new objj_method(sel_getUid("init"),function(_26,_27){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("ItemAttachment").super_class},"init");
if(_26){
name="";
type="";
displaySize=CGSizeMakeZero();
data="";
globalID=objj_msgSend(CPString,"UUID");
isUploading=NO;
}
return _26;
}
}),new objj_method(sel_getUid("type"),function(_28,_29){
with(_28){
if(type){
return type;
}
if(objj_msgSend(data,"substringWithRange:",CPMakeRange(0,10))==="data:image"){
type="image";
saveAppData();
return "image";
}
return "other";
}
}),new objj_method(sel_getUid("fileUploadDidEnd:withResponse:"),function(_2a,_2b,_2c,_2d){
with(_2a){
try{
var _2d=JSON.parse(_2d);
if(_2d.error){
var _2e=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_2e,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_2e,"setTitle:",_2d.error);
objj_msgSend(_2e,"setDelegate:",_2a);
objj_msgSend(_2e,"setMessageText:",_2d.error);
objj_msgSend(_2e,"setInformativeText:",_2d.errorMessage+" Please try again or report it.");
objj_msgSend(_2e,"addButtonWithTitle:","Okay");
objj_msgSend(_2e,"addButtonWithTitle:","Report");
errorString=_2d.error+": "+_2d.error;
}
}
catch(e){
var _2e=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_2e,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_2e,"setTitle:","Server Error");
objj_msgSend(_2e,"setDelegate:",_2a);
objj_msgSend(_2e,"setMessageText:","Server Error");
objj_msgSend(_2e,"setInformativeText:","There was an unknown error while uploading your attachment, please try again or report it.");
objj_msgSend(_2e,"addButtonWithTitle:","Okay");
objj_msgSend(_2e,"addButtonWithTitle:","Report");
errorString=e+": "+_2d;
}
objj_msgSend(_2a,"setName:",_2c.name);
objj_msgSend(_2a,"setData:",_2d.data);
objj_msgSend(_2a,"setType:","image");
objj_msgSend(representedView,"setRepresentedObject:",_2a);
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_2f,_30,_31,_32){
with(_2f){
if(_32===1){
alert("let the user send a report or something dude...");
}
}
}),new objj_method(sel_getUid("fileUploadManagerDidChange:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"fileUploads")[0];
objj_msgSend(representedView,"setProgress:",objj_msgSend(_36,"progress"));
}
}),new objj_method(sel_getUid("toJSON"),function(_37,_38){
with(_37){
var _39={};
_39.name=name;
_39.displaySize=displaySize;
_39.globalID=globalID;
_39.data=data;
_39.type=type;
return _39;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(objj_msgSend(ItemAttachment,"alloc"),"init");
objj_msgSend(_3d,"setName:",_3c.name);
objj_msgSend(_3d,"setDisplaySize:",_3c.displaySize);
objj_msgSend(_3d,"setGlobalID:",_3c.globalID);
objj_msgSend(_3d,"setData:",_3c.data);
objj_msgSend(_3d,"setType:",_3c.type);
return _3d;
}
})]);
p;23;ItemAttachmentManager.jt;130;@STATIC;1.0;t;112;
var _1;
var _2=objj_allocateClassPair(CPObject,"ItemAttachmentManager"),_3=_2.isa;
objj_registerClassPair(_2);
p;16;ItemController.jt;3470;@STATIC;1.0;t;3451;
var _1=objj_allocateClassPair(CPObject,"ItemController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("locationController"),new objj_ivar("activeItem"),new objj_ivar("itemView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("activeItem"),function(_3,_4){
with(_3){
return activeItem;
}
}),new objj_method(sel_getUid("setActiveItem:"),function(_5,_6,_7){
with(_5){
activeItem=_7;
}
}),new objj_method(sel_getUid("initWithItemView:locationController:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("ItemController").super_class},"init");
if(_8){
itemView=_a;
objj_msgSend(itemView,"setItemController:",_8);
locationController=_b;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("refreshItem:"),ItemAttachmentsDidChangeNotification,nil);
}
return _8;
}
}),new objj_method(sel_getUid("refreshItem:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_e,"object");
if(_f===activeItem){
objj_msgSend(itemView.attachmentsCollectionView,"reloadContent");
objj_msgSend(locationController,"refreshItemData");
}
}
}),new objj_method(sel_getUid("setItem:"),function(_10,_11,_12){
with(_10){
activeItem=_12;
objj_msgSend(itemView,"setItem:",activeItem);
}
}),new objj_method(sel_getUid("saveIfNeeded"),function(_13,_14){
with(_13){
if(objj_msgSend(itemView,"isEditing")){
objj_msgSend(_13,"itemDidEndEditing:",objj_msgSend(itemView,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("itemDidEndEditing:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(activeItem,"copy");
objj_msgSend(activeItem,"setName:",objj_msgSend(_17,"name"));
objj_msgSend(activeItem,"setMake:",objj_msgSend(_17,"make"));
objj_msgSend(activeItem,"setModel:",objj_msgSend(_17,"model"));
objj_msgSend(activeItem,"setPrice:",objj_msgSend(_17,"price"));
objj_msgSend(activeItem,"setNotes:",objj_msgSend(_17,"notes"));
objj_msgSend(activeItem,"setDateAcquired:",objj_msgSend(_17,"dateAcquired"));
objj_msgSend(activeItem,"setTags:",objj_msgSend(_17,"tags"));
objj_msgSend(activeItem,"setExtras:",objj_msgSend(_17,"extras"));
objj_msgSend(locationController,"refreshItemData");
var _19=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[activeItem,_18],["oldItem","newItem"]);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",objj_msgSend(locationController,"location"),sel_getUid("replaceItemWithItem:"),_19);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(_1a,_1b,_1c,_1d){
with(_1a){
}
}),new objj_method(sel_getUid("newUploadManager:"),function(_1e,_1f,_20){
with(_1e){
var _21=objj_msgSend(objj_msgSend(ItemAttachment,"alloc"),"init"),_22=objj_msgSend(objj_msgSend(DCFileUploadManager,"alloc"),"init");
objj_msgSend(_21,"setName:","Uploading...");
objj_msgSend(_21,"setUploadManager:",_22);
objj_msgSend(_22,"setDelegate:",_21);
var _23=objj_msgSend(activeItem,"attachments");
objj_msgSend(_23,"addObject:",_21);
objj_msgSend(itemView.attachmentsCollectionView,"reloadContent");
return _22;
}
}),new objj_method(sel_getUid("managerDidUpload:"),function(_24,_25,_26){
with(_24){
objj_msgSend(locationController,"refreshItemData");
}
}),new objj_method(sel_getUid("addAttachment:"),function(_27,_28,_29){
with(_27){
objj_msgSend(activeItem,"addAttachment:",_29);
objj_msgSend(locationController,"refreshItemData");
}
})]);
p;10;ItemView.jt;54594;@STATIC;1.0;t;54574;
var _1=objj_allocateClassPair(CPView,"ItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("MINHEIGHT"),new objj_ivar("locationController"),new objj_ivar("itemController"),new objj_ivar("isEditing"),new objj_ivar("itemContentView"),new objj_ivar("scrollView"),new objj_ivar("mainItemImage"),new objj_ivar("nameField"),new objj_ivar("makeField"),new objj_ivar("modelField"),new objj_ivar("priceField"),new objj_ivar("serialField"),new objj_ivar("dateAcquiredField"),new objj_ivar("clearDateButton"),new objj_ivar("dateAcquiredTextField"),new objj_ivar("tagsField"),new objj_ivar("tagsUnedited"),new objj_ivar("notesLabel"),new objj_ivar("tagsArray"),new objj_ivar("notesField"),new objj_ivar("extrasLabels"),new objj_ivar("extrasFields"),new objj_ivar("removeExtraFieldButtons"),new objj_ivar("addExtraFieldButton"),new objj_ivar("_completionMenu"),new objj_ivar("noItemView"),new objj_ivar("newFieldPrompt"),new objj_ivar("createNewFieldButton"),new objj_ivar("attachmentsScrollView"),new objj_ivar("attachmentsCollectionView"),new objj_ivar("mainImageUpload")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("locationController"),function(_3,_4){
with(_3){
return locationController;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_5,_6,_7){
with(_5){
locationController=_7;
}
}),new objj_method(sel_getUid("itemController"),function(_8,_9){
with(_8){
return itemController;
}
}),new objj_method(sel_getUid("setItemController:"),function(_a,_b,_c){
with(_a){
itemController=_c;
}
}),new objj_method(sel_getUid("isEditing"),function(_d,_e){
with(_d){
return isEditing;
}
}),new objj_method(sel_getUid("setIsEditing:"),function(_f,_10,_11){
with(_f){
isEditing=_11;
}
}),new objj_method(sel_getUid("nameField"),function(_12,_13){
with(_12){
return nameField;
}
}),new objj_method(sel_getUid("setNameField:"),function(_14,_15,_16){
with(_14){
nameField=_16;
}
}),new objj_method(sel_getUid("mainImageUpload"),function(_17,_18){
with(_17){
return mainImageUpload;
}
}),new objj_method(sel_getUid("setMainImageUpload:"),function(_19,_1a,_1b){
with(_19){
mainImageUpload=_1b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("ItemView").super_class},"initWithFrame:",_1e);
if(_1c){
MINHEIGHT=_1e.size.height-100;
objj_msgSend(_1c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
tagsArray=[];
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width,_1e.size.height-90));
itemContentView=objj_msgSend(objj_msgSend(ItemContentView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width-20,_1e.size.height-100));
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(scrollView,"setDocumentView:",itemContentView);
objj_msgSend(_1c,"addSubview:",scrollView);
objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"setDelegate:",itemController);
mainItemImage=objj_msgSend(objj_msgSend(MainItemView,"alloc"),"initWithFrame:",CGRectMake(_1e.size.width-160,10,145,145));
objj_msgSend(mainItemImage,"setController:",_1c);
objj_msgSend(itemContentView,"addSubview:",mainItemImage);
var _1f=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,24,65,28));
objj_msgSend(_1f,"setStringValue:","Name: ");
objj_msgSend(_1f,"sizeToFit");
objj_msgSend(itemContentView,"addSubview:",_1f);
nameField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(nameField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_1f,"frame"))+5,15,275,35));
objj_msgSend(nameField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",24));
objj_msgSend(itemContentView,"addSubview:",nameField);
var _20=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,64,65,28));
objj_msgSend(_20,"setStringValue:","Make: ");
objj_msgSend(_20,"sizeToFit");
objj_msgSend(itemContentView,"addSubview:",_20);
makeField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(makeField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_1f,"frame"))+5,60,275,28));
objj_msgSend(makeField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(nameField,"setNextKeyView:",makeField);
objj_msgSend(nameField,"setNextResponder:",makeField);
objj_msgSend(itemContentView,"addSubview:",makeField);
var _21=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,124,100,28));
objj_msgSend(_21,"setStringValue:","Model: ");
objj_msgSend(itemContentView,"addSubview:",_21);
modelField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(modelField,"setFrame:",CGRectMake(115,120,275,28));
objj_msgSend(modelField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",modelField);
var _22=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,154,100,28));
objj_msgSend(_22,"setStringValue:","Price: ");
objj_msgSend(itemContentView,"addSubview:",_22);
priceField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(priceField,"setFrame:",CGRectMake(115,150,275,28));
objj_msgSend(priceField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",priceField);
var _23=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,184,100,28));
objj_msgSend(_23,"setStringValue:","Serial Number: ");
objj_msgSend(itemContentView,"addSubview:",_23);
serialField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(serialField,"setFrame:",CGRectMake(115,180,275,28));
objj_msgSend(serialField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",serialField);
var _24=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,214,100,28));
objj_msgSend(_24,"setStringValue:","Date Acquired: ");
objj_msgSend(itemContentView,"addSubview:",_24);
dateAcquiredField=objj_msgSend(objj_msgSend(DatePicker,"alloc"),"initWithFrame:",CGRectMake(115,210,215,28));
objj_msgSend(dateAcquiredField,"displayPreset:",1);
clearDateButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(340,213,50,24));
objj_msgSend(clearDateButton,"setTitle:","Clear");
objj_msgSend(clearDateButton,"setTarget:",_1c);
objj_msgSend(clearDateButton,"setAction:",sel_getUid("clearDate:"));
dateAcquiredTextField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(115,214,275,28));
objj_msgSend(itemContentView,"addSubview:",dateAcquiredTextField);
var _25=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,244,100,28));
objj_msgSend(_25,"setStringValue:","Tags: ");
objj_msgSend(itemContentView,"addSubview:",_25);
tagsField=objj_msgSend(objj_msgSend(NATokenTextView,"alloc"),"initWithFrame:",CGRectMake(115,240,275,28));
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",CGInsetMake(-1,10,0,10),"content-inset",CPThemeStateNormal);
var _26=objj_msgSend(CPBundle,"mainBundle"),_27=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-8.png"),CGSizeMake(11,9))])),_28=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-8.png"),CGSizeMake(11,9))]));
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",_27,"bezel-color",CPThemeStateBezeled);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",_28,"bezel-color",CPThemeStateBezeled|CPThemeStateEditing);
objj_msgSend(tagsField,"setDelegate:",_1c);
tagsUnedited=objj_msgSend(objj_msgSend(AutoExpandingTextField,"alloc"),"initWithFrame:",CGRectMake(115,240,275,28));
objj_msgSend(tagsUnedited,"setValue:forThemeAttribute:",CGInsetMake(7,10,2,10),"content-inset");
objj_msgSend(tagsUnedited,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(itemContentView,"addSubview:",tagsUnedited);
notesLabel=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,274,100,28));
objj_msgSend(notesLabel,"setStringValue:","Notes: ");
objj_msgSend(itemContentView,"addSubview:",notesLabel);
notesField=objj_msgSend(objj_msgSend(AutoExpandingTextField,"alloc"),"init");
objj_msgSend(notesField,"setFrame:",CGRectMake(115,270,275,50));
objj_msgSend(notesField,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(notesField,"setEditable:",NO);
objj_msgSend(notesField,"setBezeled:",NO);
objj_msgSend(notesField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(notesField,"setDelegate:",_1c);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",CGInsetMake(5,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",_27,"bezel-color",CPThemeStateBezeled);
objj_msgSend(itemContentView,"addSubview:",notesField);
extrasLabels=objj_msgSend(CPDictionary,"dictionary");
extrasFields=objj_msgSend(CPDictionary,"dictionary");
removeExtraFieldButtons=objj_msgSend(CPDictionary,"dictionary");
addExtraFieldButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(17,216,12,12));
objj_msgSend(addExtraFieldButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","AddButton.png"),CGSizeMake(12,12)));
objj_msgSend(addExtraFieldButton,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","AddButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(addExtraFieldButton,"setBordered:",NO);
objj_msgSend(addExtraFieldButton,"setTarget:",_1c);
objj_msgSend(addExtraFieldButton,"setAction:",sel_getUid("promptAddExtraField:"));
attachmentsScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,_1e.size.height-90,_1e.size.width,90));
objj_msgSend(attachmentsScrollView,"setHasVerticalScroller:",NO);
objj_msgSend(attachmentsScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(attachmentsScrollView,"setVerticalLineScroll:",0.0001);
objj_msgSend(attachmentsScrollView,"setHorizontalScroller:",objj_msgSend(LocationController,"customHorizontalScroller"));
attachmentsCollectionView=objj_msgSend(objj_msgSend(DropUploadCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width,90));
var _29=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_29,"setView:",objj_msgSend(AttachmentCell,"new"));
objj_msgSend(attachmentsCollectionView,"setMinItemSize:",CGSizeMake(80,85));
objj_msgSend(attachmentsCollectionView,"setMaxItemSize:",CGSizeMake(80,85));
objj_msgSend(attachmentsCollectionView,"setVerticalMargin:",5);
objj_msgSend(attachmentsCollectionView,"setDelegate:",_1c);
objj_msgSend(attachmentsCollectionView,"setItemPrototype:",_29);
objj_msgSend(attachmentsCollectionView,"setMaxNumberOfRows:",1);
window.setTimeout(function(){
var _2a=objj_msgSend(objj_msgSend(DCFileDropController,"alloc"),"initWithView:dropDelegate:uploadURL:uploadManager:",attachmentsCollectionView,itemController,objj_msgSend(CPURL,"URLWithString:","http://timetableapp.com/TestingEnviro/Iguana/upload.php"),objj_msgSend(DCFileUploadManager,"sharedManager"));
objj_msgSend(_2a,"setValidFileTypes:",["png","gif","jpg","pdf"]);
},0);
objj_msgSend(attachmentsScrollView,"setDocumentView:",attachmentsCollectionView);
var _2b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1e.size.height-90,_1e.size.width,11));
objj_msgSend(_2b,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","Attachments/CollectionShadow.png"),CGSizeMake(52,11))));
objj_msgSend(_2b,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_1c,"addSubview:",attachmentsScrollView);
objj_msgSend(_1c,"addSubview:",_2b);
noItemView=nil;
objj_msgSend(_1c,"setItem:",nil);
}
return _1c;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_2c,_2d,_2e){
with(_2c){
locationController=_2e;
objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"setDelegate:",itemController);
}
}),new objj_method(sel_getUid("setWidth:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(itemContentView,"frame").size.height;
objj_msgSend(itemContentView,"setFrameSize:",CGSizeMake(_31,_32));
}
}),new objj_method(sel_getUid("setupEditViewsWithItem:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"extras"),_37=objj_msgSend(_36,"allKeys"),y=CGRectGetMaxY(objj_msgSend(notesField,"frame"))+3,i=0;
for(;i<objj_msgSend(_37,"count");i++){
var key=_37[i],_38=objj_msgSend(_36,"valueForKey:",key);
var _39=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,y+4,100,28));
objj_msgSend(_39,"setStringValue:",key+": ");
objj_msgSend(extrasLabels,"setValue:forKey:",_39,key);
objj_msgSend(itemContentView,"addSubview:",_39);
var _3a=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(_3a,"setFrame:",CGRectMake(115,y,275,28));
objj_msgSend(_3a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_3a,"setStringValue:",_38);
objj_msgSend(extrasFields,"setValue:forKey:",_3a,key);
objj_msgSend(itemContentView,"addSubview:",_3a);
var _3b=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(3,y+4,12,12)),_3c=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_3b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","MinusButton.png"),CGSizeMake(12,12)));
objj_msgSend(_3b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","MinusButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(_3b,"setBordered:",NO);
objj_msgSend(_3b,"setTarget:",_33);
objj_msgSend(_3b,"setAction:",sel_getUid("removeField:"));
objj_msgSend(_3b,"setTag:",key);
objj_msgSend(removeExtraFieldButtons,"setValue:forKey:",_3b,key);
y+=30;
}
}
}),new objj_method(sel_getUid("moveExtrasIntoPlace"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(extrasLabels,"allKeys"),y=CGRectGetMaxY(objj_msgSend(notesField,"frame"))+3,i=0;
for(;i<objj_msgSend(_3f,"count");i++){
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(extrasLabels,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(15,y+4));
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(extrasFields,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(115,y));
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(removeExtraFieldButtons,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(3,y+7));
y+=30;
}
objj_msgSend(addExtraFieldButton,"setFrameOrigin:",CGPointMake(3,y));
var _40=objj_msgSend(itemContentView,"bounds").size;
objj_msgSend(itemContentView,"setFrameSize:",CGSizeMake(_40.width,MAX(MINHEIGHT,y+30)));
}
}),new objj_method(sel_getUid("setExtrasToEdit:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(extrasFields,"allKeys");
i=0;
for(;i<objj_msgSend(_44,"count");i++){
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_44[i]),"setEditable:",_43);
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_44[i]),"setBezeled:",_43);
if(_43){
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(removeExtraFieldButtons,"valueForKey:",_44[i]));
}else{
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_44[i]),"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("removeAllExtras"),function(_45,_46){
with(_45){
var _47=objj_msgSend(extrasLabels,"allKeys"),i=0;
for(;i<objj_msgSend(_47,"count");i++){
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",_47[i]),"removeFromSuperview");
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_47[i]),"removeFromSuperview");
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_47[i]),"removeFromSuperview");
}
objj_msgSend(extrasLabels,"removeAllObjects");
objj_msgSend(extrasFields,"removeAllObjects");
objj_msgSend(removeExtraFieldButtons,"removeAllObjects");
}
}),new objj_method(sel_getUid("promptAddExtraField:"),function(_48,_49,_4a){
with(_48){
var _4b=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,300,120),CPDocModalWindowMask),_4c=objj_msgSend(_4b,"contentView"),_4d=objj_msgSend(CPTextField,"labelWithTitle:","Add Item Field: ");
objj_msgSend(_4d,"setFrame:",CGRectMake(15,10,200,25));
objj_msgSend(_4d,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_4d,"sizeToFit");
objj_msgSend(_4c,"addSubview:",_4d);
createNewFieldButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(183,80,100,24));
newFieldPrompt=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,CGRectGetMaxY(objj_msgSend(_4d,"frame"))+5,270,28));
objj_msgSend(newFieldPrompt,"setEditable:",YES);
objj_msgSend(newFieldPrompt,"setBezeled:",YES);
objj_msgSend(newFieldPrompt,"setTarget:",createNewFieldButton);
objj_msgSend(newFieldPrompt,"setAction:",sel_getUid("performClick:"));
objj_msgSend(newFieldPrompt,"setDelegate:",_48);
objj_msgSend(_4c,"addSubview:",newFieldPrompt);
objj_msgSend(createNewFieldButton,"setTitle:","Create");
objj_msgSend(createNewFieldButton,"setTag:",0);
objj_msgSend(createNewFieldButton,"setTarget:",_48);
objj_msgSend(createNewFieldButton,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(createNewFieldButton,"setEnabled:",NO);
objj_msgSend(_4c,"addSubview:",createNewFieldButton);
objj_msgSend(_4b,"setDefaultButton:",createNewFieldButton);
var _4e=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(73,80,100,24));
objj_msgSend(_4e,"setTag:",-1);
objj_msgSend(_4e,"setTitle:","Cancel");
objj_msgSend(_4e,"setTarget:",_48);
objj_msgSend(_4e,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_4c,"addSubview:",_4e);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_4b,objj_msgSend(_48,"window"),_48,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
objj_msgSend(_4b,"makeFirstResponder:",newFieldPrompt);
}
}),new objj_method(sel_getUid("removeField:"),function(_4f,_50,_51){
with(_4f){
var key=objj_msgSend(_51,"tag");
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(extrasLabels,"removeObjectForKey:",key);
objj_msgSend(extrasFields,"removeObjectForKey:",key);
objj_msgSend(removeExtraFieldButtons,"removeObjectForKey:",key);
objj_msgSend(_4f,"moveExtrasIntoPlace");
}
}),new objj_method(sel_getUid("setItem:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"removeAllExtras");
if(!_54){
if(!noItemView){
noItemView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_52,"bounds"));
objj_msgSend(noItemView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
objj_msgSend(noItemView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
var _55=objj_msgSend(CPTextField,"new");
objj_msgSend(_55,"setStringValue:","No Item Selected");
objj_msgSend(_55,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",22));
objj_msgSend(_55,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","727272"));
objj_msgSend(_55,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_55,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(_55,"sizeToFit");
objj_msgSend(_55,"setCenter:",CGPointMake(CGRectGetMidX(objj_msgSend(_52,"bounds")),CGRectGetMidY(objj_msgSend(_52,"bounds"))-50));
objj_msgSend(_55,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxXMargin|CPViewMaxYMargin);
objj_msgSend(noItemView,"addSubview:",_55);
}
var _56=objj_msgSend(locationController,"locationView");
objj_msgSend(objj_msgSend(_56,"editButton"),"setHidden:",YES);
objj_msgSend(objj_msgSend(_56,"deleteButton"),"setHidden:",YES);
objj_msgSend(objj_msgSend(_56,"uploadButton"),"setHidden:",YES);
objj_msgSend(_52,"addSubview:",noItemView);
return;
}
var _56=objj_msgSend(locationController,"locationView");
objj_msgSend(objj_msgSend(_56,"editButton"),"setHidden:",NO);
objj_msgSend(objj_msgSend(_56,"deleteButton"),"setHidden:",NO);
objj_msgSend(objj_msgSend(_56,"uploadButton"),"setHidden:",NO);
objj_msgSend(noItemView,"removeFromSuperview");
objj_msgSend(nameField,"setStringValue:",objj_msgSend(_54,"name"));
objj_msgSend(makeField,"setStringValue:",objj_msgSend(_54,"make"));
objj_msgSend(modelField,"setStringValue:",objj_msgSend(_54,"model"));
objj_msgSend(priceField,"setStringValue:",objj_msgSend(_54,"price"));
objj_msgSend(serialField,"setStringValue:",objj_msgSend(_54,"serial"));
objj_msgSend(dateAcquiredField,"setDate:",objj_msgSend(objj_msgSend(_54,"dateAcquired"),"copy"));
objj_msgSend(dateAcquiredTextField,"setStringValue:",objj_msgSend(objj_msgSend(_54,"dateAcquired"),"longStringDate"));
objj_msgSend(tagsField,"setTokens:",objj_msgSend(_54,"tags"));
objj_msgSend(tagsUnedited,"setStringValue:",objj_msgSend(objj_msgSend(_54,"tags"),"componentsJoinedByString:",", "));
objj_msgSend(notesField,"setStringValue:",objj_msgSend(_54,"notes"));
objj_msgSend(attachmentsCollectionView,"setContent:",objj_msgSend(_54,"attachments"));
window.setTimeout(function(){
objj_msgSend(tagsUnedited,"sizeToFit");
if(objj_msgSend(tagsUnedited,"frame").size.height<28){
objj_msgSend(tagsUnedited,"setFrameSize:",CGSizeMake(objj_msgSend(tagsUnedited,"frame").size.width,28));
}
objj_msgSend(notesField,"sizeToFit");
if(CGRectGetHeight(objj_msgSend(notesField,"frame"))<50){
objj_msgSend(notesField,"setFrameSize:",CGSizeMake(objj_msgSend(notesField,"frame").size.width,50));
}
objj_msgSend(_52,"setupEditViewsWithItem:",_54);
objj_msgSend(_52,"moveExtrasIntoPlace");
objj_msgSend(_52,"setExtrasToEdit:",isEditing);
},0);
}
}),new objj_method(sel_getUid("extrasForEditingItem"),function(_57,_58){
with(_57){
var _59=objj_msgSend(CPDictionary,"dictionary"),_5a=objj_msgSend(extrasFields,"allKeys"),_5b=objj_msgSend(extrasFields,"allValues"),i=0;
for(;i<objj_msgSend(_5a,"count");i++){
objj_msgSend(_59,"setValue:forKey:",objj_msgSend(_5b[i],"stringValue"),_5a[i]);
}
return _59;
}
}),new objj_method(sel_getUid("toggleEditMode:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5c,"enterEditMode:",!isEditing);
if(!isEditing){
objj_msgSend(itemController,"itemDidEndEditing:",objj_msgSend(_5c,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("itemForEditingValues"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",objj_msgSend(nameField,"stringValue"));
objj_msgSend(_61,"setMake:",objj_msgSend(makeField,"stringValue"));
objj_msgSend(_61,"setModel:",objj_msgSend(modelField,"stringValue"));
objj_msgSend(_61,"setNotes:",objj_msgSend(notesField,"stringValue"));
objj_msgSend(_61,"setDateAcquired:",objj_msgSend(dateAcquiredField,"date"));
objj_msgSend(_61,"setPrice:",objj_msgSend(priceField,"stringValue"));
tagsArray=objj_msgSend(tagsField,"tokens");
objj_msgSend(_61,"setTags:",tagsArray);
objj_msgSend(_61,"setExtras:",objj_msgSend(_5f,"extrasForEditingItem"));
return _61;
}
}),new objj_method(sel_getUid("enterEditMode:"),function(_62,_63,_64){
with(_62){
isEditing=_64;
objj_msgSend(nameField,"setEditable:",_64);
objj_msgSend(nameField,"setBezeled:",_64);
objj_msgSend(makeField,"setEditable:",_64);
objj_msgSend(makeField,"setBezeled:",_64);
objj_msgSend(makeField,"setEditable:",_64);
objj_msgSend(makeField,"setBezeled:",_64);
objj_msgSend(modelField,"setEditable:",_64);
objj_msgSend(modelField,"setBezeled:",_64);
objj_msgSend(priceField,"setEditable:",_64);
objj_msgSend(priceField,"setBezeled:",_64);
objj_msgSend(serialField,"setEditable:",_64);
objj_msgSend(serialField,"setBezeled:",_64);
objj_msgSend(notesField,"setEditable:",_64);
objj_msgSend(notesField,"setBezeled:",_64);
if(isEditing){
objj_msgSend(dateAcquiredTextField,"removeFromSuperview");
objj_msgSend(itemContentView,"addSubview:",dateAcquiredField);
objj_msgSend(itemContentView,"addSubview:",clearDateButton);
objj_msgSend(itemContentView,"addSubview:",addExtraFieldButton);
objj_msgSend(tagsField,"setFrame:",objj_msgSend(tagsUnedited,"frame"));
objj_msgSend(tagsUnedited,"removeFromSuperview");
objj_msgSend(itemContentView,"addSubview:",tagsField);
objj_msgSend(_62,"tokenTextViewFrameSizeDidChange:",tagsField);
var _65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton-selected.png"),CGSizeMake(18,18));
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"editButton"),"setImage:",_65);
}else{
objj_msgSend(addExtraFieldButton,"removeFromSuperview");
objj_msgSend(dateAcquiredField,"removeFromSuperview");
objj_msgSend(clearDateButton,"removeFromSuperview");
var _66=objj_msgSend(objj_msgSend(dateAcquiredField,"date"),"longStringDate");
objj_msgSend(dateAcquiredTextField,"setStringValue:",_66);
objj_msgSend(itemContentView,"addSubview:",dateAcquiredTextField);
objj_msgSend(tagsUnedited,"setFrame:",objj_msgSend(tagsField,"frame"));
objj_msgSend(tagsField,"removeFromSuperview");
tagsArray=objj_msgSend(tagsField,"tokens");
objj_msgSend(tagsUnedited,"setStringValue:",objj_msgSend(tagsArray,"componentsJoinedByString:",", "));
objj_msgSend(itemContentView,"addSubview:",tagsUnedited);
objj_msgSend(_62,"tokenTextViewFrameSizeDidChange:",tagsUnedited);
var _65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton.png"),CGSizeMake(18,18));
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"editButton"),"setImage:",_65);
}
objj_msgSend(_62,"setExtrasToEdit:",_64);
}
}),new objj_method(sel_getUid("clearDate:"),function(_67,_68,_69){
with(_67){
objj_msgSend(dateAcquiredTextField,"setStringValue:","");
objj_msgSend(dateAcquiredField,"setDate:",nil);
}
}),new objj_method(sel_getUid("closeSheet:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSend(CPApp,"endSheet:returnCode:",objj_msgSend(_6c,"window"),objj_msgSend(_6c,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6f,"orderOut:",_6d);
switch(_70){
case 0:
var key=objj_msgSend(objj_msgSend(newFieldPrompt,"stringValue"),"capitalizedString"),_72=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,10,100,28));
if(objj_msgSend(extrasLabels,"containsKey:",key)){
alert("Sorry, You cannot have two extras with the same name.");
return;
}
if(!key){
alert("Sorry, You must enter a name for the new extra.");
return;
}
objj_msgSend(_72,"setStringValue:",key+": ");
objj_msgSend(extrasLabels,"setValue:forKey:",_72,key);
objj_msgSend(itemContentView,"addSubview:",_72);
var _73=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(_73,"setFrame:",CGRectMake(115,10,275,28));
objj_msgSend(_73,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_73,"setBezeled:",YES);
objj_msgSend(_73,"setEditable:",YES);
objj_msgSend(extrasFields,"setValue:forKey:",_73,key);
objj_msgSend(itemContentView,"addSubview:",_73);
var _74=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(3,10,12,12)),_75=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_74,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_75,"pathForResource:","MinusButton.png"),CGSizeMake(12,12)));
objj_msgSend(_74,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_75,"pathForResource:","MinusButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(_74,"setBordered:",NO);
objj_msgSend(_74,"setTarget:",_6d);
objj_msgSend(_74,"setAction:",sel_getUid("removeField:"));
objj_msgSend(_74,"setTag:",key);
objj_msgSend(removeExtraFieldButtons,"setValue:forKey:",_74,key);
objj_msgSend(_6d,"moveExtrasIntoPlace");
objj_msgSend(objj_msgSend(_6d,"window"),"makeFirstResponder:",_73);
var _76=objj_msgSend(scrollView,"contentView");
objj_msgSend(_76,"scrollToPoint:",CGPointMake(0,objj_msgSend(_76,"bounds").size.height));
objj_msgSend(scrollView,"reflectScrolledClipView:",_76);
break;
}
objj_msgSend(newFieldPrompt,"setStringValue:","");
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_79,"object");
if(_7a===newFieldPrompt){
var _7b=objj_msgSend(objj_msgSend(_7a,"stringValue"),"capitalizedString");
objj_msgSend(createNewFieldButton,"setEnabled:",(_7b&&!objj_msgSend(extrasLabels,"containsKey:",_7b)));
}else{
if(_7a===notesField){
objj_msgSend(_7a,"sizeToFit");
if(CGRectGetHeight(objj_msgSend(_7a,"frame"))<50){
objj_msgSend(_7a,"setFrameSize:",CGSizeMake(objj_msgSend(_7a,"frame").size.width,50));
}
objj_msgSend(_77,"moveExtrasIntoPlace");
}
}
}
}),new objj_method(sel_getUid("tokenTextViewFrameSizeDidChange:"),function(_7c,_7d,_7e){
with(_7c){
var _7f=CGRectGetMaxY(objj_msgSend(_7e,"frame"))+4;
objj_msgSend(notesLabel,"setFrameOrigin:",CGPointMake(15,_7f+2));
objj_msgSend(notesField,"setFrameOrigin:",CGPointMake(115,_7f));
objj_msgSend(_7c,"moveExtrasIntoPlace");
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_80,_81,_82,_83){
with(_80){
return ["ItemImageAttachment"];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_84,_85,_86,_87,_88){
with(_84){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_87);
}
}),new objj_method(sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"),function(_89,_8a,_8b,_8c){
with(_89){
return NO;
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_8d,_8e,_8f,_90){
with(_8d){
var _91=objj_msgSend(_8f,"content")[_90],_92=objj_msgSend(_8f,"frameForItemAtIndex:",_90);
_92=objj_msgSend(_8f,"convertRect:toView:",_92,nil);
var _93=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",_92,CPTitledWindowMask|CPHUDBackgroundWindowMask|CPResizableWindowMask|CPClosableWindowMask);
objj_msgSend(_93,"setTitle:",objj_msgSend(_91,"name"));
mediaView=objj_msgSend(objj_msgSend(MediaView,"alloc"),"initWithFrame:",CGRectMake(0,0,900,650));
objj_msgSend(mediaView,"setMedia:forItem:",_91,objj_msgSend(itemController,"activeItem"));
objj_msgSend(_93,"setContentView:",mediaView);
objj_msgSend(_93,"makeKeyAndOrderFront:",_8d);
objj_msgSend(_93,"makeFirstResponder:",mediaView);
var _94=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(_93,"platformWindow"),"contentBounds").size:objj_msgSend(objj_msgSend(_8d,"screen"),"visibleFrame").size,_95=CGPointMake((_94.width-900)/2,(_94.height-650)/2),_96=objj_msgSend(objj_msgSend(_8f,"window"),"frame").size,_97=CGRectMake(_95.x,_95.y,900,650);
objj_msgSend(_93,"setFrame:display:animate:",_97,YES,YES);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("ItemViewTextField"),function(_98,_99){
with(_98){
var _9a=objj_msgSend(LocationEditView,"customTextField");
objj_msgSend(_9a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_9a,"setValue:forThemeAttribute:inState:",CGInsetMake(0,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(_9a,"setValue:forThemeAttribute:inState:",CGInsetMake(1,10,0,10),"content-inset",CPThemeStateEditing);
objj_msgSend(_9a,"setBezeled:",NO);
objj_msgSend(_9a,"setEditable:",NO);
return _9a;
}
}),new objj_method(sel_getUid("customLabelWithFrame:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_9d);
objj_msgSend(_9e,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","666666"));
objj_msgSend(_9e,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_9e,"setAlignment:",CPRightTextAlignment);
return _9e;
}
})]);
var _1=objj_allocateClassPair(LPMultiLineTextField,"AutoExpandingTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setFrameHeightToFit"),function(_9f,_a0){
with(_9f){
var _a1=document.getElementsByTagName("textarea"),_a2=nil;
for(var i=0;i<_a1.length;i++){
if(_a1[i]===document.activeElement){
var _a3=_a1[i],_a4=_a3.clientHeight;
_a4=MAX(_a3.scrollHeight,_a4);
if(_a4>_a3.clientHeight){
_a3.style.height=_a4+"px";
}
var _a5=parseInt(_a3.style.height);
_a2=CGSizeMake(CGRectGetWidth(objj_msgSend(_9f,"bounds")),_a5+14);
}
}
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("AutoExpandingTextField").super_class},"setFrameSize:",_a2);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_a6,_a7){
with(_a6){
var _a8=CGRectGetWidth(objj_msgSend(_a6,"bounds")),_a9=document.createElement("div"),_aa=objj_msgSend(_a6,"stringValue").lastIndexOf("\n")+1;
_a9.style.width=(_a8-objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").left-objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").right)+"px";
_a9.style.font=objj_msgSend(objj_msgSend(_a6,"font"),"cssString");
_a9.innerHTML=objj_msgSend(_a6,"stringValue").replace(/\n/gi,"<br />");
_a9.style.zindex=-200;
document.body.appendChild(_a9);
var _ab=_a9.offsetHeight+objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").top+objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").bottom+16;
document.body.removeChild(_a9);
objj_msgSend(_a6,"setFrameSize:",CGSizeMake(_a8,_ab));
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemContentView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_ac,_ad,_ae){
with(_ac){
var _af=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_af,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _b0=[CGPointMake(15,100.5),CGPointMake(388,100.5)];
CGContextStrokeLineSegments(_af,_b0,2);
}
})]);
var _1=objj_allocateClassPair(CPProgressIndicator,"RLProgressIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("updateBackgroundColor"),function(_b1,_b2){
with(_b1){
objj_msgSend(_b1,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-background.png"),CGSizeMake(47,7))));
objj_msgSend(_b1,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_b3,_b4){
with(_b3){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
if(!_barView){
_barView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,1,0,5));
objj_msgSend(_b3,"addSubview:",_barView);
}
var _b5=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_barView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-0.png"),CGSizeMake(3,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-2.png"),CGSizeMake(3,5))],NO)));
var _b6=CGRectGetWidth(objj_msgSend(_b3,"bounds")),_b7=_b6*((_doubleValue-_minValue)/(_maxValue-_minValue));
if(_b7>0&&_b7<4){
_b7=4;
}
objj_msgSend(_barView,"setFrameSize:",CGSizeMake(_b7,5));
}
})]);
var _1=objj_allocateClassPair(CPView,"AttachmentCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("bgColor"),new objj_ivar("selectedBGColor"),new objj_ivar("progress"),new objj_ivar("progressBar")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_b8,_b9,_ba){
with(_b8){
if(!borderOverlay){
var _bb=objj_msgSend(CPBundle,"mainBundle");
bgColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_bb,"pathForResource:","Attachments/AttachmentBG.png"),CGSizeMake(54,54)));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(13,5,54,54));
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(14,5,53,52));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_b8,"addSubview:",borderOverlay);
objj_msgSend(_b8,"addSubview:",image);
name=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,58,60,24));
objj_msgSend(name,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(name,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","626262"));
objj_msgSend(name,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(name,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(name,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(name,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_b8,"addSubview:",name);
}
objj_msgSend(image,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"data"),objj_msgSend(_b8,"scaleImageWithSize:",CGSizeMake(578,397))));
objj_msgSend(name,"setStringValue:",objj_msgSend(_ba,"name"));
objj_msgSend(_ba,"setRepresentedView:",_b8);
objj_msgSend(progressBar,"removeFromSuperview");
}
}),new objj_method(sel_getUid("setProgress:"),function(_bc,_bd,_be){
with(_bc){
progress=_be;
if(!progressBar){
var _bf=objj_msgSend(_bc,"bounds");
progressBar=objj_msgSend(objj_msgSend(RLProgressIndicator,"alloc"),"initWithFrame:",CGRectMake(17,_bf.size.height-37,47,7));
objj_msgSend(progressBar,"setMaxValue:",1);
objj_msgSend(_bc,"addSubview:",progressBar);
}
objj_msgSend(_bc,"addSubview:",progressBar);
objj_msgSend(progressBar,"setDoubleValue:",_be);
if(progress>=1){
objj_msgSend(name,"setStringValue:","Processing");
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_c0,_c1,_c2){
with(_c0){
var _c3=objj_msgSend(CPBundle,"mainBundle");
if(!selectedBGColor){
selectedBGColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_c3,"pathForResource:","Attachments/AttachmentBG.png"),CGSizeMake(54,54)));
}
if(_c2){
objj_msgSend(borderOverlay,"setBackgroundColor:",selectedBGColor);
}else{
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
}
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_c4,_c5,_c6){
with(_c4){
var _c7=54,_c8=_c6.height,_c9=_c6.width,_ca=MAX(_c7/_c9,_c7/_c8);
_c9=_ca*_c9;
_c8=_ca*_c8;
return CGSizeMake(_c9,_c8);
}
})]);
var _1=objj_allocateClassPair(CPView,"MainItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("normalBorder"),new objj_ivar("highlightBorder"),new objj_ivar("controller")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("controller"),function(_cb,_cc){
with(_cb){
return controller;
}
}),new objj_method(sel_getUid("setController:"),function(_cd,_ce,_cf){
with(_cd){
controller=_cf;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d0,_d1,_d2){
with(_d0){
_d0=objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("MainItemView").super_class},"initWithFrame:",_d2);
if(_d0){
var _d3=objj_msgSend(CPBundle,"mainBundle");
normalBorder=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-0.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-2.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-3.png"),CGSizeMake(5,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-5.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-6.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-7.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-8.png"),CGSizeMake(5,5))]));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(5,5,_d2.size.width-10,_d2.size.height-10));
objj_msgSend(borderOverlay,"setBackgroundColor:",normalBorder);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(5,5,_d2.size.width-10,_d2.size.height-10));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_d0,"addSubview:",image);
objj_msgSend(_d0,"addSubview:",borderOverlay);
objj_msgSend(_d0,"registerForDraggedTypes:",["ItemImageAttachment"]);
var _d4=objj_msgSend(objj_msgSend(DCFileDropController,"alloc"),"initWithView:dropDelegate:uploadURL:uploadManager:",_d0,_d0,objj_msgSend(CPURL,"URLWithString:","http://timetableapp.com/TestingEnviro/Iguana/upload.php"),objj_msgSend(DCFileUploadManager,"sharedManager"));
objj_msgSend(_d4,"setValidFileTypes:",["png","gif","jpg"]);
}
return _d0;
}
}),new objj_method(sel_getUid("draggingEntered:"),function(_d5,_d6,_d7){
with(_d5){
if(!highlightBorder){
var _d8=objj_msgSend(CPBundle,"mainBundle");
highlightBorder=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-0.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-1.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-2.png"),CGSizeMake(8,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-3.png"),CGSizeMake(9,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-5.png"),CGSizeMake(8,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-6.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-7.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-8.png"),CGSizeMake(8,9))]));
}
objj_msgSend(borderOverlay,"setBackgroundColor:",highlightBorder);
}
}),new objj_method(sel_getUid("draggingExited:"),function(_d9,_da,_db){
with(_d9){
objj_msgSend(borderOverlay,"setBackgroundColor:",normalBorder);
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_dc,_dd,_de){
with(_dc){
objj_msgSend(_dc,"setImage:",_de);
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_df,_e0,_e1){
with(_df){
objj_msgSend(_df,"draggingExited:",_e1);
var _e2=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_e1,"draggingPasteboard"),"dataForType:","ItemImageAttachment")),"firstIndex"),cv=objj_msgSend(_e1,"draggingSource"),_e3=objj_msgSend(objj_msgSend(cv,"content")[_e2],"data"),_e4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_e3);
objj_msgSend(_e4,"setDelegate:",_df);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(_e5,_e6,_e7,_e8){
with(_e5){
if(_e8){
objj_msgSend(_e5,"draggingEntered:",nil);
}else{
objj_msgSend(_e5,"draggingExited:",nil);
}
}
}),new objj_method(sel_getUid("fileDropController:didBeginUpload:"),function(_e9,_ea,_eb,_ec){
with(_e9){
objj_msgSend(locationController,"setMainImageUpload:",_ec);
}
}),new objj_method(sel_getUid("setImage:"),function(_ed,_ee,_ef){
with(_ed){
objj_msgSend(_ef,"setSize:",objj_msgSend(_ed,"scaleImageWithSize:",objj_msgSend(_ef,"size")));
objj_msgSend(image,"setImage:",_ef);
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_f0,_f1,_f2){
with(_f0){
var _f3=135,_f4=_f2.height,_f5=_f2.width,_f6=MAX(_f3/_f5,_f3/_f4);
_f5=_f6*_f5;
_f4=_f6*_f4;
return CGSizeMake(_f5,_f4);
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("tile"),function(_f7,_f8){
with(_f7){
var _f9=CGRectGetWidth(objj_msgSend(_f7,"bounds"));
if(!objj_msgSend(_content,"count")||_f9==_tileWidth){
return;
}
var _fa=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_f9/_fa.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _fb=_f9-_numberOfColumns*_fa.width,_fc=NO;
if(_fb>0&&_fa.width<_maxItemSize.width){
_fa.width=MIN(_maxItemSize.width,_fa.width+FLOOR(_fb/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_fa.width<_maxItemSize.width&&_fa.width<_f9){
_fa.width=MIN(_maxItemSize.width,_f9);
}
if(!CGSizeEqualToSize(_itemSize,_fa)){
_itemSize=_fa;
_fc=YES;
}
var _fd=0,_fe=_items.length;
_numberOfRows=CEIL(_fe/_numberOfColumns);
if(_maxNumberOfRows>0){
_numberOfRows=MIN(_maxNumberOfRows,_numberOfRows);
_numberOfColumns=MAX(1,_fe/_numberOfRows);
if(_maxNumberOfColumns>0&&_numberOfColumns>_maxNumberOfColumns){
_numberOfColumns=_maxNumberOfColumns;
}
}
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_fe=MIN(_fe,_maxNumberOfColumns*_maxNumberOfRows);
}
var x=_horizontalMargin,y=-_fa.height;
for(;_fd<_fe;++_fd){
if(_fd%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_fa.height;
}
var _ff=objj_msgSend(_items[_fd],"view");
objj_msgSend(_ff,"setFrameOrigin:",CGPointMake(x,y));
if(_fc){
objj_msgSend(_ff,"setFrameSize:",_itemSize);
}
x+=_fa.width+_horizontalMargin;
}
var _100=objj_msgSend(_f7,"superview"),_101=y+_fa.height,_102=_numberOfColumns*(_fa.width+_horizontalMargin);
_102=MAX(originalWidth,_102);
_101=MAX(originalHeight,_101);
_tileWidth=_102;
objj_msgSend(_f7,"setFrameSize:",CGSizeMake(_102,_101));
_tileWidth=-1;
}
})]);
var _1=objj_allocateClassPair(CPCollectionView,"DropUploadCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("noItemsLabel"),new objj_ivar("isDragging")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(self,_103,_104){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("DropUploadCollectionView").super_class},"initWithFrame:",_104);
originalWidth=_104.size.width;
originalHeight=_104.size.height;
return self;
}
}),new objj_method(sel_getUid("draggingEntered:"),function(self,_105,info){
with(self){
isDragging=YES;
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("draggingExited:"),function(self,_106,info){
with(self){
isDragging=NO;
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(self,_107,_108,_109){
with(self){
if(_109){
objj_msgSend(self,"draggingEntered:",nil);
}else{
objj_msgSend(self,"draggingExited:",nil);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("tile"),function(self,_10a){
with(self){
if(objj_msgSend(_items,"count")){
objj_msgSend(noItemsLabel,"removeFromSuperview");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("DropUploadCollectionView").super_class},"tile");
}else{
if(!noItemsLabel){
noItemsLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"init");
objj_msgSend(noItemsLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",16));
objj_msgSend(noItemsLabel,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
objj_msgSend(noItemsLabel,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(noItemsLabel,"setTextShadowOffset:",CGSizeMake(2,2));
objj_msgSend(noItemsLabel,"setStringValue:","Drop Files Here To Upload Them.");
objj_msgSend(noItemsLabel,"sizeToFit");
objj_msgSend(noItemsLabel,"setCenter:",objj_msgSend(self,"center"));
}
objj_msgSend(self,"addSubview:",noItemsLabel);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_10b,_10c){
with(self){
if(!isDragging){
return;
}
var _10d=objj_msgSend(self,"superview"),_10c=objj_msgSend(_10d,"bounds"),_10e=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
_10c=objj_msgSend(self,"convertRect:fromView:",_10c,_10d);
CGContextSetStrokeColor(_10e,objj_msgSend(CPColor,"colorWithHexString:","4886ca"));
CGContextSetLineWidth(_10e,3);
var _10f=CGRectMake(_10c.origin.x+4,_10c.origin.y+6,_10c.size.width-8,_10c.size.height-17);
CGContextSetFillColor(_10e,objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",72/255,134/255,202/255,0.25));
CGContextFillRoundedRectangleInRect(_10e,_10f,8,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_10e,_10f,8,YES,YES,YES,YES);
}
})]);
var _1=objj_getClass("CPEvent");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPEvent\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_couldBeKeyEquivalent"),function(self,_110){
with(self){
if(_type!==CPKeyDown){
return NO;
}
var _111=_characters.length;
if(!_111){
return NO;
}
if(_modifierFlags&(CPCommandKeyMask|CPControlKeyMask)){
return YES;
}
for(var i=0;i<_111;i++){
switch(_characters.charAt(i)){
case CPCarriageReturnCharacter:
case CPNewlineCharacter:
case CPEscapeFunctionKey:
case CPPageUpFunctionKey:
case CPPageDownFunctionKey:
return YES;
}
}
return NO;
}
})]);
p;20;ItemViewController.jt;347;@STATIC;1.0;t;329;
var _1=objj_allocateClassPair(CPObject,"ItemViewController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("ItemViewController").super_class},"init");
if(_3){
}
return _3;
}
})]);
p;10;Location.jt;7728;@STATIC;1.0;t;7709;
var _1=objj_allocateClassPair(CPObject,"Location"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("superLocation"),new objj_ivar("name"),new objj_ivar("type"),new objj_ivar("address"),new objj_ivar("subLocations"),new objj_ivar("items")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("superLocation"),function(_3,_4){
with(_3){
return superLocation;
}
}),new objj_method(sel_getUid("setSuperLocation:"),function(_5,_6,_7){
with(_5){
superLocation=_7;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_a,_b,_c){
with(_a){
name=_c;
}
}),new objj_method(sel_getUid("type"),function(_d,_e){
with(_d){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_f,_10,_11){
with(_f){
type=_11;
}
}),new objj_method(sel_getUid("address"),function(_12,_13){
with(_12){
return address;
}
}),new objj_method(sel_getUid("setAddress:"),function(_14,_15,_16){
with(_14){
address=_16;
}
}),new objj_method(sel_getUid("subLocations"),function(_17,_18){
with(_17){
return subLocations;
}
}),new objj_method(sel_getUid("setSubLocations:"),function(_19,_1a,_1b){
with(_19){
subLocations=_1b;
}
}),new objj_method(sel_getUid("items"),function(_1c,_1d){
with(_1c){
return items;
}
}),new objj_method(sel_getUid("setItems:"),function(_1e,_1f,_20){
with(_1e){
items=_20;
}
}),new objj_method(sel_getUid("initWithName:"),function(_21,_22,_23){
with(_21){
_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("Location").super_class},"init");
if(_21){
name=_23;
subLocations=[];
items=[];
type="";
address="";
superLocation=nil;
}
return _21;
}
}),new objj_method(sel_getUid("addSubLocation:atIndex:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_26,"setSuperLocation:",_24);
objj_msgSend(subLocations,"insertObject:atIndex:",_26,_27);
}
}),new objj_method(sel_getUid("addSubLocation:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"addSubLocation:atIndex:",_2a,subLocations.length);
}
}),new objj_method(sel_getUid("removeSubLocation:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2d,"setSuperLocation:",nil);
objj_msgSend(subLocations,"removeObject:",_2d);
}
}),new objj_method(sel_getUid("moveItemAtIndex:toIndex:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_31>_30){
_31--;
}
if(_30===_31){
return;
}
var _32=items[_30];
objj_msgSend(items,"removeObjectAtIndex:",_30);
objj_msgSend(items,"insertObject:atIndex:",_32,_31);
var _33=objj_msgSend(CPInvocation,"invocationWithMethodSignature:","moveItemAtIndex:toIndex:");
objj_msgSend(_33,"setTarget:",_2e);
objj_msgSend(_33,"setSelector:",sel_getUid("moveItemAtIndex:toIndex:"));
objj_msgSend(_33,"setArgument:atIndex:",_31,2);
objj_msgSend(_33,"setArgument:atIndex:",_30,3);
var _34=objj_msgSend(CPApp,"delegate");
objj_msgSend(objj_msgSend(_34,"locationController"),"refreshItemData");
objj_msgSend(objj_msgSend(_34,"undoManager"),"registerUndoWithTarget:selector:object:",_33,sel_getUid("invoke"),nil);
}
}),new objj_method(sel_getUid("indexOfSubLocation:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(subLocations,"indexOfObject:",_37);
}
}),new objj_method(sel_getUid("addItem:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(items,"addObject:",_3a);
}
}),new objj_method(sel_getUid("removeItem:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(items,"removeObjectIdenticalTo:",_3d);
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(items,"objectAtIndex:",_40);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_41,_42){
with(_41){
return objj_msgSend(items,"count");
}
}),new objj_method(sel_getUid("replaceItemWithItem:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_45,"valueForKey:","oldItem"),_47=objj_msgSend(_45,"valueForKey:","newItem"),_48=objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),_49=objj_msgSend(_48,"locationView");
objj_msgSend(items,"replaceObjectAtIndex:withObject:",objj_msgSend(items,"indexOfObject:",_46),_47);
objj_msgSend(_48,"refreshItemData");
var _4a=objj_msgSend(items,"indexOfObject:",_47);
if(_4a!==-1){
objj_msgSend(objj_msgSend(_49,"itemTableView"),"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_4a),NO);
objj_msgSend(_49,"setActiveItem:",_47);
}
var _4b=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_47,_46],["oldItem","newItem"]);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_43,sel_getUid("replaceItemWithItem:"),_4b);
}
}),new objj_method(sel_getUid("dictionaryValues"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend(CPDictionary,"new");
objj_msgSend(_4e,"setValue:forKey:",name,"name");
objj_msgSend(_4e,"setValue:forKey:",type,"type");
objj_msgSend(_4e,"setValue:forKey:",address,"address");
return _4e;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_4f,_50,_51){
with(_4f){
_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("Location").super_class},"init");
if(_4f){
name=objj_msgSend(_51,"decodeObjectForKey:","LocationName");
type=objj_msgSend(_51,"decodeObjectForKey:","LocationType");
address=objj_msgSend(_51,"decodeObjectForKey:","LocationAddress");
subLocations=objj_msgSend(_51,"decodeObjectForKey:","LocationSubLocations");
superLocation=objj_msgSend(_51,"decodeObjectForKey:","LocationSuperLocation");
}
return _4f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_54,"encodeObject:forKey:",name,"LocationName");
objj_msgSend(_54,"encodeObject:forKey:",type,"LocationType");
objj_msgSend(_54,"encodeObject:forKey:",address,"LocationAddress");
objj_msgSend(_54,"encodeObject:forKey:",subLocations,"LocationSubLocations");
objj_msgSend(_54,"encodeObject:forKey:",superLocation,"LocationSuperLocation");
}
}),new objj_method(sel_getUid("isEqual:"),function(_55,_56,_57){
with(_55){
if(objj_msgSend(_57,"class")===objj_msgSend(_55,"class")){
return (objj_msgSend(name,"isEqual:",objj_msgSend(_57,"name"))&&objj_msgSend(type,"isEqual:",objj_msgSend(_57,"type"))&&objj_msgSend(address,"isEqual:",objj_msgSend(_57,"address"))&&objj_msgSend(subLocations,"isEqual:",objj_msgSend(_57,"subLocations")));
}else{
return NO;
}
}
}),new objj_method(sel_getUid("copy"),function(_58,_59){
with(_58){
var _5a=objj_msgSendSuper({receiver:_58,super_class:objj_getClass("Location").super_class},"copy");
objj_msgSend(_5a,"setSuperLocation:",superLocation);
objj_msgSend(_5a,"setName:",name);
objj_msgSend(_5a,"setType:",type);
objj_msgSend(_5a,"setAddress:",address);
objj_msgSend(_5a,"setSubLocations:",subLocations);
return _5a;
}
}),new objj_method(sel_getUid("toJSON"),function(_5b,_5c){
with(_5b){
var _5d={};
_5d.name=name;
_5d.type=type;
_5d.address=address;
_5d.subLocations=subLocations;
_5d.items=items;
return _5d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_5e,_5f,_60){
with(_5e){
var _61=objj_msgSend(objj_msgSend(Location,"alloc"),"initWithName:",_60.name);
objj_msgSend(_61,"setType:",_60.type);
if(!objj_msgSend(_61,"type")){
objj_msgSend(_61,"setType:","");
}
objj_msgSend(_61,"setAddress:",_60.address);
for(var i=0;i<_60.subLocations.length;i++){
var _62=objj_msgSend(Location,"decodeJSON:",_60.subLocations[i]);
objj_msgSend(_61,"addSubLocation:",_62);
}
for(var i=0;i<_60.items.length;i++){
var _63=objj_msgSend(Item,"decodeJSON:",_60.items[i]);
objj_msgSend(_61,"addItem:",_63);
}
return _61;
}
})]);
objj_class.prototype.toJSON=objj_object.prototype.toJSON=function(){
if(this.isa&&class_getInstanceMethod(this.isa,"toJSON")!=NULL){
return objj_msgSend(this,"toJSON");
}else{
return String(this)+" (-toJSON not implemented)";
}
};
p;20;LocationController.jt;17516;@STATIC;1.0;t;17496;
var _1=objj_allocateClassPair(CPObject,"LocationController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("location"),new objj_ivar("containerView"),new objj_ivar("noLocationView"),new objj_ivar("scrollview"),new objj_ivar("locationView"),new objj_ivar("itemController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("location"),function(_3,_4){
with(_3){
return location;
}
}),new objj_method(sel_getUid("setLocation:"),function(_5,_6,_7){
with(_5){
location=_7;
}
}),new objj_method(sel_getUid("locationView"),function(_8,_9){
with(_8){
return locationView;
}
}),new objj_method(sel_getUid("setLocationView:"),function(_a,_b,_c){
with(_a){
locationView=_c;
}
}),new objj_method(sel_getUid("itemController"),function(_d,_e){
with(_d){
return itemController;
}
}),new objj_method(sel_getUid("setItemController:"),function(_f,_10,_11){
with(_f){
itemController=_11;
}
}),new objj_method(sel_getUid("initWithContentView:"),function(_12,_13,_14){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("LocationController").super_class},"init");
if(_12){
containerView=_14;
var _15=objj_msgSend(containerView,"bounds");
scrollview=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_15);
objj_msgSend(scrollview,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _16=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","texture4.png"),CGSizeMake(97,97));
objj_msgSend(scrollview,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_16));
locationView=objj_msgSend(objj_msgSend(LocationView,"alloc"),"initWithFrame:andController:",CGRectMake(0,0,845,600),_12);
itemController=objj_msgSend(objj_msgSend(ItemController,"alloc"),"initWithItemView:locationController:",objj_msgSend(locationView,"itemView"),_12);
objj_msgSend(scrollview,"setDocumentView:",locationView);
objj_msgSend(scrollview,"setAutohidesScrollers:",YES);
objj_msgSend(containerView,"addSubview:",scrollview);
noLocationView=objj_msgSend(objj_msgSend(NoLocationView,"alloc"),"initWithFrame:",_15);
objj_msgSend(noLocationView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(containerView,"addSubview:",noLocationView);
objj_msgSend(_12,"setLocation:",nil);
}
return _12;
}
}),new objj_method(sel_getUid("edit:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(locationView,"shadowView"),_1b=objj_msgSend(_1a,"frame"),_1c=objj_msgSend(objj_msgSend(scrollview,"window"),"contentView");
_1b=objj_msgSend(objj_msgSend(_1a,"superview"),"convertRect:toView:",_1b,_1c);
var _1d=objj_msgSend(objj_msgSend(LocationEditView,"alloc"),"initWithFrame:",_1b),_1e=objj_msgSend(_1c,"frame");
objj_msgSend(_1d,"setLocationData:",objj_msgSend(location,"dictionaryValues"));
objj_msgSend(_1c,"addSubview:",_1d);
objj_msgSend(_1d,"setSaveAndCloseAction:",sel_getUid("saveAndCloseEditLocationWindow:"));
objj_msgSend(_1d,"setTarget:",_17);
objj_msgSend(_1d,"animateToFrame:willRemove:",CGRectMake(30,5,_1e.size.width-60,_1e.size.height-10),NO);
}
}),new objj_method(sel_getUid("saveAndCloseEditLocationWindow:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_21,"locationData"),_23=objj_msgSend(locationView,"shadowView");
objj_msgSend(_1f,"setLocationData:",_22);
var _24=objj_msgSend(_23,"frame");
_24=objj_msgSend(objj_msgSend(_23,"superview"),"convertRect:toView:",_24,objj_msgSend(objj_msgSend(scrollview,"window"),"contentView"));
objj_msgSend(_21,"animateToFrame:willRemove:",_24,YES);
}
}),new objj_method(sel_getUid("addNewItem:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:","Untitled"),_29=objj_msgSend(locationView,"itemTableView");
objj_msgSend(location,"addItem:",_28);
if(objj_msgSend(location,"numberOfItems")){
objj_msgSend(locationView,"hideNoItemsView");
}
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(_29,"reloadData");
var _2a=objj_msgSend(objj_msgSend(location,"items"),"count")-1;
objj_msgSend(_29,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_2a),NO);
objj_msgSend(_29,"scrollRowToVisible:",_2a);
var _2b=objj_msgSend(locationView,"itemView");
objj_msgSend(_2b,"enterEditMode:",YES);
objj_msgSend(objj_msgSend(locationView,"window"),"makeFirstResponder:",objj_msgSend(_2b,"nameField"));
objj_msgSend(objj_msgSend(_2b,"nameField"),"selectText:",_25);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_25,sel_getUid("removeItem:"),_28);
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("refreshItemData"),function(_2c,_2d){
with(_2c){
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(objj_msgSend(locationView,"itemTableView"),"reloadData");
}
}),new objj_method(sel_getUid("addItem:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(locationView,"hideNoItemsView");
objj_msgSend(location,"addItem:",_30);
objj_msgSend(objj_msgSend(locationView,"itemTableView"),"reloadData");
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_2e,sel_getUid("removeItem:"),_30);
}
}),new objj_method(sel_getUid("confirmRemovalOfItem:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,120),CPDocModalWindowMask),_35=objj_msgSend(_34,"contentView"),_36=objj_msgSend(CPTextField,"labelWithTitle:","Delete Item");
objj_msgSend(_36,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_36,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_35,"addSubview:",_36);
var _37=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68));
var _38=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_38,"setImage:",_37);
objj_msgSend(_35,"addSubview:",_38);
var _39=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,325,60));
objj_msgSend(_39,"setStringValue:","Are you sure you want to delete '"+objj_msgSend(_33,"name")+"'? ");
objj_msgSend(_39,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_35,"addSubview:",_39);
var _3a=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(285,85,100,24));
objj_msgSend(_3a,"setTitle:","Remove");
objj_msgSend(_3a,"setTag:",0);
objj_msgSend(_3a,"setTarget:",_31);
objj_msgSend(_3a,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_35,"addSubview:",_3a);
objj_msgSend(_34,"setDefaultButton:",_3a);
var _3b=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,85,100,24));
objj_msgSend(_3b,"setTag:",-1);
objj_msgSend(_3b,"setTitle:","Cancel");
objj_msgSend(_3b,"setTarget:",_31);
objj_msgSend(_3b,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_35,"addSubview:",_3b);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_34,objj_msgSend(locationView,"window"),_31,sel_getUid("didEndSheet:returnCode:contextInfo:"),_33);
}
}),new objj_method(sel_getUid("removeItem:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(location,"removeItem:",_3e);
objj_msgSend(_3c,"refreshItemData");
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_3c,sel_getUid("addItem:"),_3e);
}
}),new objj_method(sel_getUid("setLocation:"),function(_3f,_40,_41){
with(_3f){
location=_41;
if(_41){
var _42=objj_msgSend(locationView,"itemTableView");
objj_msgSend(_42,"reloadData");
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(_42,"_noteSelectionIsChanging");
objj_msgSend(_42,"_noteSelectionDidChange");
objj_msgSend(locationView,"setLocationTitle:",objj_msgSend(location,"name"));
objj_msgSend(scrollview,"setHidden:",NO);
objj_msgSend(noLocationView,"setHidden:",YES);
}else{
objj_msgSend(scrollview,"setHidden:",YES);
objj_msgSend(noLocationView,"setHidden:",NO);
}
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"mainToolbar"),"validateVisibleItems");
}
}),new objj_method(sel_getUid("setLocationData:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(location,"dictionaryValues");
if(objj_msgSend(_46,"isEqual:",_45)){
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_43,sel_getUid("setLocationData:"),_46);
objj_msgSend(location,"setName:",objj_msgSend(_45,"valueForKey:","name"));
objj_msgSend(location,"setType:",objj_msgSend(_45,"valueForKey:","type"));
objj_msgSend(location,"setAddress:",objj_msgSend(_45,"valueForKey:","address"));
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("allItemsForLocation"),function(_47,_48){
with(_47){
return objj_msgSend(location,"items");
}
}),new objj_method(sel_getUid("currentItem"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(objj_msgSend(objj_msgSend(locationView,"itemTableView"),"selectedRowIndexes"),"firstIndex");
return objj_msgSend(location,"items")[_4b];
}
}),new objj_method(sel_getUid("closeSheet:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(CPApp,"endSheet:returnCode:",objj_msgSend(_4e,"window"),objj_msgSend(_4e,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_4f,_50,_51,_52,_53){
with(_4f){
objj_msgSend(_51,"orderOut:",_4f);
switch(_52){
case 0:
objj_msgSend(locationView,"setActiveItem:",nil);
objj_msgSend(_4f,"removeItem:",_53);
break;
}
}
}),new objj_method(sel_getUid("tableViewSelectionIsChanging:"),function(_54,_55,_56){
with(_54){
objj_msgSend(itemController,"saveIfNeeded");
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_57,_58,_59){
with(_57){
var row=objj_msgSend(objj_msgSend(objj_msgSend(_59,"object"),"selectedRowIndexes"),"firstIndex");
if(row<0){
objj_msgSend(locationView,"setActiveItem:",nil);
}else{
objj_msgSend(locationView,"setActiveItem:",objj_msgSend(location,"itemAtIndex:",row));
}
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_5a,_5b,_5c,_5d,_5e){
with(_5a){
var _5f=objj_msgSend(CPDictionary,"new"),_60=objj_msgSend(location,"items")[_5e];
objj_msgSend(_5f,"setValue:forKey:",objj_msgSend(_60,"name"),"name");
objj_msgSend(_5f,"setValue:forKey:",objj_msgSend(_60,"make"),"maker");
objj_msgSend(_5f,"setValue:forKey:",(objj_msgSend(objj_msgSend(_60,"attachments"),"count")>0),"attachments");
return _5f;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_61,_62,_63){
with(_61){
var _64=objj_msgSend(objj_msgSend(location,"items"),"count");
if(!_64){
objj_msgSend(locationView,"showNoItemsView");
}else{
objj_msgSend(locationView,"hideNoItemsView");
}
return objj_msgSend(objj_msgSend(location,"items"),"count");
}
}),new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"),function(_65,_66,_67,_68,_69){
with(_65){
objj_msgSend(_69,"declareTypes:owner:",["ItemDragType"],_65);
objj_msgSend(_69,"setData:forType:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_68),"ItemDragType");
return YES;
}
}),new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"),function(_6a,_6b,_6c,_6d,row,_6e){
with(_6a){
var _6f=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_6d,"draggingPasteboard"),"dataForType:","ItemDragType")),"firstIndex");
if(row===_6f||row===_6f+1){
return CPDragOperationNone;
}
objj_msgSend(_6c,"setDropRow:dropOperation:",row,CPTableViewDropAbove);
return CPDragOperationMove;
}
}),new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"),function(_70,_71,_72,_73,row,_74){
with(_70){
var _75=objj_msgSend(_73,"draggingPasteboard"),_76=objj_msgSend(_75,"dataForType:","ItemDragType"),_77=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_76),"firstIndex");
if(_77===row){
return NO;
}
objj_msgSend(location,"moveItemAtIndex:toIndex:",_77,row);
return YES;
}
}),new objj_method(sel_getUid("tableViewDeleteKeyPressed:"),function(_78,_79,_7a){
with(_78){
objj_msgSend(_78,"confirmRemovalOfItem:",objj_msgSend(location,"itemAtIndex:",objj_msgSend(objj_msgSend(_7a,"selectedRowIndexes"),"firstIndex")));
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(_7d,"itemIdentifier");
if(_7e==="newItem"){
return !!location;
}else{
return !!location;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("customVerticalScroller"),function(_7f,_80){
with(_7f){
var _81=objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,12,170)),_82=objj_msgSend(CPBundle,"mainBundle"),_83=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-top.png"),CGSizeMake(12,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-center.png"),CGSizeMake(12,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-bottom.png"),CGSizeMake(12,6))],YES));
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",21,"minimum-knob-length",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGInsetMake(0,0,0,0),"knob-inset",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGInsetMake(3,0,3,0),"track-inset",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",_83,"knob-slot-color",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGSizeMake(0,0),"decrement-line-size",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGSizeMake(0,0),"increment-line-size",CPThemeStateVertical);
var _84=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-top.png"),CGSizeMake(12,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-center.png"),CGSizeMake(12,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-bottom.png"),CGSizeMake(12,6))],YES));
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",_84,"knob-color",CPThemeStateVertical);
return _81;
}
}),new objj_method(sel_getUid("customHorizontalScroller"),function(_85,_86){
with(_85){
var _87=objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,170,12)),_88=objj_msgSend(CPBundle,"mainBundle"),_89=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-bottom.png"),CGSizeMake(6,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-center.png"),CGSizeMake(1,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-top.png"),CGSizeMake(6,12))],NO));
objj_msgSend(_87,"setValue:forThemeAttribute:",21,"minimum-knob-length");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGInsetMake(0,0,0,0),"knob-inset");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGInsetMake(0,3,0,3),"track-inset");
objj_msgSend(_87,"setValue:forThemeAttribute:",_89,"knob-slot-color");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGSizeMake(0,0),"decrement-line-size");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGSizeMake(0,0),"increment-line-size");
var _8a=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-bottom.png"),CGSizeMake(6,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-center.png"),CGSizeMake(1,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-top.png"),CGSizeMake(6,12))],NO));
objj_msgSend(_87,"setValue:forThemeAttribute:",_8a,"knob-color");
return _87;
}
})]);
p;18;LocationEditView.jt;17713;@STATIC;1.0;t;17693;
var _1=objj_allocateClassPair(CPView,"LocationEditView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("locationTitle"),new objj_ivar("locationType"),new objj_ivar("locationAddress"),new objj_ivar("shadowView"),new objj_ivar("contentView"),new objj_ivar("map"),new objj_ivar("closeButton"),new objj_ivar("target"),new objj_ivar("saveAndCloseAction")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("saveAndCloseAction"),function(_3,_4){
with(_3){
return saveAndCloseAction;
}
}),new objj_method(sel_getUid("setSaveAndCloseAction:"),function(_5,_6,_7){
with(_5){
saveAndCloseAction=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("LocationEditView").super_class},"initWithFrame:",_a);
if(_8){
var _b=objj_msgSend(CPBundle,"mainBundle");
shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",CGRectMake(0,0,_a.size.width,_a.size.height));
objj_msgSend(shadowView,"setWeight:",CPHeavyShadow);
objj_msgSend(_8,"addSubview:",shadowView);
contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(7,5,_a.size.width-14,_a.size.height-10));
objj_msgSend(contentView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","e7eaee"));
objj_msgSend(_8,"addSubview:",contentView);
objj_msgSend(_8,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(shadowView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(contentView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
locationTitle=objj_msgSend(objj_msgSend(_8,"class"),"customTextField");
objj_msgSend(locationTitle,"setStringValue:","");
objj_msgSend(locationTitle,"setPlaceholderString:","Location Name");
objj_msgSend(contentView,"addSubview:",locationTitle);
var _c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(50,80,425,1));
objj_msgSend(_c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","999999"));
objj_msgSend(contentView,"addSubview:",_c);
locationType=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(55,90,250,24));
objj_msgSend(locationType,"setBordered:",NO);
objj_msgSend(locationType,"addItems:",objj_msgSend(LocationItemTypes,"menuItems"));
objj_msgSend(contentView,"addSubview:",locationType);
locationAddress=objj_msgSend(objj_msgSend(_8,"class"),"customMultiLineTextField");
objj_msgSend(locationAddress,"setStringValue:","");
objj_msgSend(locationAddress,"setDelegate:",_8);
objj_msgSend(locationAddress,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",20));
objj_msgSend(locationAddress,"setPlaceholderString:","Location Address");
objj_msgSend(contentView,"addSubview:",locationAddress);
map=objj_msgSend(objj_msgSend(RLMapView,"alloc"),"initWithFrame:",CGRectMake(635,15,_a.size.width-700,300));
objj_msgSend(map,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(contentView,"addSubview:",map);
closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(5,5,20,21));
objj_msgSend(closeButton,"setBordered:",NO);
objj_msgSend(closeButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_b,"pathForResource:","CloseButton.png"),CGSizeMake(20,21)));
objj_msgSend(closeButton,"setImagePosition:",CPImageOnly);
objj_msgSend(closeButton,"setTarget:",_8);
objj_msgSend(closeButton,"setAction:",sel_getUid("close:"));
objj_msgSend(contentView,"addSubview:",closeButton);
var _d=objj_msgSend(objj_msgSend(_8,"class"),"customBigButton");
objj_msgSend(_d,"setTitle:","Done");
objj_msgSend(_d,"setTarget:",_8);
objj_msgSend(_d,"setAction:",sel_getUid("close:"));
objj_msgSend(contentView,"addSubview:",_d);
}
return _8;
}
}),new objj_method(sel_getUid("setLocationData:"),function(_e,_f,_10){
with(_e){
objj_msgSend(locationTitle,"setStringValue:",objj_msgSend(_10,"valueForKey:","name"));
objj_msgSend(locationType,"selectItemWithTitle:",objj_msgSend(_10,"valueForKey:","type"));
objj_msgSend(locationAddress,"setStringValue:",objj_msgSend(_10,"valueForKey:","address"));
objj_msgSend(map,"setAddress:",objj_msgSend(_10,"valueForKey:","address"));
}
}),new objj_method(sel_getUid("locationData"),function(_11,_12){
with(_11){
var _13=objj_msgSend(CPDictionary,"new");
objj_msgSend(_13,"setValue:forKey:",objj_msgSend(locationTitle,"stringValue"),"name");
objj_msgSend(_13,"setValue:forKey:",objj_msgSend(locationType,"titleOfSelectedItem"),"type");
objj_msgSend(_13,"setValue:forKey:",objj_msgSend(locationAddress,"stringValue"),"address");
return _13;
}
}),new objj_method(sel_getUid("controlTextDidEndEditing:"),function(_14,_15,_16){
with(_14){
objj_msgSend(map,"setAddress:",objj_msgSend(objj_msgSend(_16,"object"),"stringValue"));
}
}),new objj_method(sel_getUid("close:"),function(_17,_18,_19){
with(_17){
objj_msgSend(target,saveAndCloseAction,_17);
}
}),new objj_method(sel_getUid("setTarget:"),function(_1a,_1b,_1c){
with(_1a){
target=_1c;
}
}),new objj_method(sel_getUid("setLocationTitle:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(locationTitle,"setStringValue:",_1f);
objj_msgSend(locationTitle,"sizeToFit");
}
}),new objj_method(sel_getUid("animateToFrame:willRemove:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(CPDictionary,"new");
objj_msgSend(_24,"setValue:forKey:",_20,CPViewAnimationTargetKey);
objj_msgSend(_24,"setValue:forKey:",objj_msgSend(_20,"frame"),CPViewAnimationStartFrameKey);
objj_msgSend(_24,"setValue:forKey:",_22,CPViewAnimationEndFrameKey);
objj_msgSend(_24,"setValue:forKey:",(_23)?CPViewAnimationFadeOutEffect:CPViewAnimationFadeInEffect,CPViewAnimationEffectKey);
var _25=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_24]);
objj_msgSend(_25,"setDelegate:",_20);
objj_msgSend(_25,"startAnimation");
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(objj_msgSend(_28,"viewAnimations")[0],"valueForKey:",CPViewAnimationEffectKey)===CPViewAnimationFadeOutEffect){
objj_msgSend(objj_msgSend(objj_msgSend(_28,"viewAnimations")[0],"valueForKey:",CPViewAnimationTargetKey),"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_2c,objj_msgSend(CPColor,"colorWithHexString:","000000"));
var _2d=[CGPointMake(50,80),CGPointMake(425,80)];
CGContextStrokeLineSegments(_2c,_2d,2);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("customTextField"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(CPBundle,"mainBundle"),_31=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(50,15,425,52));
objj_msgSend(_31,"setBezeled:",YES);
objj_msgSend(_31,"setEditable:",YES);
objj_msgSend(_31,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",32));
objj_msgSend(_31,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(_31,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(_31,"setValue:forThemeAttribute:inState:",CGInsetMake(-1,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(_31,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
var _32=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-8.png"),CGSizeMake(11,9))])),_33=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","TextField/textfield-focused-8.png"),CGSizeMake(11,9))]));
objj_msgSend(_31,"setValue:forThemeAttribute:inState:",_32,"bezel-color",CPThemeStateBezeled);
objj_msgSend(_31,"setValue:forThemeAttribute:inState:",_33,"bezel-color",CPThemeStateBezeled|CPThemeStateEditing);
return _31;
}
}),new objj_method(sel_getUid("customMultiLineTextField"),function(_34,_35){
with(_34){
var _36=objj_msgSend(CPBundle,"mainBundle"),_37=objj_msgSend(objj_msgSend(LPMultiLineTextField,"alloc"),"initWithFrame:",CGRectMake(50,130,425,80));
objj_msgSend(_37,"setBezeled:",YES);
objj_msgSend(_37,"setEditable:",YES);
objj_msgSend(_37,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",32));
objj_msgSend(_37,"setTextColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_37,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(_37,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(_37,"setValue:forThemeAttribute:inState:",CGInsetMake(5,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(_37,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
var _38=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-8.png"),CGSizeMake(11,9))])),_39=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_36,"pathForResource:","TextField/textfield-focused-8.png"),CGSizeMake(11,9))]));
objj_msgSend(_37,"setValue:forThemeAttribute:inState:",_38,"bezel-color",CPThemeStateBezeled);
objj_msgSend(_37,"setValue:forThemeAttribute:inState:",_39,"bezel-color",CPThemeStateBezeled|CPThemeStateEditing);
return _37;
}
}),new objj_method(sel_getUid("customBigButton"),function(_3a,_3b){
with(_3a){
var _3c=objj_msgSend(CPBundle,"mainBundle"),_3d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(275,235,200,39)),_3e=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-left.png"),CGSizeMake(2,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-center.png"),CGSizeMake(1,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-right.png"),CGSizeMake(2,39))],NO)),_3f=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-left-active.png"),CGSizeMake(2,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-center-active.png"),CGSizeMake(1,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","Buttons/gradient-button-right-active.png"),CGSizeMake(2,39))],NO));
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",18),"font",CPThemeStateBordered);
objj_msgSend(_3d,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0/255,0.9),"text-color");
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",240/255,1),"text-shadow-color",CPThemeStateBordered);
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",CGSizeMake(0,1),"text-shadow-offset",CPThemeStateBordered);
objj_msgSend(_3d,"setValue:forThemeAttribute:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",_3e,"bezel-color",CPThemeStateBordered);
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",_3f,"bezel-color",CPThemeStateBordered|CPThemeStateHighlighted);
objj_msgSend(_3d,"setValue:forThemeAttribute:inState:",CGInsetMake(0,5,0,5),"content-inset",CPThemeStateBordered);
objj_msgSend(_3d,"setValue:forThemeAttribute:",CGSizeMake(0,24),"min-size");
objj_msgSend(_3d,"setValue:forThemeAttribute:",CGSizeMake(-1,24),"max-size");
return _3d;
}
})]);
p;14;LocationView.jt;28365;@STATIC;1.0;t;28345;
var _1=objj_allocateClassPair(CPView,"LocationView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("viewController"),new objj_ivar("shadowView"),new objj_ivar("contain"),new objj_ivar("locationTitle"),new objj_ivar("viewSwitcher"),new objj_ivar("itemScrollView"),new objj_ivar("itemTableView"),new objj_ivar("itemViewScrollView"),new objj_ivar("itemView"),new objj_ivar("noItemsView"),new objj_ivar("topView"),new objj_ivar("gradientOverlay"),new objj_ivar("editButton"),new objj_ivar("uploadButton"),new objj_ivar("deleteButton"),new objj_ivar("backToItemsButton"),new objj_ivar("collectionViewScrollView"),new objj_ivar("collectionView"),new objj_ivar("animation")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("viewController"),function(_3,_4){
with(_3){
return viewController;
}
}),new objj_method(sel_getUid("setViewController:"),function(_5,_6,_7){
with(_5){
viewController=_7;
}
}),new objj_method(sel_getUid("shadowView"),function(_8,_9){
with(_8){
return shadowView;
}
}),new objj_method(sel_getUid("setShadowView:"),function(_a,_b,_c){
with(_a){
shadowView=_c;
}
}),new objj_method(sel_getUid("itemTableView"),function(_d,_e){
with(_d){
return itemTableView;
}
}),new objj_method(sel_getUid("setItemTableView:"),function(_f,_10,_11){
with(_f){
itemTableView=_11;
}
}),new objj_method(sel_getUid("itemView"),function(_12,_13){
with(_12){
return itemView;
}
}),new objj_method(sel_getUid("setItemView:"),function(_14,_15,_16){
with(_14){
itemView=_16;
}
}),new objj_method(sel_getUid("editButton"),function(_17,_18){
with(_17){
return editButton;
}
}),new objj_method(sel_getUid("setEditButton:"),function(_19,_1a,_1b){
with(_19){
editButton=_1b;
}
}),new objj_method(sel_getUid("uploadButton"),function(_1c,_1d){
with(_1c){
return uploadButton;
}
}),new objj_method(sel_getUid("setUploadButton:"),function(_1e,_1f,_20){
with(_1e){
uploadButton=_20;
}
}),new objj_method(sel_getUid("deleteButton"),function(_21,_22){
with(_21){
return deleteButton;
}
}),new objj_method(sel_getUid("setDeleteButton:"),function(_23,_24,_25){
with(_23){
deleteButton=_25;
}
}),new objj_method(sel_getUid("collectionView"),function(_26,_27){
with(_26){
return collectionView;
}
}),new objj_method(sel_getUid("setCollectionView:"),function(_28,_29,_2a){
with(_28){
collectionView=_2a;
}
}),new objj_method(sel_getUid("initWithFrame:andController:"),function(_2b,_2c,_2d,_2e){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("LocationView").super_class},"initWithFrame:",_2d);
if(_2b){
viewController=_2e;
locationTitle=objj_msgSend(CPTextField,"new");
objj_msgSend(locationTitle,"setFrameOrigin:",CGPointMake(50,15));
objj_msgSend(locationTitle,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",32));
objj_msgSend(locationTitle,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(locationTitle,"setValue:forThemeAttribute:",CGSizeMake(1,1),"text-shadow-offset");
objj_msgSend(locationTitle,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0/255,0.9),"text-shadow-color");
objj_msgSend(locationTitle,"setStringValue:","My Location");
objj_msgSend(locationTitle,"sizeToFit");
objj_msgSend(_2b,"addSubview:",locationTitle);
var _2f=objj_msgSend(CPBundle,"mainBundle");
viewSwitcher=objj_msgSend(objj_msgSend(CPSegmentedControl,"alloc"),"initWithFrame:",CGRectMake(_2d.size.width-88,28,0,24));
objj_msgSend(viewSwitcher,"setSegmentCount:",2);
objj_msgSend(viewSwitcher,"setImage:forSegment:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","list-view.png"),CGSizeMake(15,15)),0);
objj_msgSend(viewSwitcher,"setImage:forSegment:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","grid-view.png"),CGSizeMake(15,15)),1);
objj_msgSend(viewSwitcher,"setWidth:forSegment:",37,0);
objj_msgSend(viewSwitcher,"setWidth:forSegment:",37,1);
objj_msgSend(viewSwitcher,"setSelectedSegment:",0);
objj_msgSend(viewSwitcher,"setTarget:",_2b);
objj_msgSend(viewSwitcher,"setAction:",sel_getUid("switchViews:"));
objj_msgSend(_2b,"addSubview:",viewSwitcher);
shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(shadowView,"setWeight:",CPHeavyShadow);
objj_msgSend(shadowView,"setFrameForContentFrame:",CGRectMake(50,70,790,525));
objj_msgSend(_2b,"addSubview:",shadowView);
contain=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(50,70,790,525));
objj_msgSend(_2b,"addSubview:",contain);
topArea=objj_msgSend(objj_msgSend(TopView,"alloc"),"initWithFrame:",CGRectMake(225,0,565,44));
objj_msgSend(topArea,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
objj_msgSend(contain,"addSubview:",topArea);
itemScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,225,525));
objj_msgSend(itemScrollView,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxYMargin);
objj_msgSend(itemScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(itemScrollView,"setVerticalScroller:",objj_msgSend(LocationController,"customVerticalScroller"));
objj_msgSend(itemScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
itemTableView=objj_msgSend(objj_msgSend(ItemViewTableView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(itemTableView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f8f8f8"));
objj_msgSend(itemTableView,"setGridColor:",objj_msgSend(CPColor,"colorWithHexString:","f0f0f0"));
objj_msgSend(itemTableView,"setGridStyleMask:",CPTableViewSolidHorizontalGridLineMask);
objj_msgSend(itemTableView,"setDelegate:",viewController);
objj_msgSend(itemTableView,"setDataSource:",viewController);
objj_msgSend(itemTableView,"setSelectionHighlightColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
objj_msgSend(itemTableView,"setRowHeight:",50);
objj_msgSend(itemTableView,"registerForDraggedTypes:",["ItemDragType"]);
var _30=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","Items");
objj_msgSend(objj_msgSend(_30,"headerView"),"setStringValue:","Items");
objj_msgSend(_30,"setWidth:",210);
objj_msgSend(_30,"setMinWidth:",210);
objj_msgSend(_30,"setDataView:",objj_msgSend(objj_msgSend(ItemDataView,"alloc"),"initWithFrame:",CGRectMake(0,0,210,50)));
objj_msgSend(itemTableView,"addTableColumn:",_30);
objj_msgSend(itemScrollView,"setDocumentView:",itemTableView);
objj_msgSend(contain,"addSubview:",itemScrollView);
gradientOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(225,44,550,10));
objj_msgSend(gradientOverlay,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","itemScrollShadow.png"),CGSizeMake(10,10))));
itemView=objj_msgSend(objj_msgSend(ItemView,"alloc"),"initWithFrame:",CGRectMake(225,44,565,481));
objj_msgSend(itemView,"setLocationController:",_2e);
objj_msgSend(contain,"addSubview:",itemView);
objj_msgSend(contain,"addSubview:",gradientOverlay);
editButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(520,9,30,24));
var _31=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton.png"),CGSizeMake(18,18));
objj_msgSend(editButton,"setImage:",_31);
objj_msgSend(editButton,"setTarget:",itemView);
objj_msgSend(editButton,"setAction:",sel_getUid("toggleEditMode:"));
objj_msgSend(editButton,"setImagePosition:",CPImageOnly);
objj_msgSend(editButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(editButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",editButton);
uploadButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(480,9,30,24));
objj_msgSend(uploadButton,"setTitle:","⇧");
objj_msgSend(uploadButton,"setTarget:",itemView);
objj_msgSend(uploadButton,"setAction:",sel_getUid("uploadAttachment:"));
objj_msgSend(uploadButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(uploadButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",uploadButton);
deleteButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(440,9,30,24));
var _31=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","deletebutton.png"),CGSizeMake(14,18));
objj_msgSend(deleteButton,"setImage:",_31);
objj_msgSend(deleteButton,"setTarget:",_2b);
objj_msgSend(deleteButton,"setAction:",sel_getUid("deleteItemPushed:"));
objj_msgSend(deleteButton,"setImagePosition:",CPImageOnly);
objj_msgSend(deleteButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(deleteButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",deleteButton);
objj_msgSend(_2b,"showNoItemsView");
}
return _2b;
}
}),new objj_method(sel_getUid("setLocationTitle:"),function(_32,_33,_34){
with(_32){
objj_msgSend(locationTitle,"setStringValue:",_34);
objj_msgSend(locationTitle,"sizeToFit");
}
}),new objj_method(sel_getUid("setActiveItem:"),function(_35,_36,_37){
with(_35){
objj_msgSend(objj_msgSend(viewController,"itemController"),"setItem:",_37);
if(!_37){
objj_msgSend(itemTableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
}
}
}),new objj_method(sel_getUid("showNoItemsView"),function(_38,_39){
with(_38){
if(!noItemsView){
noItemsView=objj_msgSend(CPTextField,"new");
objj_msgSend(noItemsView,"setStringValue:","No Items");
objj_msgSend(noItemsView,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(noItemsView,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","666666"));
objj_msgSend(noItemsView,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(noItemsView,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(noItemsView,"sizeToFit");
var _3a=objj_msgSend(_38,"convertRect:fromView:",objj_msgSend(itemTableView,"rectOfRow:",4),itemTableView);
objj_msgSend(noItemsView,"setCenter:",CGPointMake(CGRectGetMidX(_3a),CGRectGetMidY(_3a)));
}
objj_msgSend(_38,"addSubview:",noItemsView);
}
}),new objj_method(sel_getUid("hideNoItemsView"),function(_3b,_3c){
with(_3b){
objj_msgSend(noItemsView,"removeFromSuperview");
}
}),new objj_method(sel_getUid("deleteItemPushed:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(objj_msgSend(viewController,"location"),"itemAtIndex:",objj_msgSend(objj_msgSend(itemTableView,"selectedRowIndexes"),"firstIndex"));
objj_msgSend(viewController,"confirmRemovalOfItem:",_40);
}
}),new objj_method(sel_getUid("switchViews:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(_43,"selectedSegment");
if(_44===0){
objj_msgSend(collectionViewScrollView,"removeFromSuperview");
objj_msgSend(contain,"addSubview:",itemScrollView);
objj_msgSend(topArea,"setFrame:",CGRectMake(225,0,565,44));
objj_msgSend(itemViewScrollView,"setFrameOrigin:",CGPointMake(225,44));
objj_msgSend(backToItemsButton,"removeFromSuperview");
objj_msgSend(itemView,"setWidth:",565);
objj_msgSend(gradientOverlay,"setFrame:",CGRectMake(225,44,550,10));
objj_msgSend(contain,"addSubview:",gradientOverlay);
}else{
objj_msgSend(itemScrollView,"removeFromSuperview");
objj_msgSend(topArea,"setFrame:",CGRectMake(790,0,790,44));
var _45=objj_msgSend(itemView,"frame");
objj_msgSend(itemView,"setFrame:",CGRectMake(790,_45.origin.y,790,481));
objj_msgSend(itemView,"setWidth:",775);
if(!backToItemsButton){
backToItemsButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(15,9,70,24));
objj_msgSend(backToItemsButton,"setTitle:","Back");
objj_msgSend(backToItemsButton,"setAction:",sel_getUid("animateToCollectionView:"));
objj_msgSend(backToItemsButton,"setTarget:",_41);
}
objj_msgSend(topArea,"addSubview:",backToItemsButton);
if(!collectionViewScrollView){
collectionViewScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,790,525));
objj_msgSend(collectionViewScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(collectionViewScrollView,"setAutohidesScrollers:",YES);
var _46=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_46,"setView:",objj_msgSend(objj_msgSend(ItemCell,"alloc"),"initWithFrame:",CGRectMakeZero()));
collectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,775,510));
objj_msgSend(collectionView,"setMinItemSize:",CGSizeMake(131,155));
objj_msgSend(collectionView,"setMaxItemSize:",CGSizeMake(131,155));
objj_msgSend(collectionView,"setVerticalMargin:",3);
objj_msgSend(collectionView,"setDelegate:",_41);
objj_msgSend(collectionView,"setItemPrototype:",_46);
objj_msgSend(collectionViewScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
objj_msgSend(collectionView,"setAllowsMultipleSelection:",YES);
objj_msgSend(collectionViewScrollView,"setDocumentView:",collectionView);
objj_msgSend(collectionView,"setContent:",objj_msgSend(objj_msgSend(viewController,"location"),"items"));
}
objj_msgSend(itemView,"enterEditMode:",NO);
objj_msgSend(collectionViewScrollView,"setFrameOrigin:",CGPointMake(0,0));
objj_msgSend(contain,"addSubview:",collectionViewScrollView);
objj_msgSend(gradientOverlay,"setFrame:",CGRectMake(0,44,775,10));
objj_msgSend(gradientOverlay,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_47,_48,_49,_4a){
with(_47){
if(objj_msgSend(animation,"isAnimating")){
return;
}
objj_msgSend(itemTableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_4a),NO);
var _4b=objj_msgSend(collectionViewScrollView,"frame"),_4c=objj_msgSend(itemView,"frame"),_4d=objj_msgSend(topArea,"frame"),_4e=CGRectMake(_4b.origin.x-_4b.size.width,_4b.origin.y,_4b.size.width,_4b.size.height),_4f=CGRectMake(_4b.origin.x,_4c.origin.y,_4c.size.width,_4c.size.height),_50=CGRectMake(_4b.origin.x,_4d.origin.y,_4d.size.width,_4d.size.height);
var _51=objj_msgSend(CPDictionary,"new");
objj_msgSend(_51,"setValue:forKey:",collectionViewScrollView,CPViewAnimationTargetKey);
objj_msgSend(_51,"setValue:forKey:",_4b,CPViewAnimationStartFrameKey);
objj_msgSend(_51,"setValue:forKey:",_4e,CPViewAnimationEndFrameKey);
objj_msgSend(_51,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _52=objj_msgSend(CPDictionary,"new");
objj_msgSend(_52,"setValue:forKey:",itemView,CPViewAnimationTargetKey);
objj_msgSend(_52,"setValue:forKey:",_4c,CPViewAnimationStartFrameKey);
objj_msgSend(_52,"setValue:forKey:",_4f,CPViewAnimationEndFrameKey);
objj_msgSend(_52,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _53=objj_msgSend(CPDictionary,"new");
objj_msgSend(_53,"setValue:forKey:",topArea,CPViewAnimationTargetKey);
objj_msgSend(_53,"setValue:forKey:",_4d,CPViewAnimationStartFrameKey);
objj_msgSend(_53,"setValue:forKey:",_50,CPViewAnimationEndFrameKey);
objj_msgSend(_53,"setValue:forKey:",nil,CPViewAnimationEffectKey);
animation=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_51,_52,_53]);
objj_msgSend(animation,"setDuration:",0.3);
objj_msgSend(animation,"setDelegate:",_47);
objj_msgSend(animation,"startAnimation");
window.setTimeout(function(){
},1);
}
}),new objj_method(sel_getUid("animateToCollectionView:"),function(_54,_55,_56){
with(_54){
if(objj_msgSend(animation,"isAnimating")){
return;
}
var _57=objj_msgSend(collectionViewScrollView,"frame"),_58=objj_msgSend(itemView,"frame"),_59=objj_msgSend(topArea,"frame"),_5a=CGRectMake(_57.origin.x+_57.size.width,_57.origin.y,_57.size.width,_57.size.height),_5b=CGRectMake(840,_58.origin.y,790,481),_5c=CGRectMake(840,_59.origin.y,790,44);
var _5d=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5d,"setValue:forKey:",collectionViewScrollView,CPViewAnimationTargetKey);
objj_msgSend(_5d,"setValue:forKey:",_57,CPViewAnimationStartFrameKey);
objj_msgSend(_5d,"setValue:forKey:",_5a,CPViewAnimationEndFrameKey);
objj_msgSend(_5d,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _5e=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5e,"setValue:forKey:",itemView,CPViewAnimationTargetKey);
objj_msgSend(_5e,"setValue:forKey:",_58,CPViewAnimationStartFrameKey);
objj_msgSend(_5e,"setValue:forKey:",_5b,CPViewAnimationEndFrameKey);
objj_msgSend(_5e,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _5f=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5f,"setValue:forKey:",topArea,CPViewAnimationTargetKey);
objj_msgSend(_5f,"setValue:forKey:",_59,CPViewAnimationStartFrameKey);
objj_msgSend(_5f,"setValue:forKey:",_5c,CPViewAnimationEndFrameKey);
objj_msgSend(_5f,"setValue:forKey:",nil,CPViewAnimationEffectKey);
animation=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_5d,_5e,_5f]);
objj_msgSend(animation,"setDuration:",0.3);
objj_msgSend(animation,"setDelegate:",_54);
objj_msgSend(animation,"startAnimation");
objj_msgSend(gradientOverlay,"removeFromSuperview");
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_60,_61,_62,_63){
with(_60){
return ["ItemDragType"];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_64,_65,_66,_67,_68){
with(_64){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_67);
}
}),new objj_method(sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"),function(_69,_6a,_6b,_6c){
with(_69){
return NO;
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemDataView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("itemName"),new objj_ivar("itemMaker"),new objj_ivar("attachments")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_6d,_6e,_6f){
with(_6d){
_6d=objj_msgSendSuper({receiver:_6d,super_class:objj_getClass("ItemDataView").super_class},"initWithFrame:",_6f);
if(_6d){
itemName=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(8,3,_6f.size.width-45,20));
objj_msgSend(itemName,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","4c4c4c"));
objj_msgSend(itemName,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(itemName,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(itemName,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",16));
objj_msgSend(_6d,"addSubview:",itemName);
itemMaker=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(8,22,_6f.size.width-45,20));
objj_msgSend(itemMaker,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(itemMaker,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_6d,"addSubview:",itemMaker);
attachments=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_6f.size.width-25,5,22,23));
objj_msgSend(attachments,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/Attachment.png"),CGSizeMake(22,23)));
objj_msgSend(_6d,"addSubview:",attachments);
}
return _6d;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_70,_71,_72){
with(_70){
objj_msgSend(itemName,"setStringValue:",objj_msgSend(_72,"valueForKey:","name"));
objj_msgSend(itemMaker,"setStringValue:",objj_msgSend(_72,"valueForKey:","maker"));
objj_msgSend(attachments,"setHidden:",!objj_msgSend(_72,"valueForKey:","attachments"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_75,"encodeObject:forKey:",itemName,"ItemName");
objj_msgSend(_75,"encodeObject:forKey:",itemMaker,"ItemMaker");
objj_msgSend(_75,"encodeObject:forKey:",attachments,"Attachments");
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("ItemDataView").super_class},"encodeWithCoder:",_75);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_76,_77,_78){
with(_76){
_76=objj_msgSendSuper({receiver:_76,super_class:objj_getClass("ItemDataView").super_class},"initWithCoder:",_78);
if(_76){
itemName=objj_msgSend(_78,"decodeObjectForKey:","ItemName");
itemMaker=objj_msgSend(_78,"decodeObjectForKey:","ItemMaker");
attachments=objj_msgSend(_78,"decodeObjectForKey:","Attachments");
}
return _76;
}
})]);
var _1=objj_allocateClassPair(CPTableView,"ItemViewTableView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("menuForEvent:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""),_7d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Remove Item",sel_getUid("removeItem:"),nil),_7e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Add Item",sel_getUid("addNewItem:"),nil),_7f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","View Item",sel_getUid("newSelectRow:"),nil),_80=objj_msgSend(_79,"convertPoint:fromView:",objj_msgSend(_7b,"locationInWindow"),nil),row=objj_msgSend(_79,"rowAtPoint:",_80);
objj_msgSend(_7d,"setTarget:",_79);
objj_msgSend(_7e,"setTarget:",objj_msgSend(_79,"delegate"));
objj_msgSend(_7f,"setTarget:",_79);
objj_msgSend(_7d,"setRepresentedObject:",row);
objj_msgSend(_7f,"setRepresentedObject:",row);
if(row<0){
objj_msgSend(_7d,"setEnabled:",NO);
objj_msgSend(_7f,"setEnabled:",NO);
}
objj_msgSend(_7c,"addItem:",_7d);
objj_msgSend(_7c,"addItem:",_7f);
objj_msgSend(_7c,"addItem:",_7e);
return _7c;
}
}),new objj_method(sel_getUid("newSelectRow:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"_noteSelectionIsChanging");
var _84=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_83,"representedObject"));
objj_msgSend(_81,"selectRowIndexes:byExtendingSelection:",_84,NO);
objj_msgSend(_81,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("removeItem:"),function(_85,_86,_87){
with(_85){
var _88=objj_msgSend(objj_msgSend(objj_msgSend(_85,"delegate"),"location"),"itemAtIndex:",objj_msgSend(_87,"representedObject"));
objj_msgSend(objj_msgSend(_85,"delegate"),"confirmRemovalOfItem:",_88);
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("make"),new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("bgColor"),new objj_ivar("selectedBGColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_89,_8a,_8b){
with(_89){
if(!borderOverlay){
var _8c=objj_msgSend(CPBundle,"mainBundle");
bgColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-0.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-2.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-3.png"),CGSizeMake(5,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-5.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-6.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-7.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-8.png"),CGSizeMake(5,5))]));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(5,5,121,121));
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(5,5,121,121));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_89,"addSubview:",image);
objj_msgSend(_89,"addSubview:",borderOverlay);
name=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(5,126,121,24));
objj_msgSend(name,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(name,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(name,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(name,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_89,"addSubview:",name);
make=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(5,140,121,24));
objj_msgSend(make,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(make,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(make,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(make,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_89,"addSubview:",make);
}
objj_msgSend(image,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:","Resources/ItemCellView/iPhone-test-image.png",objj_msgSend(_89,"scaleImageWithSize:",CGSizeMake(578,397))));
objj_msgSend(make,"setStringValue:",objj_msgSend(_8b,"make"));
objj_msgSend(name,"setStringValue:",objj_msgSend(_8b,"name"));
}
}),new objj_method(sel_getUid("setSelected:"),function(_8d,_8e,_8f){
with(_8d){
var _90=objj_msgSend(CPBundle,"mainBundle");
if(!selectedBGColor){
selectedBGColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-0.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-1.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-2.png"),CGSizeMake(8,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-3.png"),CGSizeMake(9,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-5.png"),CGSizeMake(8,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-6.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-7.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-8.png"),CGSizeMake(8,9))]));
}
if(_8f){
objj_msgSend(borderOverlay,"setBackgroundColor:",selectedBGColor);
}else{
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
}
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_91,_92,_93){
with(_91){
var _94=121,_95=_93.height,_96=_93.width,_97=MAX(_94/_96,_94/_95);
_96=_97*_96;
_95=_97*_95;
return CGSizeMake(_96,_95);
}
})]);
var _1=objj_allocateClassPair(CPView,"TopView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_98,_99,_9a){
with(_98){
var _9b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_9b,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _9c=[CGPointMake(15,43.5),CGPointMake(_9a.size.width-30,43.5)];
CGContextStrokeLineSegments(_9b,_9c,2);
}
})]);
p;22;LPCardFlipController.jt;6320;@STATIC;1.0;I;21;Foundation/CPObject.ji;17;LPViewAnimation.jt;6253;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("LPViewAnimation.j",YES);
var _1=nil,_2=NO;
var _3=objj_allocateClassPair(CPObject,"LPCardFlipController"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("containerWindow"),new objj_ivar("mainWindow"),new objj_ivar("animationDuration"),new objj_ivar("startCenter"),new objj_ivar("endCenter"),new objj_ivar("frontView"),new objj_ivar("backView")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("delegate"),function(_5,_6){
with(_5){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7,_8,_9){
with(_7){
_delegate=_9;
}
}),new objj_method(sel_getUid("frontView"),function(_a,_b){
with(_a){
return frontView;
}
}),new objj_method(sel_getUid("setFrontView:"),function(_c,_d,_e){
with(_c){
frontView=_e;
}
}),new objj_method(sel_getUid("backView"),function(_f,_10){
with(_f){
return backView;
}
}),new objj_method(sel_getUid("setBackView:"),function(_11,_12,_13){
with(_11){
backView=_13;
}
}),new objj_method(sel_getUid("init"),function(_14,_15){
with(_14){
if(_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPCardFlipController").super_class},"init")){
_2=LPTestCSSFeature("BackfaceVisibility");
containerWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
var _16=objj_msgSend(containerWindow,"contentView");
var _17=_16._DOMElement;
_17.style["-webkit-transform-style"]="preserve-3d";
_17.style["-webkit-perspective"]="600";
animationDuration=0.65;
}
return _14;
}
}),new objj_method(sel_getUid("setStartCenter:endCenter:"),function(_18,_19,_1a,_1b){
with(_18){
startCenter=_1a;
endCenter=_1b;
}
}),new objj_method(sel_getUid("reverseFlipCurrentView"),function(_1c,_1d){
with(_1c){
objj_msgSend(_1c,"flipWithView:backView:reverse:",frontView,backView,YES);
}
}),new objj_method(sel_getUid("flipWithView:backView:"),function(_1e,_1f,_20,_21){
with(_1e){
objj_msgSend(_1e,"flipWithView:backView:reverse:",_20,_21,NO);
}
}),new objj_method(sel_getUid("flipWithView:backView:reverse:"),function(_22,_23,_24,_25,_26){
with(_22){
mainWindow=objj_msgSend(_24,"window");
var _27=objj_msgSend(_24,"superview");
if(_2){
if(_25!==backView){
_25._DOMElement.style["-webkit-transform"]="rotateY(180deg)";
}
frontView=_24;
backView=_25;
objj_msgSend(containerWindow,"makeKeyAndOrderFront:",nil);
var _28=objj_msgSend(containerWindow,"contentView");
var _29=objj_msgSend(_25,"frame").size;
_29.height+=200;
objj_msgSend(containerWindow,"setFrameSize:",_29);
objj_msgSend(_22,"prepareViewWithCSS:",frontView);
objj_msgSend(frontView,"setCenter:",objj_msgSend(_28,"center"));
objj_msgSend(_22,"prepareViewWithCSS:",backView);
objj_msgSend(backView,"setCenter:",objj_msgSend(_28,"center"));
objj_msgSend(_28,"setSubviews:",[frontView,backView]);
var _2a=objj_msgSend(objj_msgSend(containerWindow,"contentView"),"bounds");
var _2b=CGPointMakeCopy(_26?endCenter:startCenter);
_2b.x-=CGRectGetMidX(_2a);
_2b.y-=CGRectGetMidY(_2a);
var _2c=CGPointMakeCopy(_26?startCenter:endCenter);
_2c.x-=CGRectGetMidX(_2a);
_2c.y-=CGRectGetMidY(_2a);
objj_msgSend(containerWindow,"setFrameOrigin:",_2b);
var _2d=objj_msgSend(objj_msgSend(LPViewAnimation,"alloc"),"initWithViewAnimations:",[{"target":containerWindow,"animations":[[LPOriginAnimationKey,objj_msgSend(containerWindow,"frame").origin,_2c]]}]);
objj_msgSend(_2d,"setShouldUseCSSAnimations:",YES);
objj_msgSend(_2d,"setAnimationCurve:",CPAnimationEaseInOut);
objj_msgSend(_2d,"setDuration:",animationDuration);
var _2e=CGRectGetWidth(objj_msgSend(frontView,"bounds")),_2f=CGRectGetWidth(objj_msgSend(backView,"bounds"));
backView._DOMElement.style["-webkit-transform"]+=" scale("+(_2e/_2f)+")";
backView._DOMElement.style["opacity"]=_26?1:0;
setTimeout(function(){
objj_msgSend(_2d,"startAnimation");
var _30="rotateY("+(_26?0:-180)+"deg) ",_31="scale("+(_26?1:_2f/_2e)+")";
frontView._DOMElement.style["-webkit-transform"]=_30+_31;
var _30="rotateY("+(_26?180:0)+"deg) ",_31="scale("+(_26?_2e/_2f:1)+")";
backView._DOMElement.style["-webkit-transform"]=_30+_31;
setTimeout(function(){
frontView._DOMElement.style["opacity"]=_26?1:0;
backView._DOMElement.style["opacity"]=_26?0:1;
},(1000*animationDuration)/2);
setTimeout(function(){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("cardFlipDidFinish:"))){
objj_msgSend(_delegate,"cardFlipDidFinish:",_22);
}
objj_msgSend(_22,"removeTransformFromView:",backView);
objj_msgSend(containerWindow,"orderOut:",nil);
},1000*animationDuration);
},0);
}else{
if(_26){
objj_msgSend(containerWindow,"orderOut:",nil);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("cardFlipDidFinish:"))){
objj_msgSend(_delegate,"cardFlipDidFinish:",_22);
}
}else{
backView=_25;
objj_msgSend(backView,"setFrameOrigin:",CGPointMakeZero());
var _29=objj_msgSend(backView,"frame").size;
objj_msgSend(containerWindow,"setFrameSize:",_29);
objj_msgSend(objj_msgSend(containerWindow,"contentView"),"setSubviews:",[backView]);
var _2c=CGPointMakeCopy(endCenter);
_2c.x-=CGRectGetMidX(objj_msgSend(objj_msgSend(containerWindow,"contentView"),"bounds"));
_2c.y-=CGRectGetMidY(objj_msgSend(objj_msgSend(containerWindow,"contentView"),"bounds"));
objj_msgSend(containerWindow,"setFrameOrigin:",_2c);
objj_msgSend(containerWindow,"orderFront:",nil);
}
}
}
}),new objj_method(sel_getUid("prepareViewWithCSS:"),function(_32,_33,_34){
with(_32){
var _35=_34._DOMElement;
_35.style["-webkit-transition-timing-function"]="ease-in-out";
_35.style["-webkit-transition-property"]="-webkit-transform";
_35.style["-webkit-transition-duration"]=animationDuration+"s";
_35.style["-webkit-backface-visibility"]="hidden";
}
}),new objj_method(sel_getUid("removeTransformFromView:"),function(_36,_37,_38){
with(_36){
var _39=_38._DOMElement;
_39.style["-webkit-transition-timing-function"]="";
_39.style["-webkit-transition-property"]="";
_39.style["-webkit-transition-duration"]="";
_39.style["-webkit-backface-visibility"]="";
_39.style["-webkit-transform"]="";
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedController"),function(_3a,_3b){
with(_3a){
if(!_1){
_1=objj_msgSend(objj_msgSend(_3a,"alloc"),"init");
}
return _1;
}
})]);
p;22;LPMultiLineTextField.jt;6187;@STATIC;1.0;I;20;AppKit/CPTextField.jt;6143;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_DOMTextareaElement"),function(_4,_5){
with(_4){
if(!_DOMTextareaElement){
_DOMTextareaElement=document.createElement("textarea");
_DOMTextareaElement.style.position="absolute";
_DOMTextareaElement.style.background="none";
_DOMTextareaElement.style.border="0";
_DOMTextareaElement.style.outline="0";
_DOMTextareaElement.style.zIndex="100";
_DOMTextareaElement.style.resize="none";
_DOMTextareaElement.style.padding="0";
_DOMTextareaElement.style.margin="0";
_DOMTextareaElement.style.overflow="hidden";
_DOMTextareaElement.onblur=function(){
objj_msgSend(objj_msgSend(_1,"window"),"makeFirstResponder:",nil);
_1=nil;
};
_4._DOMElement.appendChild(_DOMTextareaElement);
}
return _DOMTextareaElement;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithFrame:",_8)){
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
objj_msgSend(_9,"_DOMTextareaElement").style.cursor=_b?"cursor":"default";
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_b);
}
}),new objj_method(sel_getUid("selectText:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_c,"_DOMTextareaElement").select();
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_f,_10){
with(_f){
objj_msgSendSuper({receiver:_f,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _11=objj_msgSend(_f,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_11,"setHidden:",YES);
var _12=objj_msgSend(_f,"_DOMTextareaElement"),_13=objj_msgSend(_f,"currentValueForThemeAttribute:","content-inset"),_14=objj_msgSend(_f,"bounds");
_12.style.top=_13.top+"px";
_12.style.bottom=_13.bottom+"px";
_12.style.left=_13.left+"px";
_12.style.right=_13.right+"px";
_12.style.width=(CGRectGetWidth(_14)-_13.left-_13.right)+"px";
_12.style.height=(CGRectGetHeight(_14)-_13.top-_13.bottom)+"px";
_12.style.color=objj_msgSend(objj_msgSend(_f,"currentValueForThemeAttribute:","text-color"),"cssString");
_12.style.font=objj_msgSend(objj_msgSend(_f,"currentValueForThemeAttribute:","font"),"cssString");
_12.value=_stringValue||"";
}
}),new objj_method(sel_getUid("mouseDown:"),function(_15,_16,_17){
with(_15){
if(objj_msgSend(_15,"isEditable")&&objj_msgSend(_15,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_15,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_15,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_17);
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_18,_19,_1a){
with(_18){
if(objj_msgSend(_1a,"keyCode")===CPTabKeyCode){
if(objj_msgSend(_1a,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(objj_msgSend(_18,"window"),"selectPreviousKeyView:",_18);
}else{
objj_msgSend(objj_msgSend(_18,"window"),"selectNextKeyView:",_18);
}
if(objj_msgSend(objj_msgSend(objj_msgSend(_18,"window"),"firstResponder"),"respondsToSelector:",sel_getUid("selectText:"))){
objj_msgSend(objj_msgSend(objj_msgSend(_18,"window"),"firstResponder"),"selectText:",_18);
}
objj_msgSend(objj_msgSend(objj_msgSend(_18,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_18,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_1b,_1c,_1d){
with(_1b){
if(_stringValue!==objj_msgSend(_1b,"stringValue")){
_stringValue=objj_msgSend(_1b,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_1b,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_1b,nil));
}
objj_msgSend(_1b,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_1b,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_1b,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(objj_msgSend(objj_msgSend(_1e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
return YES;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_21,_22){
with(_21){
_stringValue=objj_msgSend(_21,"stringValue");
objj_msgSend(_21,"setThemeState:",CPThemeStateEditing);
setTimeout(function(){
objj_msgSend(_21,"_DOMTextareaElement").focus();
_1=_21;
},0);
objj_msgSend(_21,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_21,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_23,_24){
with(_23){
objj_msgSend(_23,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_23,"setStringValue:",objj_msgSend(_23,"stringValue"));
objj_msgSend(_23,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_23,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_23,nil));
if(objj_msgSend(_23,"sendsActionOnEndEditing")){
objj_msgSend(_23,"sendAction:to:",objj_msgSend(_23,"action"),objj_msgSend(_23,"target"));
}
}
objj_msgSend(_23,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_23,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_25,_26){
with(_25){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_27,_28,_29){
with(_27){
_stringValue=_29;
objj_msgSend(_27,"setNeedsLayout");
}
})]);
p;17;LPViewAnimation.jt;7924;@STATIC;1.0;I;21;Foundation/CPObject.jt;7879;
objj_executeFile("Foundation/CPObject.j",NO);
LPCSSAnimationsAreAvailable=NO;
var _1=["webkit","Moz","moz","o","ms"],_2=nil;
LPFadeAnimationKey="LPFadeAnimation";
LPFrameAnimationKey="LPFrameAnimation";
LPOriginAnimationKey="LPOriginAnimation";
LPTestCSSFeature=function(_3){
if(typeof document==="undefined"){
return NO;
}
if(!_2){
_2=document.createElement("div");
}
var _4=[_3];
for(var i=0;i<_1.length;i++){
_4.push(_1[i]+_3);
}
for(var i=0;i<_4.length;i++){
if(typeof _2.style[_4[i]]!=="undefined"){
return YES;
}
}
return NO;
};
LPCSSAnimationsAreAvailable=LPTestCSSFeature("AnimationName");
var _5=function(_6,_7,_8,_9){
if(_9){
_6.style[_8]=_6.style[_8]+", "+_7;
}else{
_6.style[_8]=_7;
}
};
var _a=objj_allocateClassPair(CPAnimation,"LPViewAnimation"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_isAnimating"),new objj_ivar("_viewAnimations"),new objj_ivar("_animationDidEndTimeout"),new objj_ivar("_shouldUseCSSAnimations")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("viewAnimations"),function(_c,_d){
with(_c){
return _viewAnimations;
}
}),new objj_method(sel_getUid("setViewAnimations:"),function(_e,_f,_10){
with(_e){
_viewAnimations=_10;
}
}),new objj_method(sel_getUid("shouldUseCSSAnimations"),function(_11,_12){
with(_11){
return _shouldUseCSSAnimations;
}
}),new objj_method(sel_getUid("setShouldUseCSSAnimations:"),function(_13,_14,_15){
with(_13){
_shouldUseCSSAnimations=_15;
}
}),new objj_method(sel_getUid("initWithViewAnimations:"),function(_16,_17,_18){
with(_16){
if(_16=objj_msgSend(_16,"initWithDuration:animationCurve:",1,CPAnimationLinear)){
_isAnimating=NO;
_viewAnimations=_18;
_shouldUseCSSAnimations=NO;
}
return _16;
}
}),new objj_method(sel_getUid("startAnimation"),function(_19,_1a){
with(_19){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
if(_isAnimating){
return;
}
_isAnimating=YES;
for(var i=0;i<_viewAnimations.length;i++){
var _1b=_viewAnimations[i],_1c=_1b["target"];
objj_msgSend(_19,"target:setCSSAnimationDuration:",_1c,_duration);
objj_msgSend(_19,"target:setCSSAnimationCurve:",_1c,_animationCurve);
for(var x=0;x<_1b["animations"].length;x++){
var _1d=_1b["animations"][x],_1e=_1d[0],_1f=_1d[1],end=_1d[2];
if(_1e===LPFadeAnimationKey){
objj_msgSend(_1c,"setAlphaValue:",_1f);
objj_msgSend(_19,"target:addCSSAnimationPropertyForKey:append:",_1c,_1e,x!==0);
setTimeout(function(_20,_21){
objj_msgSend(_20,"setAlphaValue:",_21);
},0,_1c,end);
}else{
if(_1e===LPOriginAnimationKey){
if(!CGPointEqualToPoint(_1f,end)){
objj_msgSend(_1c,"setFrameOrigin:",_1f);
objj_msgSend(_19,"target:addCSSAnimationPropertyForKey:append:",_1c,_1e,x!==0);
setTimeout(function(_22,_23,_24){
var x=_24.x-_23.x,y=_24.y-_23.y;
_22._DOMElement.style["-webkit-transform"]="translate("+x+"px, "+y+"px)";
setTimeout(function(){
objj_msgSend(_19,"_clearCSS");
_22._DOMElement.style["-webkit-transform"]="translate(0px, 0px)";
objj_msgSend(_22,"setFrameOrigin:",_24);
},(1000*_duration)+100);
},0,_1c,_1f,end);
}
}else{
if(_1e===LPFrameAnimationKey){
CPLog.error("LPViewAnimation does not currently support CSS frame animations. This should fall back to the regular javascript animation.");
}
}
}
}
}
if(_animationDidEndTimeout){
clearTimeout(_animationDidEndTimeout);
}
_animationDidEndTimeout=setTimeout(function(_25){
_isAnimating=NO;
objj_msgSend(_25,"_clearCSS");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_25);
}
},(1000*_duration)+100,_19);
}else{
for(var i=0;i<_viewAnimations.length;i++){
var _1b=_viewAnimations[i],_1c=_1b["target"];
for(var x=0;x<_1b["animations"].length;x++){
var _1d=_1b["animations"][x],_1e=_1d[0],_1f=_1d[1],end=_1d[2];
if(_1e===LPFadeAnimationKey){
objj_msgSend(_1c,"setAlphaValue:",_1f);
}else{
if(_1e===LPOriginAnimationKey){
objj_msgSend(_1c,"setFrameOrigin:",_1f);
}else{
if(_1e===LPFrameAnimationKey){
objj_msgSend(_1c,"setFrame:",_1f);
}
}
}
}
}
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("LPViewAnimation").super_class},"startAnimation");
}
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_26,_27,_28){
with(_26){
_progress=_28;
var _29=objj_msgSend(_26,"currentValue"),_2a=_viewAnimations.length;
for(var i=0;i<_2a;i++){
var _2b=_viewAnimations[i],_2c=_2b["target"];
for(var x=0;x<_2b["animations"].length;x++){
var _2d=_2b["animations"][x],_2e=_2d[0],_2f=_2d[1],end=_2d[2];
if(_2e===LPFadeAnimationKey){
objj_msgSend(_2c,"setAlphaValue:",(_29*(end-_2f))+_2f);
}else{
if(_2e===LPOriginAnimationKey){
objj_msgSend(_2c,"setFrameOrigin:",CGPointMake(_2f.x+(_29*(end.x-_2f.x)),_2f.y+(_29*(end.y-_2f.y))));
}else{
if(_2e===LPFrameAnimationKey){
objj_msgSend(_2c,"setFrame:",CGRectMake(_2f.origin.x+(_29*(end.origin.x-_2f.origin.x)),_2f.origin.y+(_29*(end.origin.y-_2f.origin.y)),_2f.size.width+(_29*(end.size.width-_2f.size.width)),_2f.size.height+(_29*(end.size.height-_2f.size.height))));
}
}
}
}
}
}
}),new objj_method(sel_getUid("currentValue"),function(_30,_31){
with(_30){
var c1=[],c2=[];
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",1,c1);
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",2,c2);
return _32(_progress,c1[0],c1[1],c2[0],c2[1],_duration);
}
}),new objj_method(sel_getUid("isAnimating"),function(_33,_34){
with(_33){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
return _isAnimating;
}else{
return objj_msgSendSuper({receiver:_33,super_class:objj_getClass("LPViewAnimation").super_class},"isAnimating");
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_35,_36){
with(_35){
if(LPCSSAnimationsAreAvailable&&_shouldUseCSSAnimations){
}else{
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("LPViewAnimation").super_class},"stopAnimation");
}
}
}),new objj_method(sel_getUid("_clearCSS"),function(_37,_38){
with(_37){
for(var i=0;i<_viewAnimations.length;i++){
_viewAnimations[i]["target"]._DOMElement.style["-webkit-transition-property"]="none";
}
}
}),new objj_method(sel_getUid("target:setCSSAnimationDuration:"),function(_39,_3a,_3b,_3c){
with(_39){
_3b._DOMElement.style["-webkit-transition-duration"]=_3c+"s";
}
}),new objj_method(sel_getUid("target:setCSSAnimationCurve:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=nil;
switch(_40){
case CPAnimationLinear:
_41="linear";
break;
case CPAnimationEaseIn:
_41="ease-in";
break;
case CPAnimationEaseOut:
_41="ease-out";
break;
case CPAnimationEaseInOut:
_41="ease-in-out";
break;
}
_3f._DOMElement.style["-webkit-transition-timing-function"]=_41;
}
}),new objj_method(sel_getUid("target:addCSSAnimationPropertyForKey:append:"),function(_42,_43,_44,_45,_46){
with(_42){
var _47=nil;
switch(_45){
case LPFadeAnimationKey:
_47="opacity";
break;
case LPOriginAnimationKey:
_47="-webkit-transform";
break;
case LPFrameAnimationKey:
_47="top, left, width, height";
break;
default:
_47="none";
}
_5(_44._DOMElement,_47,"-webkit-transition-property",_46);
}
})]);
var _32=_32=function(t,p1x,p1y,p2x,p2y,_48){
var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
sampleCurveX=function(t){
return ((ax*t+bx)*t+cx)*t;
};
sampleCurveY=function(t){
return ((ay*t+by)*t+cy)*t;
};
sampleCurveDerivativeX=function(t){
return (3*ax*t+2*bx)*t+cx;
};
solveEpsilon=function(_49){
return 1/(200*_49);
};
solve=function(x,_4a){
return sampleCurveY(solveCurveX(x,_4a));
};
solveCurveX=function(x,_4b){
var t0,t1,t2,x2,d2,i;
fabs=function(n){
if(n>=0){
return n;
}else{
return 0-n;
}
};
for(t2=x,i=0;i<8;i++){
x2=sampleCurveX(t2)-x;
if(fabs(x2)<_4b){
return t2;
}
d2=sampleCurveDerivativeX(t2);
if(fabs(d2)<0.000001){
break;
}
t2=t2-x2/d2;
}
t0=0;
t1=1;
t2=x;
if(t2<t0){
return t0;
}
if(t2>t1){
return t1;
}
while(t0<t1){
x2=sampleCurveX(t2);
if(fabs(x2-x)<_4b){
return t2;
}
if(x>x2){
t0=t2;
}else{
t1=t2;
}
t2=(t1-t0)*0.5+t0;
}
return t2;
};
cx=3*p1x;
bx=3*(p2x-p1x)-cx;
ax=1-cx-bx;
cy=3*p1y;
by=3*(p2y-p1y)-cy;
ay=1-cy-by;
return solve(t,solveEpsilon(_48));
};
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;11;MediaView.jt;8365;@STATIC;1.0;t;8346;
var _1=objj_allocateClassPair(CPView,"MediaView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("frontView"),new objj_ivar("backView"),new objj_ivar("attachment"),new objj_ivar("itemUsed"),new objj_ivar("pdfView"),new objj_ivar("imageView"),new objj_ivar("isFullScreen"),new objj_ivar("fullScreenButton"),new objj_ivar("infoButton"),new objj_ivar("deleteButton"),new objj_ivar("scrollView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MediaView").super_class},"initWithFrame:",_5);
if(_3){
frontView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,_5.size.width,_5.size.height));
objj_msgSend(_3,"addSubview:",frontView);
objj_msgSend(frontView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_5.size.width,_5.size.height-50));
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(scrollView,"setHorizontalLineScroll:",0.5);
objj_msgSend(scrollView,"setVerticalLineScroll:",0.5);
objj_msgSend(frontView,"addSubview:",scrollView);
var _6=objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD");
objj_msgSend(objj_msgSend(scrollView,"verticalScroller"),"setTheme:",_6);
objj_msgSend(objj_msgSend(scrollView,"horizontalScroller"),"setTheme:",_6);
fullScreenButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_5.size.width/2-202,_5.size.height-35,125,24));
objj_msgSend(fullScreenButton,"setTitle:","Full Screen");
objj_msgSend(fullScreenButton,"setTheme:",_6);
objj_msgSend(fullScreenButton,"setTarget:",_3);
objj_msgSend(fullScreenButton,"setAction:",sel_getUid("fullScreen:"));
objj_msgSend(fullScreenButton,"setKeyEquivalent:","f");
objj_msgSend(fullScreenButton,"setKeyEquivalentModifierMask:",CPCommandKeyMask);
objj_msgSend(fullScreenButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(frontView,"addSubview:",fullScreenButton);
infoButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_5.size.width/2-62,_5.size.height-35,125,24));
objj_msgSend(infoButton,"setTitle:","Info");
objj_msgSend(infoButton,"setTheme:",_6);
objj_msgSend(infoButton,"setTarget:",_3);
objj_msgSend(infoButton,"setAction:",sel_getUid("info:"));
objj_msgSend(infoButton,"setKeyEquivalent:","i");
objj_msgSend(infoButton,"setKeyEquivalentModifierMask:",CPCommandKeyMask);
objj_msgSend(infoButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(frontView,"addSubview:",infoButton);
deleteButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_5.size.width/2+77,_5.size.height-35,125,24));
objj_msgSend(deleteButton,"setTitle:","Delete");
objj_msgSend(deleteButton,"setTheme:",_6);
objj_msgSend(deleteButton,"setTarget:",_3);
objj_msgSend(deleteButton,"setAction:",sel_getUid("confirmDelete:"));
objj_msgSend(deleteButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(frontView,"addSubview:",deleteButton);
}
return _3;
}
}),new objj_method(sel_getUid("fullScreen:"),function(_7,_8,_9){
with(_7){
if(objj_msgSend(_7,"isInFullScreenMode")){
objj_msgSend(_7,"exitFullScreenModeWithOptions:",nil);
objj_msgSend(fullScreenButton,"setTitle:","Full Screen");
}else{
objj_msgSend(_7,"enterFullScreenMode:withOptions:",nil,nil);
objj_msgSend(fullScreenButton,"setTitle:","Exit Full Screen");
}
}
}),new objj_method(sel_getUid("info:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(frontView,"frame"),_e=CGPointMake(0,_d.size.height),_f=CGPointMake(0,0);
backView=objj_msgSend(objj_msgSend(MediaInfoView,"alloc"),"initWithFrame:",CGRectMake(_e.x,_e.y,_d.size.width,_d.size.height));
objj_msgSend(backView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a,"addSubview:",backView);
var _10=objj_msgSend(LPCardFlipController,"sharedController"),_11=objj_msgSend(objj_msgSend(_a,"window"),"convertBaseToGlobal:",objj_msgSend(frontView,"convertPoint:toView:",objj_msgSend(frontView,"center"),nil));
objj_msgSend(_10,"setDelegate:",_a);
objj_msgSend(_10,"setStartCenter:endCenter:",_11,_11);
objj_msgSend(_10,"flipWithView:backView:reverse:",frontView,backView,NO);
}
}),new objj_method(sel_getUid("flipBackToMedia:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(LPCardFlipController,"sharedController"),_16=objj_msgSend(objj_msgSend(_12,"window"),"convertBaseToGlobal:",objj_msgSend(backView,"convertPoint:toView:",objj_msgSend(backView,"center"),nil));
objj_msgSend(_15,"setDelegate:",_12);
objj_msgSend(_15,"setStartCenter:endCenter:",_16,_16);
objj_msgSend(_15,"flipWithView:backView:reverse:",backView,frontView,NO);
}
}),new objj_method(sel_getUid("confirmDelete:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_1a,"setTitle:","Delete Attachment");
objj_msgSend(_1a,"setDelegate:",_17);
objj_msgSend(_1a,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_1a,"setMessageText:","Delete Attachment");
objj_msgSend(_1a,"setInformativeText:","Are you sure you want to delete "+objj_msgSend(attachment,"name")+"? This action cannot be undone.");
objj_msgSend(_1a,"addButtonWithTitle:","Delete");
objj_msgSend(_1a,"addButtonWithTitle:","Cancel");
objj_msgSend(_1a,"runModal");
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_1b,_1c,_1d,_1e){
with(_1b){
if(_1e){
return;
}
objj_msgSend(itemUsed,"removeAttachment:",attachment);
objj_msgSend(objj_msgSend(_1b,"window"),"orderOut:",_1b);
}
}),new objj_method(sel_getUid("setMedia:forItem:"),function(_1f,_20,_21,_22){
with(_1f){
attachment=_21;
itemUsed=_22;
var _23=objj_msgSend(attachment,"type");
switch(_23){
case "image":
var _24=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,1000,1000)),_25=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_21,"data"),CGSizeMake(1000,1000));
objj_msgSend(_24,"setImage:",_25);
objj_msgSend(scrollView,"setDocumentView:",_24);
break;
case "pdf":
var _26=objj_msgSend(objj_msgSend(CPWebView,"alloc"),"initWithFrame:",objj_msgSend(scrollView,"frame"));
objj_msgSend(_26,"setMainFrameURL:","mysamplepdf.pdf");
objj_msgSend(_26,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(scrollView,"removeFromSuperview");
objj_msgSend(frontView,"addSubview:",_26);
break;
case "video":
break;
case "audio":
break;
case "document":
break;
case "other":
break;
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_27,_28,_29){
with(_27){
if(objj_msgSend(_29,"keyCode")===CPEscapeKeyCode&&objj_msgSend(_27,"isInFullScreenMode")){
objj_msgSend(_27,"fullScreen:",nil);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_2a,_2b){
with(_2a){
return YES;
}
}),new objj_method(sel_getUid("cardFlipDidFinish:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(objj_msgSend(_2e,"frontView"),"removeFromSuperview");
objj_msgSend(_2c,"addSubview:",objj_msgSend(_2e,"backView"));
objj_msgSend(objj_msgSend(_2e,"backView"),"setFrameOrigin:",CGPointMakeZero());
}
})]);
var _1=objj_allocateClassPair(CPView,"MediaInfoView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("nameField")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_2f,_30,_31){
with(_2f){
_2f=objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("MediaInfoView").super_class},"initWithFrame:",_31);
if(_2f){
var _32=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,30,30,30));
objj_msgSend(_32,"setStringValue:","File Name:");
objj_msgSend(_32,"sizeToFit");
objj_msgSend(_32,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_32,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_2f,"addSubview:",_32);
nameField=objj_msgSend(LocationEditView,"customTextField");
objj_msgSend(nameField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_32,"frame"))+5,25,165,30));
objj_msgSend(nameField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(nameField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_2f,"addSubview:",nameField);
}
return _2f;
}
})]);
p;12;MKLocation.jt;2001;@STATIC;1.0;t;1982;
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
p;17;NATokenTextView.jt;46476;@STATIC;1.0;I;21;Foundation/CPObject.jt;46430;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPView,"NATokenTextView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_labelToHaveWithOfText"),new objj_ivar("_tokenViews"),new objj_ivar("_selectedIndexes"),new objj_ivar("_anchor"),new objj_ivar("_theScrollView"),new objj_ivar("_containerView"),new objj_ivar("_anchorIndex"),new objj_ivar("_maxAnchorIndex"),new objj_ivar("_minHeight"),new objj_ivar("_maxHeight"),new objj_ivar("_delegate"),new objj_ivar("_DOMInputElement"),new objj_ivar("_tokenOrigin"),new objj_ivar("_selectionBackground1"),new objj_ivar("_selectionBackground2"),new objj_ivar("_selectionBackground3"),new objj_ivar("editable"),new objj_ivar("bezeled")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("editable"),function(_3,_4){
with(_3){
return editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_5,_6,_7){
with(_5){
editable=_7;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_8,_9,_a){
with(_8){
bezeled=_a;
objj_msgSend(_8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("NATokenTextView").super_class},"initWithFrame:",_d);
if(_b){
editable=YES;
bezeled=YES;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tokenViews=[];
_tokenOrigin=nil;
_maxHeight=1000;
_theScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_d.size.width,_d.size.height));
objj_msgSend(_theScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(_theScrollView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(_b,"addSubview:",_theScrollView);
_containerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,1,15));
objj_msgSend(_theScrollView,"setDocumentView:",_containerView);
_containerView._DOMElement.style.cursor="text";
_DOMInputElement=document.createElement("input");
_DOMInputElement.style.position="absolute";
_DOMInputElement.style.zIndex="-1000";
_DOMInputElement.style.opacity="0";
_DOMInputElement.style.filter="alpha(opacity=0)";
_DOMInputElement.onfocus=function(){
objj_msgSend(_b,"becomeFirstResponder");
};
_DOMInputElement.onblur=function(){
objj_msgSend(_b,"resignFirstResponder");
};
_containerView._DOMElement.appendChild(_DOMInputElement);
_minHeight=_d.size.height;
objj_msgSend(_b,"setThemeState:",CPThemeStateBezeled);
_labelToHaveWithOfText=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_labelToHaveWithOfText,"setHidden:",YES);
objj_msgSend(_labelToHaveWithOfText,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_labelToHaveWithOfText,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_containerView,"addSubview:",_labelToHaveWithOfText);
_selectionBackground1=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground1,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground1);
_selectionBackground2=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground2,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground2);
_selectionBackground3=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground3);
_anchorIndex=0;
_maxAnchorIndex=0;
_anchor=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,1,15));
objj_msgSend(_anchor,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_containerView,"addSubview:",_anchor);
}
return _b;
}
}),new objj_method(sel_getUid("_createTokenTextField"),function(_e,_f){
with(_e){
var _10=objj_msgSend(objj_msgSend(NATokenTextField,"alloc"),"init");
objj_msgSend(_containerView,"addSubview:",_10);
return _10;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"isEqualToIndexSet:",_selectionIndexes)){
return;
}
var _14={from:objj_msgSend(_13,"firstIndex"),to:objj_msgSend(_13,"lastIndex")};
var i,_15,_16=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_15=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_15,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
if(_16>=_14.from&&_16<=_14.to){
objj_msgSend(_15,"setSelected:",YES);
}else{
objj_msgSend(_15,"setSelected:",NO);
}
}
if(objj_msgSend(_15,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_16+=objj_msgSend(objj_msgSend(_15,"stringValue"),"length");
}else{
_16+=1;
}
}
_selectionIndexes=_13;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeSelection:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeSelection:",_11);
}
objj_msgSend(_11,"setNeedsLayout");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_17,_18){
with(_17){
return editable;
}
}),new objj_method(sel_getUid("_updateAutoCompletion"),function(_19,_1a){
with(_19){
if(objj_msgSend(_19,"_currentTokenTextField")==nil){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCurrentTokenDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewCurrentTokenDidChange:",_19);
}
}
}),new objj_method(sel_getUid("_charDown:"),function(_1b,_1c,_1d){
with(_1b){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_1b,"_removeTokens:",_selectionIndexes);
}
var pos=objj_msgSend(_1b,"_indexForAnchorIndex:",_anchorIndex);
objj_msgSend(objj_msgSend(_1b,"_currentTokenTextField"),"addStringToStringValue:atIndex:",_1d,pos.offset);
_anchorIndex+=objj_msgSend(_1d,"length");
objj_msgSend(_1b,"_processMaxAnchorIndex");
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"_updateAutoCompletion");
}
}),new objj_method(sel_getUid("keyUp:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"keyCode")==86&&(objj_msgSend(_20,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_20,"modifierFlags")&CPControlKeyMask)){
return;
}
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("NATokenTextView").super_class},"keyUp:",_20);
}
}),new objj_method(sel_getUid("keyDown:"),function(_21,_22,_23){
with(_21){
if(objj_msgSend(_23,"keyCode")==67&&(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)){
objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"setString:forType:",objj_msgSend(_21,"_stringForTokens:",_selectionIndexes),CPStringPboardType);
}else{
if(objj_msgSend(_23,"keyCode")==86&&(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)){
var _24=objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"stringForType:",CPStringPboardType);
window.setTimeout(function(){
_DOMInputElement.value="";
},0);
if(_24!=nil){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
var _24=objj_msgSend(_24,"componentsSeparatedByString:",",");
var i;
for(i=0;i<objj_msgSend(_24,"count");++i){
objj_msgSend(_21,"addToken:",objj_msgSend(_24,"objectAtIndex:",i));
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_21);
}
}
}else{
if(objj_msgSend(_23,"keyCode")==8){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
}else{
var pos=objj_msgSend(_21,"_indexForAnchorIndex:",_anchorIndex);
if(pos.offset==0){
if(pos.index-1>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex-1));
}
}else{
var _25=objj_msgSend(_21,"_currentTokenTextField");
objj_msgSend(_25,"removeCharAtIndex:",pos.offset);
if(objj_msgSend(objj_msgSend(_25,"stringValue"),"length")==0){
objj_msgSend(_tokenViews,"removeObject:",_25);
objj_msgSend(_25,"removeFromSuperview");
_25=nil;
}
_anchorIndex-=1;
objj_msgSend(_21,"_processMaxAnchorIndex");
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"_updateAutoCompletion");
}
}
}else{
if(objj_msgSend(_23,"keyCode")==46){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
}else{
var pos=objj_msgSend(_21,"_indexForAnchorIndex:",_anchorIndex);
var _25=objj_msgSend(_21,"_currentTokenTextField");
if(pos.offset==objj_msgSend(objj_msgSend(_25,"stringValue"),"length")){
if(_anchorIndex<=_maxAnchorIndex){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}else{
objj_msgSend(_25,"removeCharAtIndex:",pos.offset+1);
objj_msgSend(_21,"_processMaxAnchorIndex");
}
if(objj_msgSend(objj_msgSend(_25,"stringValue"),"length")==0){
objj_msgSend(_tokenViews,"removeObject:",_25);
objj_msgSend(_25,"removeFromSuperview");
_25=nil;
}
objj_msgSend(_21,"setNeedsLayout");
}
}else{
if(objj_msgSend(objj_msgSend(_23,"characters"),"compare:",",")==CPOrderedSame||objj_msgSend(_23,"keyCode")==13){
if(objj_msgSend(_23,"keyCode")==13&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCompletionForToken:"))){
var _26=objj_msgSend(_delegate,"tokenTextViewCompletionForToken:",_21);
if(_26==nil){
objj_msgSend(_21,"_addCurrentToken:",nil);
}else{
objj_msgSend(_21,"_addCurrentToken:",_26);
}
}else{
objj_msgSend(_21,"_addCurrentToken:",nil);
}
objj_msgSend(_21,"_updateAutoCompletion");
}else{
if(objj_msgSend(_23,"keyCode")==CPRightArrowKeyCode){
if(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask){
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_maxAnchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_anchorIndex,_maxAnchorIndex-_anchorIndex)));
}
}
_anchorIndex=_maxAnchorIndex;
objj_msgSend(_21,"setNeedsLayout");
}else{
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_anchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
if(_anchorIndex>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}
if(_anchorIndex<_maxAnchorIndex){
_anchorIndex+=1;
}
}else{
if(objj_msgSend(_selectionIndexes,"count")<=0){
if(_anchorIndex<_maxAnchorIndex){
_anchorIndex+=1;
}
}else{
_anchorIndex=objj_msgSend(_selectionIndexes,"lastIndex")+1;
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
objj_msgSend(_21,"setNeedsLayout");
}
}
}else{
if(objj_msgSend(_23,"keyCode")==CPLeftArrowKeyCode){
if(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask){
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",0);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_anchorIndex)));
}
}
_anchorIndex=0;
objj_msgSend(_21,"setNeedsLayout");
}else{
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(_anchorIndex>0){
_anchorIndex-=1;
}
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_anchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
if(_anchorIndex>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}
}else{
if(objj_msgSend(_selectionIndexes,"count")<=0){
if(_anchorIndex>0){
_anchorIndex-=1;
}
}else{
_anchorIndex=objj_msgSend(_selectionIndexes,"firstIndex");
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
objj_msgSend(_21,"setNeedsLayout");
}
}
}else{
if((objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)&&objj_msgSend(_23,"keyCode")==65){
objj_msgSend(_21,"selectAll");
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextView:keyDown:"))){
objj_msgSend(_delegate,"tokenTextView:keyDown:",_21,_23);
}
objj_msgSend(objj_msgSend(objj_msgSend(_21,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
window.setTimeout(function(){
if(_DOMInputElement.value!=""){
objj_msgSend(_21,"_charDown:",_DOMInputElement.value);
}
_DOMInputElement.value="";
},0);
}
}
}
}
}
}
}
}
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("NATokenTextView").super_class},"keyDown:",_23);
}
}),new objj_method(sel_getUid("selectAll"),function(_28,_29){
with(_28){
objj_msgSend(_28,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_maxAnchorIndex)));
}
}),new objj_method(sel_getUid("_mergeTokenTextFields"),function(_2a,_2b){
with(_2a){
var i=0,_2c,_2d=nil;
var _2e=[];
while(i<objj_msgSend(_tokenViews,"count")){
_2c=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
if(_2d!=nil){
objj_msgSend(_2d,"setStringValue:",objj_msgSend(_2d,"stringValue")+objj_msgSend(_2c,"stringValue"));
objj_msgSend(_2e,"addObject:",_2c);
}
_2d=_2c;
}else{
_2d=nil;
}
i+=1;
}
for(i=0;i<objj_msgSend(_2e,"count");++i){
var _2c=objj_msgSend(_2e,"objectAtIndex:",i);
objj_msgSend(_tokenViews,"removeObject:",_2c);
objj_msgSend(_2c,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("_stringForTokens:"),function(_2f,_30,_31){
with(_2f){
var _32=CPMakeRange(objj_msgSend(_31,"firstIndex"),objj_msgSend(_31,"lastIndex")-objj_msgSend(_31,"firstIndex")+1);
var i,_33,_34=0,_35=0,_36="";
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_33=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_35=_34;
if(objj_msgSend(_33,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_34+=objj_msgSend(objj_msgSend(_33,"stringValue"),"length");
}else{
_34+=1;
}
var _37=CPMakeRange(_35,_34-_35);
var _38=CPIntersectionRange(_32,_37);
if(_38.length>0){
if(objj_msgSend(_36,"compare:","")!=CPOrderedSame){
_36+=",";
}
if(objj_msgSend(_33,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
_36+=objj_msgSend(_33,"stringValue");
}else{
_36+=objj_msgSend(objj_msgSend(_33,"stringValue"),"substringWithRange:",CPMakeRange(_38.location-_34,_38.length));
}
}
}
return _36;
}
}),new objj_method(sel_getUid("_removeTokens:"),function(_39,_3a,_3b){
with(_39){
if(objj_msgSend(_3b,"count")<=0){
return;
}
var _3c=CPMakeRange(objj_msgSend(_3b,"firstIndex"),objj_msgSend(_3b,"lastIndex")-objj_msgSend(_3b,"firstIndex")+1);
var _3d=[],i,_3e,_3f=0,_40=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_3e=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_40=_3f;
if(objj_msgSend(_3e,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_3f+=objj_msgSend(objj_msgSend(_3e,"stringValue"),"length");
}else{
_3f+=1;
}
var _41=CPMakeRange(_40,_3f-_40);
var _42=CPIntersectionRange(_3c,_41);
if(_42.length>0){
if(objj_msgSend(_3e,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
objj_msgSend(_3d,"addObject:",_3e);
}else{
_42.location-=_40;
objj_msgSend(_3e,"removeFrom:to:",_42.location+1,_42.location+_42.length);
if(objj_msgSend(objj_msgSend(_3e,"stringValue"),"length")==0){
objj_msgSend(_3d,"addObject:",_3e);
}
}
}
}
for(i=0;i<objj_msgSend(_3d,"count");++i){
var _3e=objj_msgSend(_3d,"objectAtIndex:",i);
objj_msgSend(_tokenViews,"removeObject:",_3e);
objj_msgSend(_3e,"removeFromSuperview");
}
_anchorIndex=objj_msgSend(_3b,"firstIndex");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_39);
}
objj_msgSend(_39,"_mergeTokenTextFields");
objj_msgSend(_39,"_processMaxAnchorIndex");
objj_msgSend(_39,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}),new objj_method(sel_getUid("_addCurrentToken:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"_currentTokenTextField");
var _47=objj_msgSend(objj_msgSend(_46,"stringValue"),"trim");
if(objj_msgSend(_47,"length")<=0){
objj_msgSend(_tokenViews,"removeObject:",_46);
objj_msgSend(_46,"removeFromSuperview");
_46=nil;
return;
}
if(_45!=nil){
_47=_45;
}
var pos=objj_msgSend(_43,"_indexForAnchorIndex:",_anchorIndex);
var _48=objj_msgSend(_tokenViews,"indexOfObject:",_46);
objj_msgSend(_tokenViews,"removeObject:",_46);
objj_msgSend(_46,"removeFromSuperview");
var _49=objj_msgSend(objj_msgSend(NAToken,"alloc"),"initWithLabel:",_47);
objj_msgSend(_49,"setField:",_43);
objj_msgSend(_containerView,"addSubview:",_49);
objj_msgSend(_tokenViews,"insertObject:atIndex:",_49,_48);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_43);
}
_anchorIndex+=-pos.offset+1;
objj_msgSend(_43,"_processMaxAnchorIndex");
objj_msgSend(_43,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_currentTokenTextField"),function(_4a,_4b){
with(_4a){
var pos=objj_msgSend(_4a,"_indexForAnchorIndex:",_anchorIndex);
if(pos.index<objj_msgSend(_tokenViews,"count")){
var _4c=objj_msgSend(_tokenViews,"objectAtIndex:",pos.index);
if(objj_msgSend(_4c,"isKindOfClass:",NATokenTextField)){
return _4c;
}
}
var _4d=objj_msgSend(_4a,"_createTokenTextField");
objj_msgSend(_tokenViews,"insertObject:atIndex:",_4d,pos.index);
return _4d;
}
}),new objj_method(sel_getUid("_indexForAnchorIndex:"),function(_4e,_4f,_50){
with(_4e){
var i,_51=0,_52=0,_53,_54=NO,_55=0;
if(_50==0){
return {index:0,offset:0};
}
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_54=(i==objj_msgSend(_tokenViews,"count")-1);
_53=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_52=_51;
if(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_51+=objj_msgSend(objj_msgSend(_53,"stringValue"),"length");
_55=_50-_52;
}else{
_51+=1;
_55=0;
}
if(_54){
if(!objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
continue;
}
}else{
if(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NAToken,"class"))&&objj_msgSend(objj_msgSend(_tokenViews,"objectAtIndex:",i+1),"isKindOfClass:",objj_msgSend(NAToken,"class"))){
if(_50<=_51){
return {index:i+1,offset:_55};
}
}else{
if(objj_msgSend(objj_msgSend(_tokenViews,"objectAtIndex:",i+1),"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
continue;
}
}
}
if(_50<=_51){
return {index:i,offset:_55};
}
}
return {index:objj_msgSend(_tokenViews,"count"),offset:_55};
}
}),new objj_method(sel_getUid("_indexOfToken:"),function(_56,_57,_58){
with(_56){
var i,_59,_5a=0,_5b=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_59=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(_59==_58){
return _5a;
}
if(objj_msgSend(_59,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_5a+=objj_msgSend(objj_msgSend(_59,"stringValue"),"length");
}else{
_5a+=1;
}
}
return _5a;
}
}),new objj_method(sel_getUid("_tokenMouseDown:object:"),function(_5c,_5d,_5e,_5f){
with(_5c){
objj_msgSend(objj_msgSend(_5c,"window"),"makeFirstResponder:",_5c);
objj_msgSend(_5c,"_focusInput");
if(objj_msgSend(_5e,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_5e,"modifierFlags")&CPControlKeyMask||objj_msgSend(_5e,"modifierFlags")&CPShiftKeyMask){
var _60=objj_msgSend(_selectionIndexes,"copy"),_61=objj_msgSend(_5c,"_indexOfToken:",_5f);
objj_msgSend(_60,"addIndex:",_61);
objj_msgSend(_5c,"setSelectionIndexes:",_60);
}else{
objj_msgSend(_5c,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_5c,"_indexOfToken:",_5f)));
}
}
}),new objj_method(sel_getUid("_processMaxAnchorIndex"),function(_62,_63){
with(_62){
_maxAnchorIndex=0;
var i,_64;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_64=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_64,"isKindOfClass:",NATokenTextField)){
_maxAnchorIndex+=objj_msgSend(objj_msgSend(_64,"stringValue"),"length");
}else{
_maxAnchorIndex+=1;
}
}
}
}),new objj_method(sel_getUid("_anchorIndexWithPoint:"),function(_65,_66,_67){
with(_65){
var i,_68,_69=0,_6a=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_68=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_6a=_69;
if(objj_msgSend(_68,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_69+=objj_msgSend(objj_msgSend(_68,"stringValue"),"length");
}else{
_69+=1;
}
if(_67.y>=objj_msgSend(_68,"frame").origin.y&&_67.y<=objj_msgSend(_68,"frame").origin.y+22&&_67.x>=objj_msgSend(_68,"frame").origin.x-6&&_67.x<=objj_msgSend(_68,"frame").origin.x+6){
return _6a;
}
}
return _69;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6b,_6c,_6d){
with(_6b){
if(!editable){
return;
}
objj_msgSend(objj_msgSend(_6b,"window"),"makeFirstResponder:",_6b);
objj_msgSend(_6b,"_focusInput");
objj_msgSend(_6b,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
_anchorIndex=objj_msgSend(_6b,"_anchorIndexWithPoint:",objj_msgSend(_6b,"convertPoint:fromView:",objj_msgSend(_6d,"locationInWindow"),nil));
objj_msgSend(_6b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_6e,_6f){
with(_6e){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewBecomeFirstResponder:"))){
objj_msgSend(_delegate,"tokenTextViewBecomeFirstResponder:",_6e);
}
objj_msgSend(_6e,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_6e,"setNeedsLayout");
objj_msgSend(_6e,"_focusInput");
return YES;
}
}),new objj_method(sel_getUid("_focusInput"),function(_70,_71){
with(_70){
if(!editable){
return;
}
window.setTimeout(function(){
_DOMInputElement.focus();
},0);
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_72,_73){
with(_72){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewResignFirstResponder:"))){
objj_msgSend(_delegate,"tokenTextViewResignFirstResponder:",_72);
}
objj_msgSend(_72,"_addCurrentToken:",nil);
objj_msgSend(_72,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_72,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("_widthForText:"),function(_74,_75,str){
with(_74){
var _76=0;
if(objj_msgSend(str,"length")>0){
objj_msgSend(_labelToHaveWithOfText,"setStringValue:",str);
objj_msgSend(_labelToHaveWithOfText,"sizeToFit");
_76=objj_msgSend(_labelToHaveWithOfText,"frame").size.width;
}
return _76;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_77,_78){
with(_77){
if(bezeled){
objj_msgSend(_77,"setBackgroundColor:",objj_msgSend(_77,"currentValueForThemeAttribute:","bezel-color"));
}else{
objj_msgSend(_77,"setBackgroundColor:",nil);
}
objj_msgSend(_anchor,"setHidden:",!(objj_msgSend(_selectionIndexes,"count")<=0&&objj_msgSend(_77,"hasThemeState:",CPThemeStateEditing)));
var _79;
if(objj_msgSend(_selectionIndexes,"count")<=0){
_79=CPMakeRange(0,0);
}else{
_79=CPMakeRange(objj_msgSend(_selectionIndexes,"firstIndex")+1,objj_msgSend(_selectionIndexes,"lastIndex")-objj_msgSend(_selectionIndexes,"firstIndex")+1);
}
var i,_7a=8,_7b=4,_7c=objj_msgSend(_77,"frame").size.width-_7a*2-26,x=_7a,y=_7b,_7d=nil,_7e=16,_7f=0,_80=nil,_81=nil,_82=NO;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
var _83=_7f;
_7d=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_7f+=objj_msgSend(objj_msgSend(_7d,"stringValue"),"length");
}else{
_7f+=1;
}
if(x+objj_msgSend(_7d,"frame").size.width>_7c+_7a){
x=_7a;
y+=_7e+4;
}
objj_msgSend(_7d,"setFrameOrigin:",CGPointMake(x,y));
if(_79.length>0){
if(_80==nil&&_79.location>=_83&&_79.location<=_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_79.location-_83-1]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
if(i==0&&_84==0){
_84-=1;
}
_80=CGPointMake(x+_84,y);
}
if(_80&&_81==nil&&_79.location+_79.length<=_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_79.location+_79.length-_83-1]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
_81=CGPointMake(x+_84,y);
}
}
if(_anchorIndex>=_83&&_anchorIndex<_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_anchorIndex-_83]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
var _85=x-2+_84,_86=y+2;
objj_msgSend(_anchor,"setFrameOrigin:",CGPointMake(_85,_86));
}
if(_7f!=_83){
x+=objj_msgSend(_7d,"frame").size.width+3;
}
}
if(_80&&_81==nil){
_81=CGPointMake(x,y);
}
if(_anchorIndex>=_7f){
var _85=x-1,_86=y+2;
objj_msgSend(_anchor,"setFrameOrigin:",CGPointMake(_85,_86));
}
if(_80&&_81){
_80.x-=2;
var _7c=objj_msgSend(_77,"frame").size.width;
var h=20;
var w=_7c-_80.x-2;
_80.y-=2;
_81.y-=2;
if(_81.y==_80.y){
w=_81.x-_80.x-2;
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMake(_80.x,_80.y,w,h));
}else{
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMake(_80.x,_80.y,w,h));
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMake(2,_81.y,_81.x-4,h));
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMake(2,objj_msgSend(_selectionBackground1,"frame").origin.y+h,_7c-4,objj_msgSend(_selectionBackground3,"frame").origin.y-objj_msgSend(_selectionBackground1,"frame").origin.y-h));
}
}else{
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMakeZero());
}
y+=_7e+_7b;
if(y<_minHeight){
y=_minHeight;
}
actualH=objj_msgSend(_77,"frame").size.height;
objj_msgSend(_77,"setFrameSize:",CGSizeMake(objj_msgSend(_77,"frame").size.width,MIN(_maxHeight,y)));
objj_msgSend(_containerView,"setFrameSize:",CGSizeMake(objj_msgSend(_77,"frame").size.width-20,y));
objj_msgSend(objj_msgSend(_theScrollView,"contentView"),"scrollToPoint:",CGPointMake(0,y));
objj_msgSend(_theScrollView,"reflectScrolledClipView:",objj_msgSend(_theScrollView,"contentView"));
if(actualH!=y&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewFrameSizeDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewFrameSizeDidChange:",_77);
}
var _87=objj_msgSend(objj_msgSend(_77,"_currentTokenTextField"),"frame").origin;
if(_tokenOrigin!=_87){
_tokenOrigin=_87;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCurrentTokenOriginDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewCurrentTokenOriginDidChange:",_77);
}
}
}
}),new objj_method(sel_getUid("clear"),function(_88,_89){
with(_88){
_maxAnchorIndex=0;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_anchorIndex=0;
while(objj_msgSend(_tokenViews,"count")>0){
var _8a=objj_msgSend(_tokenViews,"objectAtIndex:",0);
objj_msgSend(_8a,"removeFromSuperview");
objj_msgSend(_tokenViews,"removeObjectAtIndex:",0);
}
objj_msgSend(_88,"setNeedsLayout");
}
}),new objj_method(sel_getUid("addToken:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(objj_msgSend(NAToken,"alloc"),"initWithLabel:",_8d);
objj_msgSend(_8e,"setField:",_8b);
objj_msgSend(_containerView,"addSubview:",_8e);
objj_msgSend(_tokenViews,"insertObject:atIndex:",_8e,_anchorIndex);
_anchorIndex+=1;
objj_msgSend(_8b,"_processMaxAnchorIndex");
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTokens:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"clear");
var i;
for(i=0;i<objj_msgSend(_91,"count");++i){
objj_msgSend(_8f,"addToken:",objj_msgSend(_91,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("tokens"),function(_92,_93){
with(_92){
var i,_94,_95=[];
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_94=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_94,"isKindOfClass:",NAToken)){
objj_msgSend(_95,"addObject:",objj_msgSend(_94,"stringValue"));
}
}
return _95;
}
}),new objj_method(sel_getUid("currentTokenStringValue"),function(_96,_97){
with(_96){
return objj_msgSend(objj_msgSend(_96,"_currentTokenTextField"),"stringValue");
}
}),new objj_method(sel_getUid("currentTokenOrigin"),function(_98,_99){
with(_98){
return _tokenOrigin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9a,_9b,_9c){
with(_9a){
_delegate=_9c;
}
}),new objj_method(sel_getUid("delegate"),function(_9d,_9e){
with(_9d){
return _delegate;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_9f,_a0){
with(_9f){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_a1,_a2){
with(_a1){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CGInsetMakeZero(),CGInsetMake(2,2,2,2),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12)],["bezel-inset","content-inset","bezel-color","text-color","font"]);
}
})]);
var _1=objj_allocateClassPair(CPView,"NAToken"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label"),new objj_ivar("_isSelected"),new objj_ivar("_normalImage"),new objj_ivar("_selectedImage"),new objj_ivar("_field")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setField:"),function(_a3,_a4,_a5){
with(_a3){
_field=_a5;
}
}),new objj_method(sel_getUid("initWithLabel:"),function(_a6,_a7,_a8){
with(_a6){
_a6=objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("NAToken").super_class},"initWithFrame:",CGRectMakeZero());
if(_a6){
_isSelected=NO;
_DOMElement.style.cursor="default";
_normalImage=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_l.png"),CGSizeMake(9,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_c.png"),CGSizeMake(1,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_r.png"),CGSizeMake(8,16))],NO);
objj_msgSend(_a6,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_normalImage));
_label=objj_msgSend(CPTextField,"labelWithTitle:",_a8);
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGInsetMake(2,3,2,2),"content-inset");
objj_msgSend(_a6,"addSubview:",_label);
var _a9=5;
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrameOrigin:",CGPointMake(_a9,0));
objj_msgSend(_a6,"setFrameSize:",CGSizeMake(objj_msgSend(_label,"frame").size.width+_a9*2,16));
}
return _a6;
}
}),new objj_method(sel_getUid("stringValue"),function(_aa,_ab){
with(_aa){
return objj_msgSend(_label,"stringValue");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ac,_ad,_ae){
with(_ac){
if(objj_msgSend(_field,"editable")){
objj_msgSend(_field,"_tokenMouseDown:object:",_ae,_ac);
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_af,_b0,_b1){
with(_af){
_isSelected=_b1;
objj_msgSend(_af,"setNeedsLayout");
}
}),new objj_method(sel_getUid("isSelected"),function(_b2,_b3){
with(_b2){
return _isSelected;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_b4,_b5){
with(_b4){
if(objj_msgSend(_b4,"isSelected")){
if(!_selectedImage){
_selectedImage=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_l.png"),CGSizeMake(9,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_c.png"),CGSizeMake(1,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_r.png"),CGSizeMake(8,16))],NO);
}
objj_msgSend(_b4,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_selectedImage));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","ffffff"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"clearColor"),"text-shadow-color");
}else{
objj_msgSend(_b4,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_normalImage));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
}
}
})]);
var _1=objj_allocateClassPair(CPView,"NATokenTextField"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_b6,_b7){
with(_b6){
_b6=objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("NATokenTextField").super_class},"initWithFrame:",CGRectMakeZero());
if(_b6){
_label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGInsetMake(2,0,2,0),"content-inset");
objj_msgSend(_b6,"addSubview:",_label);
}
return _b6;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_b8,_b9,_ba){
with(_b8){
objj_msgSend(_label,"setStringValue:",_ba);
objj_msgSend(_b8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("stringValue"),function(_bb,_bc){
with(_bb){
return objj_msgSend(_label,"stringValue");
}
}),new objj_method(sel_getUid("addStringToStringValue:atIndex:"),function(_bd,_be,_bf,_c0){
with(_bd){
var str=objj_msgSend(objj_msgSend(_bd,"stringValue"),"substringToIndex:",_c0)+_bf+objj_msgSend(objj_msgSend(_bd,"stringValue"),"substringFromIndex:",_c0);
objj_msgSend(_bd,"setStringValue:",str);
}
}),new objj_method(sel_getUid("removeCharAtIndex:"),function(_c1,_c2,_c3){
with(_c1){
var str=objj_msgSend(objj_msgSend(_c1,"stringValue"),"substringToIndex:",_c3-1)+objj_msgSend(objj_msgSend(_c1,"stringValue"),"substringFromIndex:",_c3);
objj_msgSend(_c1,"setStringValue:",str);
}
}),new objj_method(sel_getUid("removeFrom:to:"),function(_c4,_c5,_c6,to){
with(_c4){
var str="";
if(_c6>0){
str+=objj_msgSend(objj_msgSend(_c4,"stringValue"),"substringToIndex:",_c6-1);
}
str+=objj_msgSend(objj_msgSend(_c4,"stringValue"),"substringFromIndex:",to);
objj_msgSend(_c4,"setStringValue:",str);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_c7,_c8){
with(_c7){
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_c7,"setFrameSize:",objj_msgSend(_label,"frame").size);
}
})]);
var _1=objj_getClass("CPString");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("trim"),function(_c9,_ca){
with(_c9){
var _cb=objj_msgSend(_c9,"copy");
while(objj_msgSend(_cb,"hasPrefix:"," ")||objj_msgSend(_cb,"hasPrefix:","\n")||objj_msgSend(_cb,"hasPrefix:","\r")||objj_msgSend(_cb,"hasPrefix:","\t")){
_cb=objj_msgSend(_cb,"substringFromIndex:",1);
}
while(objj_msgSend(_cb,"hasSuffix:"," ")||objj_msgSend(_cb,"hasSuffix:","\n")||objj_msgSend(_cb,"hasSuffix:","\r")||objj_msgSend(_cb,"hasSuffix:","\t")){
if(objj_msgSend(_cb,"compare:","")==CPOrderedSame){
return _cb;
}
_cb=objj_msgSend(_cb,"substringToIndex:",objj_msgSend(_cb,"length")-1);
}
return _cb;
}
})]);
var _1=objj_allocateClassPair(CPWindow,"NAMenu"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_items"),new objj_ivar("_content"),new objj_ivar("_backgroundImage"),new objj_ivar("_selectedIndex")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_cc,_cd){
with(_cc){
_cc=objj_msgSendSuper({receiver:_cc,super_class:objj_getClass("NAMenu").super_class},"initWithContentRect:styleMask:",CGRectMake(20,20,100,100),CPBorderlessWindowMask);
if(_cc){
if(!_backgroundImage){
var _ce=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuWindow,"class"));
_backgroundImage=objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]);
}
backgroundColor=objj_msgSend(CPColor,"colorWithPatternImage:",_backgroundImage);
objj_msgSend(_windowView,"setBackgroundColor:",backgroundColor);
objj_msgSend(_contentView,"setFrame:",CGRectMake(5,4,objj_msgSend(_cc,"frame").size.width-10,objj_msgSend(_cc,"frame").size.height-10));
_selectedIndex=0;
}
return _cc;
}
}),new objj_method(sel_getUid("selectedItem"),function(_cf,_d0){
with(_cf){
if(_selectedIndex>=0&&_selectedIndex<objj_msgSend(_content,"count")){
return objj_msgSend(_content,"objectAtIndex:",_selectedIndex);
}
return nil;
}
}),new objj_method(sel_getUid("previous"),function(_d1,_d2){
with(_d1){
_selectedIndex-=1;
if(_selectedIndex<0){
_selectedIndex=objj_msgSend(_content,"count")-1;
}
objj_msgSend(_d1,"layoutSubviews");
}
}),new objj_method(sel_getUid("next"),function(_d3,_d4){
with(_d3){
_selectedIndex+=1;
if(_selectedIndex>=objj_msgSend(_content,"count")){
_selectedIndex=0;
}
objj_msgSend(_d3,"layoutSubviews");
}
}),new objj_method(sel_getUid("setContent:"),function(_d5,_d6,_d7){
with(_d5){
_content=_d7;
objj_msgSend(_d5,"reloadContent");
}
}),new objj_method(sel_getUid("reloadContent"),function(_d8,_d9){
with(_d8){
var i,_da;
if(!_items){
_items=[];
}
while(objj_msgSend(_content,"count")>objj_msgSend(_items,"count")){
objj_msgSend(_items,"addObject:",objj_msgSend(objj_msgSend(NAMenuItem,"alloc"),"init"));
}
for(i=0;i<objj_msgSend(_items,"count");++i){
_da=objj_msgSend(_items,"objectAtIndex:",i);
if(i<objj_msgSend(_content,"count")){
objj_msgSend(_da,"setRepresentedObject:",objj_msgSend(_content,"objectAtIndex:",i));
objj_msgSend(objj_msgSend(_d8,"contentView"),"addSubview:",_da);
}else{
objj_msgSend(_da,"removeFromSuperview");
}
}
if(_selectedIndex>=objj_msgSend(_content,"count")){
_selectedIndex=objj_msgSend(_content,"count")-1;
}
objj_msgSend(_d8,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_db,_dc){
with(_db){
var i,_dd,h=0,w=10;
for(i=0;i<objj_msgSend(_content,"count");++i){
if(i>=objj_msgSend(_items,"count")){
break;
}
var _de=objj_msgSend(objj_msgSend(_items,"objectAtIndex:",i),"minWidth");
if(_de>w){
w=_de;
}
}
for(i=0;i<objj_msgSend(_content,"count");++i){
if(i>=objj_msgSend(_items,"count")){
break;
}
_dd=objj_msgSend(_items,"objectAtIndex:",i);
objj_msgSend(_dd,"setFrame:",CGRectMake(0,h,w,objj_msgSend(NAMenuItem,"height")));
objj_msgSend(_dd,"setFirst:",(i==0));
objj_msgSend(_dd,"setLast:",(i==objj_msgSend(_items,"count")-1));
objj_msgSend(_dd,"setSelected:",(i==_selectedIndex));
h+=objj_msgSend(NAMenuItem,"height");
}
objj_msgSend(_db,"setFrameSize:",CGSizeMake(w,h));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_df,_e0,_e1){
with(_df){
_e1.width+=10;
_e1.height+=10;
objj_msgSendSuper({receiver:_df,super_class:objj_getClass("NAMenu").super_class},"setFrameSize:",_e1);
objj_msgSend(_df,"_checkBordersAndSetFrameOrigin:",objj_msgSend(_df,"frame").origin);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_e2,_e3,_e4){
with(_e2){
_e4.x-=5;
_e4.y-=4;
objj_msgSend(_e2,"_checkBordersAndSetFrameOrigin:",_e4);
}
}),new objj_method(sel_getUid("_checkBordersAndSetFrameOrigin:"),function(_e5,_e6,_e7){
with(_e5){
var _e8=objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"mainWindow"),"frame").size.width;
var _e9=_e7.x+objj_msgSend(_e5,"frame").size.width;
if(_e9>_e8){
_e7.x=_e8-objj_msgSend(_e5,"frame").size.width;
}
objj_msgSendSuper({receiver:_e5,super_class:objj_getClass("NAMenu").super_class},"setFrameOrigin:",_e7);
}
})]);
var _ea=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_l.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_t.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_l.png"),CGSizeMake(1,21))],NO),_eb=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_tl.png"),CGSizeMake(4,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_t.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_tr.png"),CGSizeMake(4,21))],NO),_ec=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_bl.png"),CGSizeMake(4,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_b.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_br.png"),CGSizeMake(4,21))],NO);
var _1=objj_allocateClassPair(CPView,"NAMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_label"),new objj_ivar("_isLast"),new objj_ivar("_isFirst"),new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("minWidth"),function(_ed,_ee){
with(_ed){
if(!_label){
return 0;
}
objj_msgSend(_label,"sizeToFit");
return objj_msgSend(_label,"frame").size.width+6;
}
}),new objj_method(sel_getUid("setFirst:"),function(_ef,_f0,_f1){
with(_ef){
if(_f1==_isFirst){
return;
}
_isFirst=_f1;
objj_msgSend(_ef,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setLast:"),function(_f2,_f3,_f4){
with(_f2){
if(_f4==_isLast){
return;
}
_isLast=_f4;
objj_msgSend(_f2,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setSelected:"),function(_f5,_f6,_f7){
with(_f5){
if(_f7==_isSelected){
return;
}
_isSelected=_f7;
objj_msgSend(_f5,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_f8,_f9,_fa){
with(_f8){
if(!_label){
_label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_label,"setFrame:",CGRectMake(3,2,0,0));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_f8,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",_fa["name"]);
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_f8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_fb,_fc){
with(_fb){
if(!_isSelected){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","3d3d3d"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.94),"text-shadow-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGSizeMake(0,1),"text-shadow-offset");
}else{
if(_isFirst){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_eb));
}else{
if(_isLast){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_ec));
}else{
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_ea));
}
}
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","FFFFFF"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0,0.2),"text-shadow-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGSizeMake(0,-1),"text-shadow-offset");
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("height"),function(_fd,_fe){
with(_fd){
return 21;
}
})]);
p;16;NoLocationView.jt;4841;@STATIC;1.0;t;4822;
var _1=objj_allocateClassPair(CPView,"NoLocationView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("NoLocationView").super_class},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
var _6=objj_msgSend(CPTextField,"new");
objj_msgSend(_6,"setStringValue:","No Location Selected");
objj_msgSend(_6,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",36));
objj_msgSend(_6,"sizeToFit");
objj_msgSend(_6,"setCenter:",CGPointMake(CGRectGetMidX(_5),60));
objj_msgSend(_6,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_6,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(_6,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_6,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(_3,"addSubview:",_6);
var _7=objj_msgSend(CPBundle,"mainBundle"),_8=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/1.png"),CGSizeMake(14,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/2.png"),CGSizeMake(9,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/3.png"),CGSizeMake(10,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/4.png"),CGSizeMake(14,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/5.png"),CGSizeMake(6,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/6.png"),CGSizeMake(10,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/7.png"),CGSizeMake(14,8)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/8.png"),CGSizeMake(9,8)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/9.png"),CGSizeMake(10,8))])),_9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake((_5.size.width/2-25)-91,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","SignPost.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_9,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_9,"setAction:",sel_getUid("addNewLocation:"));
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake(_5.size.width/2-25,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","help.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake(_5.size.width/2-25+91,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","iPhoneIcon.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(50,300,_5.size.width-100,90)),_a=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(53,285,0,0));
objj_msgSend(_a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_a,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(_a,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_a,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_a,"setStringValue:","Import Queue");
objj_msgSend(_a,"sizeToFit");
objj_msgSend(_9,"setBackgroundColor:",_8);
objj_msgSend(_9,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3,"addSubview:",_a);
objj_msgSend(_3,"addSubview:",_9);
}
return _3;
}
})]);
p;15;RLFileWrapper.jt;1102;@STATIC;1.0;t;1083;
var _1=objj_allocateClassPair(CPObject,"RLFileWrapper"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fileAttributes"),new objj_ivar("_filename"),new objj_ivar("_preferredFilename"),new objj_ivar("_contentData")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_fileAttributes"),function(_3,_4){
with(_3){
return _fileAttributes;
}
}),new objj_method(sel_getUid("_setFileAttributes:"),function(_5,_6,_7){
with(_5){
_fileAttributes=_7;
}
}),new objj_method(sel_getUid("_filename"),function(_8,_9){
with(_8){
return _filename;
}
}),new objj_method(sel_getUid("_setFilename:"),function(_a,_b,_c){
with(_a){
_filename=_c;
}
}),new objj_method(sel_getUid("_preferredFilename"),function(_d,_e){
with(_d){
return _preferredFilename;
}
}),new objj_method(sel_getUid("_setPreferredFilename:"),function(_f,_10,_11){
with(_f){
_preferredFilename=_11;
}
}),new objj_method(sel_getUid("_contentData"),function(_12,_13){
with(_12){
return _contentData;
}
}),new objj_method(sel_getUid("_setContentData:"),function(_14,_15,_16){
with(_14){
_contentData=_16;
}
})]);
p;11;RLMapView.jt;7681;@STATIC;1.0;t;7662;
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
p;24;RLOfflineDatabaseStore.jt;2876;@STATIC;1.0;t;2857;
var _1=objj_allocateClassPair(CPObject,"RLOfflineDatabaseStore"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_db"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:delegate:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("RLOfflineDatabaseStore").super_class},"init");
if(_3){
_delegate=_6;
if(!objj_msgSend(RLOfflineDataStore,"offlineDataStoreIsAvailable")&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("dataStoreIsNotSupported"))){
objj_msgSend(_delegate,"dataStoreIsNotSupported");
return;
}
_name=_5;
_size=1024*2000;
_db=openDatabase("RCOfflineDataStore-"+_name,"1.0",_name,_size);
if(!_db&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("userDidRejectDatabase"))){
objj_msgSend(_delegate,"userDidRejectDatabase");
return;
}else{
if(!_db){
objj_msgSend(CPException,"exceptionWithName:reason:userInfo:","RLOfflineDataStore","Offline storage was rejected by the user.",nil);
return;
}
}
_db.transaction(function(_7){
_7.executeSql("CREATE TABLE IF NOT EXISTS InventoryFileCache (key TEXT UNIQUE NOT NULL PRIMARY KEY, value TEXT NOT NULL)");
});
}
return _3;
}
}),new objj_method(sel_getUid("blahsetValue:forKey:"),function(_8,_9,_a,_b){
with(_8){
localStorage.setItem(_b,_a);
}
}),new objj_method(sel_getUid("blahgetValueForKey:"),function(_c,_d,_e){
with(_c){
return localStorage.getItem(_e);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_f,_10,_11,_12){
with(_f){
_db.transaction(function(db){
db.executeSql("UPDATE InventoryFileCache SET value = ? WHERE key = ?",[_11,_12],result=function(tx,rs){
},anError=function(tx,err){
});
db.executeSql("INSERT INTO InventoryFileCache (key, value) VALUES (?, ?)",[_12,_11],result=function(db,rs){
},error=function(db,err){
});
});
}
}),new objj_method(sel_getUid("getValueForKey:"),function(_13,_14,_15){
with(_13){
_db.transaction(function(db){
db.executeSql("SELECT value FROM InventoryFileCache WHERE key=?",[_15],result=function(_16,_17){
objj_msgSend(_13,"_parseResults:",_17);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",nil);
},anError=function(_18,_19){
});
});
}
}),new objj_method(sel_getUid("removeValueForKey:"),function(_1a,_1b,_1c){
with(_1a){
_db.transaction(function(db){
db.executeSql("DELETE FROM InventoryFileCache WHERE key=?",[_1c],result=function(_1d,_1e){
},anError=function(_1f,_20){
});
});
}
}),new objj_method(sel_getUid("_parseResults:"),function(_21,_22,_23){
with(_21){
if(_23.rows.length>0){
var _24=_23.rows.item(0).value;
}else{
var _24=nil;
}
objj_msgSend(_delegate,"didReciveData:",_24);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_25,_26){
with(_25){
return !!window.openDatabase;
}
})]);
p;23;RLOfflineLocalStorage.jt;1251;@STATIC;1.0;t;1232;
var _1=objj_allocateClassPair(CPObject,"RLOfflineLocalStorage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_3,_4){
with(_3){
return !!window.localStorage;
}
}),new objj_method(sel_getUid("initWithName:delegate:"),function(_5,_6,_7,_8){
with(_5){
_delegate=_8;
if(!objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("dataStoreIsNotSupported"))){
objj_msgSend(_delegate,"localStorageNotSupported");
return;
}
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("RLOfflineLocalStorage").super_class},"init");
return _5;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_9,_a,_b,_c){
with(_9){
localStorage.setItem(_c,_b);
}
}),new objj_method(sel_getUid("getValueForKey:"),function(_d,_e,_f){
with(_d){
return localStorage.getItem(_f);
}
}),new objj_method(sel_getUid("removeValueForKey:"),function(_10,_11,_12){
with(_10){
localStorage.removeItem(_12);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_13,_14){
with(_13){
return !!window.localStorage;
}
})]);
p;22;SourceViewController.jt;25787;@STATIC;1.0;t;25767;
var _1;
var _2=objj_allocateClassPair(CPObject,"SourceViewController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("containerView"),new objj_ivar("buttonBar"),new objj_ivar("sourceList"),new objj_ivar("scrollView"),new objj_ivar("minusButton"),new objj_ivar("detailsPanelIsUp"),new objj_ivar("detailsPanel")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("containerView"),function(_4,_5){
with(_4){
return containerView;
}
}),new objj_method(sel_getUid("setContainerView:"),function(_6,_7,_8){
with(_6){
containerView=_8;
}
}),new objj_method(sel_getUid("sourceList"),function(_9,_a){
with(_9){
return sourceList;
}
}),new objj_method(sel_getUid("setSourceList:"),function(_b,_c,_d){
with(_b){
sourceList=_d;
}
}),new objj_method(sel_getUid("initWithContainerView:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("SourceViewController").super_class},"init");
if(_e){
detailsPanelIsUp=NO;
containerView=_10;
var _11=objj_msgSend(_10,"bounds");
buttonBar=objj_msgSend(SourceViewController,"myThemedButtonBar");
objj_msgSend(buttonBar,"setFrame:",CGRectMake(0,_11.size.height-24,_11.size.width,24));
objj_msgSend(buttonBar,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
var _12=objj_msgSend(SourceViewController,"plusButton");
minusButton=objj_msgSend(SourceViewController,"minusButton");
objj_msgSend(minusButton,"setTarget:",_e);
objj_msgSend(minusButton,"setAction:",sel_getUid("removeLocation:"));
objj_msgSend(_12,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_12,"setAction:",sel_getUid("addNewLocation:"));
var _13=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,22)),_14=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-up.png"),CGSizeMake(11,12));
objj_msgSend(_13,"setBordered:",NO);
objj_msgSend(_13,"setImage:",_14);
objj_msgSend(_13,"setImagePosition:",CPImageOnly);
objj_msgSend(_13,"setTarget:",_e);
objj_msgSend(_13,"setAction:",sel_getUid("toggleDetailsPanel:"));
objj_msgSend(buttonBar,"setButtons:",[_12,_13,minusButton]);
objj_msgSend(_10,"addSubview:",buttonBar);
objj_msgSend(objj_msgSend(_10,"superview"),"setButtonBar:forDividerAtIndex:",buttonBar,0);
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_11.size.width,_11.size.height-24));
sourceList=objj_msgSend(objj_msgSend(RLSourceList,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(sourceList,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(sourceList,"setDelegate:",_e);
objj_msgSend(sourceList,"setDataSource:",_e);
objj_msgSend(sourceList,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleSourceList);
objj_msgSend(sourceList,"registerForDraggedTypes:",["LocationDragType","ItemDragType"]);
objj_msgSend(sourceList,"setTarget:",objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"));
objj_msgSend(sourceList,"setDoubleAction:",sel_getUid("edit:"));
objj_msgSend(sourceList,"setSelectionGradientColors:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[109/255,126/255,152.18/255,1,87/255,104/255,124/255,1],[0,1],2),objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",(152/255),(165/255),(182/255),1),objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",(87/255),(127/255),(151/255),1)],[CPSourceListGradient,CPSourceListTopLineColor,CPSourceListBottomLineColor]));
var _15=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","sourcelist"),_16=objj_msgSend(_15,"headerView");
objj_msgSend(_16,"setStringValue:","LOCATIONS");
objj_msgSend(_15,"setDataView:",objj_msgSend(objj_msgSend(SourceListDataView,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_15,"setWidth:",300);
objj_msgSend(_15,"setMinWidth:",50);
objj_msgSend(_15,"setMaxWidth:",250);
objj_msgSend(sourceList,"addTableColumn:",_15);
objj_msgSend(sourceList,"setOutlineTableColumn:",_15);
objj_msgSend(sourceList,"setColumnAutoresizingStyle:",CPTableViewFirstColumnOnlyAutoresizingStyle);
objj_msgSend(sourceList,"setRowHeight:",40);
var _17=objj_msgSend(CPColor,"colorWithHexString:","ededed");
objj_msgSend(sourceList,"setBackgroundColor:",_17);
objj_msgSend(objj_msgSend(sourceList,"headerView"),"setValue:forThemeAttribute:",_17,"background-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",objj_msgSend(CPNull,"null"),"background-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","666666"),"text-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",CGInsetMake(6,7,2,10),"text-inset");
objj_msgSend(objj_msgSend(sourceList,"cornerView"),"setValue:forThemeAttribute:",_17,"background-color");
objj_msgSend(scrollView,"setDocumentView:",sourceList);
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(scrollView,"setHorizontalLineScroll:",0);
objj_msgSend(_10,"addSubview:",scrollView);
}
return _e;
}
}),new objj_method(sel_getUid("removeLocation:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"),_1c=objj_msgSend(sourceList,"itemAtRow:",_1b);
objj_msgSend(objj_msgSend(CPApp,"delegate"),"confirmRemovalOfLocation:",_1c);
}
}),new objj_method(sel_getUid("outlineView:shouldSelectItem:"),function(_1d,_1e,_1f,_20){
with(_1d){
return !objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"isUploading");
}
}),new objj_method(sel_getUid("outlineViewSelectionIsChanging:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),_25=objj_msgSend(objj_msgSend(_24,"locationView"),"itemView");
if(objj_msgSend(_25,"isEditing")){
objj_msgSend(_25,"enterEditMode:",NO);
objj_msgSend(_24,"itemDidEndEditing:",objj_msgSend(_25,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("outlineViewSelectionDidChange:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"),_2a=objj_msgSend(sourceList,"itemAtRow:",_29);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),"setLocation:",_2a);
if(!_2a){
objj_msgSend(minusButton,"setEnabled:",NO);
}else{
objj_msgSend(minusButton,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2f){
return objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations")[_2e];
}else{
return objj_msgSend(_2f,"subLocations")[_2e];
}
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_30,_31,_32,_33){
with(_30){
return (objj_msgSend(objj_msgSend(_33,"subLocations"),"count"));
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_34,_35,_36,_37){
with(_34){
if(_37===nil){
return objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"count");
}else{
return objj_msgSend(objj_msgSend(_37,"subLocations"),"count");
}
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_38,_39,_3a,_3b,_3c){
with(_38){
var _3d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
objj_msgSend(_3d,"setValue:forKey:",objj_msgSend(LocationItemTypes,"imageForItemWithTitle:",objj_msgSend(_3c,"type")),"image");
objj_msgSend(_3d,"setObject:forKey:",objj_msgSend(_3c,"name"),"title");
objj_msgSend(_3d,"setObject:forKey:",objj_msgSend(_3c,"numberOfItems"),"items");
return _3d;
}
}),new objj_method(sel_getUid("outlineView:writeItems:toPasteboard:"),function(_3e,_3f,_40,_41,_42){
with(_3e){
objj_msgSend(_42,"declareTypes:owner:",["LocationDragType"],_3e);
objj_msgSend(_42,"setData:forType:",nil,"LocationDragType");
_1=_41;
return YES;
}
}),new objj_method(sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"),function(_43,_44,_45,_46,_47,_48){
with(_43){
var _49=objj_msgSend(_46,"draggingPasteboard");
if(objj_msgSend(objj_msgSend(_49,"types"),"containsObject:","LocationDragType")){
var _4a=(_47)?objj_msgSend(_47,"indexOfSubLocation:",_1[0]):objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_1[0]);
if((_48===_4a||_48===_4a+1)&&_47===objj_msgSend(_1[0],"superLocation")){
return CPDragOperationNone;
}
if(_47===nil){
objj_msgSend(_45,"setDropItem:dropChildIndex:",nil,_48);
}
var _49=objj_msgSend(_46,"draggingPasteboard"),_4b=_1[0];
if(_4b===_47||objj_msgSend(_43,"item:isSubItemOf:",_47,_4b)){
return CPDragOperationNone;
}
if(objj_msgSend(_4b,"superLocation")===_47){
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
}else{
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
}
return CPDragOperationMove;
}else{
if(objj_msgSend(objj_msgSend(_49,"types"),"containsObject:","ItemDragType")){
if(!_47||_48!==-1){
return CPDragOperationNone;
}
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
return CPDragOperationMove;
}
}
}
}),new objj_method(sel_getUid("outlineView:acceptDrop:item:childIndex:"),function(_4c,_4d,_4e,_4f,_50,_51){
with(_4c){
var _52=objj_msgSend(_4f,"draggingPasteboard");
if(objj_msgSend(objj_msgSend(_52,"types"),"containsObject:","LocationDragType")){
var _53=_1[0];
var _54=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
objj_msgSend(_54,"setObject:forKey:",_53,"item");
objj_msgSend(_54,"setObject:forKey:",_50,"to");
objj_msgSend(_54,"setObject:forKey:",_51,"index");
objj_msgSend(_4c,"moveLocation:",_54);
_1=nil;
return YES;
}else{
if(objj_msgSend(objj_msgSend(_52,"types"),"containsObject:","ItemDragType")){
var _55=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(_52,"dataForType:","ItemDragType")),"firstIndex"),_56=objj_msgSend(sourceList,"itemAtRow:",objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"));
_55=objj_msgSend(_56,"itemAtIndex:",_55);
if(objj_msgSend(objj_msgSend(_50,"items"),"containsObject:",_55)){
return NO;
}
objj_msgSend(objj_msgSend(CPApp,"delegate"),"moveItem:fromLocation:to:",_55,_56,_50);
return YES;
}
}
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_57,_58,_59,_5a){
with(_57){
}
}),new objj_method(sel_getUid("moveLocation:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=objj_msgSend(_5d,"objectForKey:","item"),to=objj_msgSend(_5d,"objectForKey:","to"),_5f=(objj_msgSend(_5d,"objectForKey:","index")||0),_60=objj_msgSend(_5e,"superLocation"),_61=nil;
if(_60===to&&((_60&&objj_msgSend(_60,"indexOfSubLocation:",_5e)<_5f)||(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_5e)<_5f))){
_5f--;
}
if(_60){
_61=objj_msgSend(_60,"indexOfSubLocation:",_5e);
objj_msgSend(_60,"removeSubLocation:",_5e);
}else{
_61=objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_5e);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"removeObject:",_5e);
}
if(to){
objj_msgSend(to,"addSubLocation:atIndex:",_5e,_5f);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"insertObject:atIndex:",_5e,_5f);
}
objj_msgSend(_5d,"setObject:forKey:",_60,"to");
objj_msgSend(_5d,"setObject:forKey:",_61,"index");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_5b,sel_getUid("moveLocation:"),_5d);
objj_msgSend(sourceList,"reloadData");
}
}),new objj_method(sel_getUid("item:isSubItemOf:"),function(_62,_63,_64,_65){
with(_62){
if(objj_msgSend(objj_msgSend(_65,"subLocations"),"containsObject:",_64)){
return YES;
}
for(var i=0;i<objj_msgSend(objj_msgSend(_65,"subLocations"),"count");i++){
if(objj_msgSend(_62,"item:isSubItemOf:",_64,objj_msgSend(_65,"subLocations")[i])){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("toggleDetailsPanel:"),function(_66,_67,_68){
with(_66){
var _69=objj_msgSend(containerView,"bounds");
if(detailsPanelIsUp){
objj_msgSend(containerView,"addSubview:",buttonBar);
objj_msgSend(_68,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-up.png"),CGSizeMake(11,12)));
var _6a=CGRectMake(0,_69.size.height-25,_69.size.width,125),_6b=CGRectMake(0,0,_69.size.width,_69.size.height-24);
}else{
objj_msgSend(_68,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-down.png"),CGSizeMake(11,12)));
if(!detailsPanel){
detailsPanel=objj_msgSend(objj_msgSend(RLDetailsPane,"alloc"),"initWithFrame:",CGRectMake(0,_69.size.height-25,_69.size.width,125));
}
objj_msgSend(containerView,"addSubview:",detailsPanel);
objj_msgSend(containerView,"addSubview:",buttonBar);
var _6a=CGRectMake(0,_69.size.height-150,_69.size.width,125),_6b=CGRectMake(0,0,_69.size.width,_69.size.height-150);
}
var _6c=objj_msgSend(CPDictionary,"new"),_6d=objj_msgSend(CPDictionary,"new");
objj_msgSend(_6c,"setValue:forKey:",detailsPanel,CPViewAnimationTargetKey);
objj_msgSend(_6c,"setValue:forKey:",objj_msgSend(detailsPanel,"frame"),CPViewAnimationStartFrameKey);
objj_msgSend(_6c,"setValue:forKey:",_6a,CPViewAnimationEndFrameKey);
objj_msgSend(_6c,"setValue:forKey:",CPAnimationEaseOut,CPViewAnimationEffectKey);
objj_msgSend(_6d,"setValue:forKey:",scrollView,CPViewAnimationTargetKey);
objj_msgSend(_6d,"setValue:forKey:",objj_msgSend(scrollView,"frame"),CPViewAnimationStartFrameKey);
objj_msgSend(_6d,"setValue:forKey:",_6b,CPViewAnimationEndFrameKey);
var _6e=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_6c,_6d]);
objj_msgSend(_6e,"setDuration:",0.2);
objj_msgSend(_6e,"startAnimation");
detailsPanelIsUp=!detailsPanelIsUp;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("myThemedButtonBar"),function(_6f,_70){
with(_6f){
var _71=objj_msgSend(objj_msgSend(CPButtonBar,"alloc"),"initWithFrame:",CGRectMake(0,0,147,23)),_72=objj_msgSend(CPBundle,"mainBundle"),_73=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bar-bg.png"),CGSizeMake(1,23)));
objj_msgSend(_71,"setHasResizeControl:",YES);
objj_msgSend(_71,"setValue:forThemeAttribute:",_73,"bezel-color");
var _74=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-left.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bar-center-none.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-right.png"),CGSizeMake(3,22))],NO)),_75=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-left-highlighted.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-center-highlighted.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-right-highlighted.png"),CGSizeMake(2,22))],NO));
objj_msgSend(_71,"setValue:forThemeAttribute:",_74,"button-bezel-color");
objj_msgSend(_71,"setValue:forThemeAttribute:inState:",_75,"button-bezel-color",CPThemeStateHighlighted);
objj_msgSend(_71,"setValue:forThemeAttribute:inState:",_74,"button-bezel-color",CPThemeStateDisabled);
objj_msgSend(_71,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"blackColor"),"button-text-color");
return _71;
}
}),new objj_method(sel_getUid("plusButton"),function(_76,_77){
with(_76){
var _78=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,22)),_79=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","plus_button.png"),CGSizeMake(11,12));
objj_msgSend(_78,"setBordered:",NO);
objj_msgSend(_78,"setImage:",_79);
objj_msgSend(_78,"setImagePosition:",CPImageOnly);
return _78;
}
}),new objj_method(sel_getUid("minusButton"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,5)),_7d=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","minus_button.png"),CGSizeMake(11,4));
objj_msgSend(_7c,"setImageDimsWhenDisabled:",YES);
objj_msgSend(_7c,"setBordered:",NO);
objj_msgSend(_7c,"setImage:",_7d);
objj_msgSend(_7c,"setImagePosition:",CPImageOnly);
return _7c;
}
})]);
var _2=objj_allocateClassPair(CPView,"SourceListDataView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("imageView"),new objj_ivar("label"),new objj_ivar("itemsLabel")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_7e,_7f,_80){
with(_7e){
_7e=objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("SourceListDataView").super_class},"initWithFrame:",_80);
if(_7e){
label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,5,_80.size.width-20,27));
objj_msgSend(label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(label,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","555555"),"text-color");
objj_msgSend(label,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.8),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(label,"setValue:forThemeAttribute:",CGSizeMake(0,1),"text-shadow-offset");
objj_msgSend(label,"setAutoresizingMask:",CPViewWidthSizable);
itemsLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,23,_80.size.width-20,27));
objj_msgSend(itemsLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(itemsLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","333333"),"text-color");
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.8),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",11),"font",CPThemeStateSelectedDataView);
objj_msgSend(itemsLabel,"setAutoresizingMask:",CPViewWidthSizable);
imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(3,10,22,22));
objj_msgSend(_7e,"addSubview:",label);
objj_msgSend(_7e,"addSubview:",itemsLabel);
objj_msgSend(_7e,"addSubview:",imageView);
}
return _7e;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_81,_82,_83){
with(_81){
if(!_83){
return;
}
objj_msgSend(label,"setStringValue:",objj_msgSend(_83,"objectForKey:","title"));
objj_msgSend(imageView,"setImage:",objj_msgSend(_83,"objectForKey:","image"));
objj_msgSend(itemsLabel,"setStringValue:",(objj_msgSend(_83,"objectForKey:","items")||"No")+" Items");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_84,_85,_86){
with(_84){
objj_msgSendSuper({receiver:_84,super_class:objj_getClass("SourceListDataView").super_class},"setThemeState:",_86);
if(_86===CPThemeStateSelectedDataView){
objj_msgSend(label,"setThemeState:",_86);
objj_msgSend(itemsLabel,"setThemeState:",_86);
}
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(_87,_88,_89){
with(_87){
objj_msgSendSuper({receiver:_87,super_class:objj_getClass("SourceListDataView").super_class},"unsetThemeState:",_89);
if(_89===CPThemeStateSelectedDataView){
objj_msgSend(label,"unsetThemeState:",_89);
objj_msgSend(itemsLabel,"unsetThemeState:",_89);
}
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8c,"encodeObject:forKey:",imageView,"imageView");
objj_msgSend(_8c,"encodeObject:forKey:",label,"label");
objj_msgSend(_8c,"encodeObject:forKey:",itemsLabel,"items");
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("SourceListDataView").super_class},"encodeWithCoder:",_8c);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_8d,_8e,_8f){
with(_8d){
_8d=objj_msgSendSuper({receiver:_8d,super_class:objj_getClass("SourceListDataView").super_class},"initWithCoder:",_8f);
if(_8d){
imageView=objj_msgSend(_8f,"decodeObjectForKey:","imageView");
label=objj_msgSend(_8f,"decodeObjectForKey:","label");
itemsLabel=objj_msgSend(_8f,"decodeObjectForKey:","items");
}
return _8d;
}
})]);
var _2=objj_allocateClassPair(CPOutlineView,"RLSourceList"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("menuForEvent:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""),_94=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Remove Location",sel_getUid("removeItem:"),nil),_95=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Add Location",sel_getUid("addNewLocation:"),nil),_96=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","View Location",sel_getUid("newSelectRow:"),nil),_97=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit Location",sel_getUid("edit:"),nil),_98=objj_msgSend(_90,"convertPoint:fromView:",objj_msgSend(_92,"locationInWindow"),nil),row=objj_msgSend(_90,"rowAtPoint:",_98);
objj_msgSend(_94,"setTarget:",_90);
objj_msgSend(_95,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_96,"setTarget:",_90);
objj_msgSend(_97,"setTarget:",_90);
objj_msgSend(_94,"setRepresentedObject:",row);
objj_msgSend(_96,"setRepresentedObject:",row);
objj_msgSend(_97,"setRepresentedObject:",row);
if(row<0){
objj_msgSend(_94,"setEnabled:",NO);
objj_msgSend(_96,"setEnabled:",NO);
objj_msgSend(_97,"setEnabled:",NO);
}
objj_msgSend(_93,"addItem:",_94);
objj_msgSend(_93,"addItem:",_96);
objj_msgSend(_93,"addItem:",_95);
objj_msgSend(_93,"addItem:",_97);
return _93;
}
}),new objj_method(sel_getUid("edit:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"_noteSelectionIsChanging");
objj_msgSend(_99,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_9b,"representedObject")),NO);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),"edit:",nil);
objj_msgSend(_99,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("newSelectRow:"),function(_9c,_9d,_9e){
with(_9c){
objj_msgSend(_9c,"_noteSelectionIsChanging");
var _9f=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_9e,"representedObject"));
objj_msgSend(_9c,"selectRowIndexes:byExtendingSelection:",_9f,NO);
objj_msgSend(_9c,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("removeItem:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_a0,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_a2,"representedObject")),NO);
objj_msgSend(objj_msgSend(_a0,"delegate"),"removeLocation:",nil);
}
})]);
var _2=objj_allocateClassPair(CPView,"RLDetailsPane"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("spaceUsed"),new objj_ivar("spaceUsedText")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("RLDetailsPane").super_class},"initWithFrame:",_a5);
spaceUsed=objj_msgSend(objj_msgSend(CPProgressIndicator,"alloc"),"initWithFrame:",CGRectMake(15,_a5.size.height-31,_a5.size.width-30,16));
objj_msgSend(spaceUsed,"setDoubleValue:",75);
objj_msgSend(_a3,"addSubview:",spaceUsed);
spaceUsedText=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,_a5.size.height-50,_a5.size.width-30,14));
objj_msgSend(spaceUsedText,"setStringValue:","Storage Used: 1.5GB");
objj_msgSend(spaceUsedText,"sizeToFit");
objj_msgSend(_a3,"addSubview:",spaceUsedText);
var _a6=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,5,_a5.size.width-30,21));
objj_msgSend(_a6,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_a6,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","333333"));
objj_msgSend(_a6,"setTextShadowOffset:",CGSizeMake(1,2));
objj_msgSend(_a6,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_a6,"setStringValue:","Account Details");
objj_msgSend(_a6,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_a3,"addSubview:",_a6);
return _a3;
}
}),new objj_method(sel_getUid("drawRect:"),function(_a7,_a8,_a9){
with(_a7){
var _aa=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_aa,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _ab=[CGPointMake(0,0.5),CGPointMake(_a9.size.width,0.5)];
CGContextStrokeLineSegments(_aa,_ab,2);
}
})]);
p;9;Stepper.jt;4950;@STATIC;1.0;I;18;AppKit/CPControl.jI;17;AppKit/CPButton.jt;4886;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
var _1=objj_allocateClassPair(CPControl,"Stepper"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_upButton"),new objj_ivar("_bottomButton"),new objj_ivar("_splitter"),new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_increment"),new objj_ivar("_valueWraps"),new objj_ivar("_autorepeat")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("Stepper").super_class},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setMaxValue:",59);
objj_msgSend(_3,"setMinValue:",0);
objj_msgSend(_3,"setIncrement:",1);
objj_msgSend(_3,"setAutorepeat:",YES);
objj_msgSend(_3,"setValueWraps:",YES);
objj_msgSend(_3,"setDoubleValue:",0);
_upButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,12,10));
_bottomButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,11,12,12));
_splitter=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,10,12,1));
objj_msgSend(_upButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Stepper/stepper_up.png"),CGSizeMake(12,10)));
objj_msgSend(_bottomButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Stepper/stepper_down.png"),CGSizeMake(12,12)));
objj_msgSend(_splitter,"setBackgroundColor:",objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Stepper/stepper_middle.png"),CGSizeMake(12,1))));
objj_msgSend(_upButton,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Stepper/stepper_up_highlighted.png"),CGSizeMake(12,10)));
objj_msgSend(_bottomButton,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Stepper/stepper_down_highlighted.png"),CGSizeMake(12,12)));
objj_msgSend(_upButton,"setBordered:",NO);
objj_msgSend(_bottomButton,"setBordered:",NO);
objj_msgSend(_upButton,"setTarget:",_3);
objj_msgSend(_bottomButton,"setTarget:",_3);
objj_msgSend(_upButton,"setContinuous:",YES);
objj_msgSend(_bottomButton,"setContinuous:",YES);
objj_msgSend(_upButton,"setAction:",sel_getUid("buttonUpAction:"));
objj_msgSend(_bottomButton,"setAction:",sel_getUid("buttonDownAction:"));
objj_msgSend(_3,"addSubview:",_upButton);
objj_msgSend(_3,"addSubview:",_splitter);
objj_msgSend(_3,"addSubview:",_bottomButton);
}
return _3;
}
}),new objj_method(sel_getUid("minValue"),function(_6,_7){
with(_6){
return _minValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_8,_9,_a){
with(_8){
_minValue=_a;
}
}),new objj_method(sel_getUid("maxValue"),function(_b,_c){
with(_b){
return _maxValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_d,_e,_f){
with(_d){
_maxValue=_f;
}
}),new objj_method(sel_getUid("increment"),function(_10,_11){
with(_10){
return _increment;
}
}),new objj_method(sel_getUid("setIncrement:"),function(_12,_13,_14){
with(_12){
_increment=_14;
}
}),new objj_method(sel_getUid("valueWraps"),function(_15,_16){
with(_15){
return _valueWraps;
}
}),new objj_method(sel_getUid("setValueWraps:"),function(_17,_18,_19){
with(_17){
_valueWraps=_19;
}
}),new objj_method(sel_getUid("autorepeat"),function(_1a,_1b){
with(_1a){
return _autorepeat;
}
}),new objj_method(sel_getUid("setAutorepeat:"),function(_1c,_1d,_1e){
with(_1c){
_autorepeat=_1e;
}
}),new objj_method(sel_getUid("buttonUpAction:"),function(_1f,_20,_21){
with(_1f){
if((objj_msgSend(_1f,"doubleValue")+objj_msgSend(_1f,"increment"))>objj_msgSend(_1f,"maxValue")){
if(objj_msgSend(_1f,"valueWraps")){
objj_msgSend(_1f,"setDoubleValue:",objj_msgSend(_1f,"minValue"));
}
}else{
objj_msgSend(_1f,"setDoubleValue:",objj_msgSend(_1f,"doubleValue")+objj_msgSend(_1f,"increment"));
}
objj_msgSend(_1f,"sendAction:to:",objj_msgSend(_1f,"action"),objj_msgSend(_1f,"target"));
}
}),new objj_method(sel_getUid("buttonDownAction:"),function(_22,_23,_24){
with(_22){
if((objj_msgSend(_22,"doubleValue")-objj_msgSend(_22,"increment"))<objj_msgSend(_22,"minValue")){
if(objj_msgSend(_22,"valueWraps")){
objj_msgSend(_22,"setDoubleValue:",objj_msgSend(_22,"maxValue"));
}
}else{
objj_msgSend(_22,"setDoubleValue:",objj_msgSend(_22,"doubleValue")-objj_msgSend(_22,"increment"));
}
objj_msgSend(_22,"sendAction:to:",objj_msgSend(_22,"action"),objj_msgSend(_22,"target"));
}
})]);
p;24;CappuGeo/_CPDirections.jt;3102;@STATIC;1.0;I;21;Foundation/CPObject.ji;12;CPLocation.jt;3040;
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
p;21;CappuGeo/_CPMapView.jt;7211;@STATIC;1.0;I;15;AppKit/CPView.ji;12;CPMapImage.ji;13;CPMapMarker.jt;7137;
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
p;23;CappuGeo/CPDirections.jt;3298;@STATIC;1.0;I;21;Foundation/CPObject.ji;12;CPLocation.jt;3236;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPLocation.j",YES);
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
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
window.setTimeout(function(){
objj_msgSend(_1f,"_resizeFrame");
},500);
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
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_29,_2a){
with(_29){
CPDirectionsDrivingMode=google.maps.DirectionsTravelMode.DRIVING;
CPDirectionsWalkingMode=google.maps.DirectionsTravelMode.WALKING;
}
})]);
p;21;CappuGeo/CPLocation.jt;10452;@STATIC;1.0;I;21;Foundation/CPObject.jt;10406;
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
p;31;CappuGeo/CPLocationController.jt;5424;@STATIC;1.0;I;21;Foundation/CPObject.ji;12;CPLocation.ji;11;CPMapView.jt;5346;
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
p;21;CappuGeo/CPMapImage.jt;2916;@STATIC;1.0;I;20;AppKit/CPImageView.jt;2872;
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
p;22;CappuGeo/CPMapMarker.jt;4479;@STATIC;1.0;I;21;Foundation/CPObject.jt;4434;
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
p;20;CappuGeo/CPMapView.jt;7311;@STATIC;1.0;I;15;AppKit/CPView.ji;12;CPMapImage.ji;13;CPMapMarker.jt;7237;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("CPMapImage.j",YES);
objj_executeFile("CPMapMarker.j",YES);
CPMapViewWillLoad="CPMapViewWillLoad";
CPMapViewDidLoad="CPMapViewDidLoad";
var _1=[];
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
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_4b,_4c){
with(_4b){
CPMapTypeRoadmap=google.maps.MapTypeId.ROADMAP;
CPMapTypeSatellite=google.maps.MapTypeId.SATELLITE;
CPMapTypeTerrain=google.maps.MapTypeId.TERRAIN;
CPMapTypeHybrid=google.maps.MapTypeId.HYBRID;
_1[CPMinXEdge]=google.maps.ControlPosition.LEFT;
_1[CPMaxXEdge]=google.maps.ControlPosition.RIGHT;
_1[CPMinYEdge]=google.maps.ControlPosition.TOP;
_1[CPMaxYEdge]=google.maps.ControlPosition.BOTTOM;
_1[CPMinXEdge&CPMinYEdge]=google.maps.ControlPosition.TOP_LEFT;
_1[CPMinXEdge&CPMaxYEdge]=google.maps.ControlPosition.BOTTOM_LEFT;
_1[CPMaxXEdge&CPMinYEdge]=google.maps.ControlPosition.TOP_RIGHT;
_1[CPMaxXEdge&CPMaxYEdge]=google.maps.ControlPosition.BOTTOM_RIGHT;
NilOverlay.prototype=new google.maps.OverlayView;
NilOverlay.prototype.onAdd=function(){
var _4d=this.getPanes().overlayLayer;
_4d.appendChild(this.div_);
};
NilOverlay.prototype.onRemove=function(){
this.div_.parentNode.removeChild(this.div_);
};
NilOverlay.prototype.draw=function(){
var _4e=this.getProjection(),pos=_4e.fromLatLngToDivPixel(this.getMap().getCenter());
var div=this.div_;
div.style.left=pos.x+"px";
div.style.top=pos.y+"px";
div.style.display="block";
};
}
})]);
NilOverlay=function(_4f){
this.setValues(_4f);
var div=this.div_=document.createElement("div");
div.className="overlay";
};
p;29;CappuGeo/DirectionStepsView.jt;2207;@STATIC;1.0;t;2188;
var _1=objj_allocateClassPair(CPView,"ArbitraryHTMLView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_theDiv"),new objj_ivar("_frameView"),new objj_ivar("_scrollView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_theDiv"),function(_3,_4){
with(_3){
return _theDiv;
}
}),new objj_method(sel_getUid("_setTheDiv:"),function(_5,_6,_7){
with(_5){
_theDiv=_7;
}
}),new objj_method(sel_getUid("_frameView"),function(_8,_9){
with(_8){
return _frameView;
}
}),new objj_method(sel_getUid("_setFrameView:"),function(_a,_b,_c){
with(_a){
_frameView=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("ArbitraryHTMLView").super_class},"initWithFrame:",_f);
_theDiv=document.createElement("div");
_theDiv.name="div"+Math.floor(Math.random()*10000);
_theDiv.style.borderWidth="0px";
_theDiv.style.margin="0px";
_theDiv.style.padding="0px";
_theDiv.style.position="relative";
_theDiv.style.top="-11px";
_frameView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0));
_scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_d,"bounds"));
objj_msgSend(_scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(_scrollView,"setDocumentView:",_frameView);
objj_msgSend(_d,"addSubview:",_scrollView);
_frameView._DOMElement.appendChild(_theDiv);
return _d;
}
}),new objj_method(sel_getUid("setContent:"),function(_10,_11,_12){
with(_10){
theDiv.innerHTML=_12;
}
}),new objj_method(sel_getUid("theDiv"),function(_13,_14){
with(_13){
return _theDiv;
}
}),new objj_method(sel_getUid("_resizeFrame"),function(_15,_16){
with(_15){
var _17=objj_msgSend(_15,"frame").size.width-objj_msgSend(CPScroller,"scrollerWidth");
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(_17,_theDiv.offsetHeight+10));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_18,_19,_1a){
with(_18){
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("ArbitraryHTMLView").super_class},"setFrameSize:",_1a);
objj_msgSend(_18,"_resizeFrame");
}
})]);
p;41;DeepDropFileUpload/DCFileDropController.jt;5961;@STATIC;1.0;I;16;AppKit/CPPanel.jt;5921;
objj_executeFile("AppKit/CPPanel.j",NO);
DCFileDropableTargets=[];
var _1=objj_allocateClassPair(CPObject,"DCFileDropController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("view"),new objj_ivar("validFileTypes"),new objj_ivar("dropDelegate"),new objj_ivar("uploadURL"),new objj_ivar("uploadManager"),new objj_ivar("_overView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("view"),function(_3,_4){
with(_3){
return view;
}
}),new objj_method(sel_getUid("setView:"),function(_5,_6,_7){
with(_5){
view=_7;
}
}),new objj_method(sel_getUid("validFileTypes"),function(_8,_9){
with(_8){
return validFileTypes;
}
}),new objj_method(sel_getUid("setValidFileTypes:"),function(_a,_b,_c){
with(_a){
validFileTypes=_c;
}
}),new objj_method(sel_getUid("initWithView:dropDelegate:uploadURL:uploadManager:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
return objj_msgSend(_d,"initWithView:dropDelegate:uploadURL:uploadManager:insertAsFirstSubview:",_f,_10,_11,_12,NO);
}
}),new objj_method(sel_getUid("initWithView:dropDelegate:uploadURL:uploadManager:insertAsFirstSubview:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("DCFileDropController").super_class},"init");
view=_15;
dropDelegate=_16;
uploadURL=_17;
uploadManager=_18;
_overView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_15,"frame").size.width,objj_msgSend(_15,"frame").size.height));
objj_msgSend(_overView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_overView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_overView,"setHitTests:",NO);
objj_msgSend(_overView,"setHidden:",YES);
objj_msgSend(_13,"setFileDropState:",NO);
objj_msgSend(DCFileDropableTargets,"addObject:",_overView._DOMElement);
_15._DOMElement.addEventListener("dragenter",function(_1a){
_1a.preventDefault();
_1a.dataTransfer.dropEffect="copy";
objj_msgSend(_13,"fileDraggingEntered:",_1a);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_15._DOMElement.addEventListener("dragover",function(_1b){
_1b.preventDefault();
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_overView._DOMElement.addEventListener("dragover",function(_1c){
_1c.preventDefault();
_1c.dataTransfer.dropEffect="copy";
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
window.document.addEventListener("dragover",function(_1d){
_1d.preventDefault();
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
if(!objj_msgSend(DCFileDropableTargets,"containsObject:",_1d.toElement)){
_1d.dataTransfer.dropEffect="none";
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
window.document.addEventListener("drop",function(_1e){
_1e.preventDefault();
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_15._DOMElement.addEventListener("drop",function(_1f){
_1f.preventDefault();
objj_msgSend(_13,"fileDropped:",_1f.dataTransfer.files);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
_overView._DOMElement.addEventListener("dragleave",function(_20){
_20.preventDefault();
_20.dataTransfer.dropEffect="none";
objj_msgSend(_13,"fileDraggingExited:",_20);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
}else{
_15._DOMElement.addEventListener("dragleave",function(_21){
_21.preventDefault();
_21.dataTransfer.dropEffect="none";
objj_msgSend(_13,"fileDraggingExited:",_21);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
}
return _13;
}
}),new objj_method(sel_getUid("validateDraggedFiles:"),function(_22,_23,_24){
with(_22){
if(!objj_msgSend(validFileTypes,"count")){
return YES;
}
for(var i=0;i<_24.length;i++){
var _25=_24.item(i).fileName,_26=objj_msgSend(_25,"pathExtension");
return objj_msgSend(validFileTypes,"containsObject:",_26);
}
return YES;
}
}),new objj_method(sel_getUid("setFileDropState:"),function(_27,_28,_29){
with(_27){
if(objj_msgSend(view,"respondsToSelector:",sel_getUid("fileDropUploadController:setState:"))){
objj_msgSend(view,"fileDropUploadController:setState:",_27,_29);
}
}
}),new objj_method(sel_getUid("fileDraggingEntered:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"setFileDropState:",YES);
objj_msgSend(_overView,"setFrame:",CGRectMake(0,0,objj_msgSend(view,"frame").size.width,objj_msgSend(view,"frame").size.height));
objj_msgSend(_overView,"setHidden:",NO);
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
objj_msgSend(view,"addSubview:",_overView);
}
}
}),new objj_method(sel_getUid("fileDraggingExited:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"setFileDropState:",NO);
objj_msgSend(_overView,"setHidden:",YES);
}
}),new objj_method(sel_getUid("fileDropped:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"setFileDropState:",NO);
objj_msgSend(_overView,"setHidden:",YES);
for(var i=0,len=_32.length;i<len;i++){
if(objj_msgSend(dropDelegate,"respondsToSelector:",sel_getUid("newUploadManager:"))){
managerToUse=objj_msgSend(dropDelegate,"newUploadManager:",_30)||uploadManager;
}else{
managerToUse=uploadManager;
}
objj_msgSend(managerToUse,"setEndDelegate:",dropDelegate);
if(objj_msgSend(managerToUse,"respondsToSelector:",sel_getUid("fileUploadWithFile:uploadURL:"))){
var _33=objj_msgSend(managerToUse,"fileUploadWithFile:uploadURL:",_32[i],uploadURL);
if(objj_msgSend(dropDelegate,"respondsToSelector:",sel_getUid("fileDropController:didBeginUpload:"))){
objj_msgSend(dropDelegate,"fileDropController:didBeginUpload:",_30,_33);
}
}
}
}
})]);
p;33;DeepDropFileUpload/DCFileUpload.jt;3622;@STATIC;1.0;I;16;AppKit/CPPanel.jt;3582;
objj_executeFile("AppKit/CPPanel.j",NO);
var _1=objj_allocateClassPair(CPObject,"DCFileUpload"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("progress"),new objj_ivar("delegate"),new objj_ivar("uploadURL"),new objj_ivar("file"),new objj_ivar("xhr"),new objj_ivar("isUploading"),new objj_ivar("response")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("progress"),function(_8,_9){
with(_8){
return progress;
}
}),new objj_method(sel_getUid("setProgress:"),function(_a,_b,_c){
with(_a){
progress=_c;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f,_10,_11){
with(_f){
delegate=_11;
}
}),new objj_method(sel_getUid("uploadURL"),function(_12,_13){
with(_12){
return uploadURL;
}
}),new objj_method(sel_getUid("setUploadURL:"),function(_14,_15,_16){
with(_14){
uploadURL=_16;
}
}),new objj_method(sel_getUid("response"),function(_17,_18){
with(_17){
return response;
}
}),new objj_method(sel_getUid("setResponse:"),function(_19,_1a,_1b){
with(_19){
response=_1b;
}
}),new objj_method(sel_getUid("initWithFile:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("DCFileUpload").super_class},"init");
file=_1e;
progress=0;
isUploading=NO;
return _1c;
}
}),new objj_method(sel_getUid("begin"),function(_1f,_20){
with(_1f){
objj_msgSend(_1f,"processXHR");
}
}),new objj_method(sel_getUid("processXHR"),function(_21,_22){
with(_21){
xhr=new XMLHttpRequest();
var _23=xhr.upload;
_23.addEventListener("progress",function(_24){
if(_24.lengthComputable){
objj_msgSend(_21,"setProgress:",_24.loaded/_24.total);
objj_msgSend(_21,"fileUploadProgressDidChange");
}
},false);
_23.addEventListener("error",function(evt){
CPLog("error: "+evt);
},false);
xhr.addEventListener("load",function(evt){
if(xhr.responseText){
objj_msgSend(_21,"fileUploadDidEndWithResponse:",xhr.responseText);
}
},NO);
xhr.open("POST",objj_msgSend(uploadURL,"absoluteURL"));
xhr.setRequestHeader("If-Modified-Since","Mon, 26 Jul 1997 05:00:00 GMT");
xhr.setRequestHeader("Cache-Control","no-cache");
xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
xhr.setRequestHeader("X-File-Name",file.fileName);
xhr.setRequestHeader("X-File-Size",file.fileSize);
xhr.setRequestHeader("Content-Type","multipart/form-data");
xhr.send(file);
objj_msgSend(_21,"fileUploadDidBegin");
}
}),new objj_method(sel_getUid("fileUploadDidBegin"),function(_25,_26){
with(_25){
isUploading=YES;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadDidBegin:"))){
objj_msgSend(delegate,"fileUploadDidBegin:",_25);
}
}
}),new objj_method(sel_getUid("fileUploadProgressDidChange"),function(_27,_28){
with(_27){
isUploading=YES;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadProgressDidChange:"))){
objj_msgSend(delegate,"fileUploadProgressDidChange:",_27);
}
}
}),new objj_method(sel_getUid("fileUploadDidEndWithResponse:"),function(_29,_2a,_2b){
with(_29){
isUploading=NO;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadDidEnd:withResponse:"))){
objj_msgSend(delegate,"fileUploadDidEnd:withResponse:",_29,_2b);
}
}
}),new objj_method(sel_getUid("isUploading"),function(_2c,_2d){
with(_2c){
return isUploading;
}
}),new objj_method(sel_getUid("cancel"),function(_2e,_2f){
with(_2e){
isUploading=NO;
xhr.abort();
}
})]);
p;40;DeepDropFileUpload/DCFileUploadManager.jt;3674;@STATIC;1.0;I;16;AppKit/CPPanel.ji;14;DCFileUpload.jt;3615;
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("DCFileUpload.j",YES);
SharedFileUploadManager=nil;
var _1=objj_allocateClassPair(CPObject,"DCFileUploadManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("fileUploads"),new objj_ivar("delegate"),new objj_ivar("endDelegate"),new objj_ivar("concurrent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("fileUploads"),function(_3,_4){
with(_3){
return fileUploads;
}
}),new objj_method(sel_getUid("setFileUploads:"),function(_5,_6,_7){
with(_5){
fileUploads=_7;
}
}),new objj_method(sel_getUid("delegate"),function(_8,_9){
with(_8){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_a,_b,_c){
with(_a){
delegate=_c;
}
}),new objj_method(sel_getUid("endDelegate"),function(_d,_e){
with(_d){
return endDelegate;
}
}),new objj_method(sel_getUid("setEndDelegate:"),function(_f,_10,_11){
with(_f){
endDelegate=_11;
}
}),new objj_method(sel_getUid("concurrent"),function(_12,_13){
with(_12){
return concurrent;
}
}),new objj_method(sel_getUid("setConcurrent:"),function(_14,_15,_16){
with(_14){
concurrent=_16;
}
}),new objj_method(sel_getUid("init"),function(_17,_18){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("DCFileUploadManager").super_class},"init");
fileUploads=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
return _17;
}
}),new objj_method(sel_getUid("fileUploadWithFile:uploadURL:"),function(_19,_1a,_1b,_1c){
with(_19){
var _1d=objj_msgSend(objj_msgSend(DCFileUpload,"alloc"),"initWithFile:",_1b);
objj_msgSend(_1d,"setDelegate:",_19);
objj_msgSend(_1d,"setName:",_1b.fileName);
objj_msgSend(_1d,"setUploadURL:",_1c);
objj_msgSend(fileUploads,"addObject:",_1d);
objj_msgSend(_19,"didChange");
if(concurrent||!objj_msgSend(_19,"isUploading")){
objj_msgSend(_1d,"begin");
}
return _1d;
}
}),new objj_method(sel_getUid("isUploading"),function(_1e,_1f){
with(_1e){
for(var i=0;i<objj_msgSend(fileUploads,"count");i++){
var _20=objj_msgSend(fileUploads,"objectAtIndex:",i);
if(objj_msgSend(_20,"isUploading")){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("removeFileUpload:"),function(_21,_22,_23){
with(_21){
objj_msgSend(fileUploads,"removeObject:",_23);
objj_msgSend(_21,"didChange");
}
}),new objj_method(sel_getUid("fileUploadDidBegin:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"didChange");
}
}),new objj_method(sel_getUid("fileUploadProgressDidChange:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"didChange");
}
}),new objj_method(sel_getUid("fileUploadDidEnd:withResponse:"),function(_2a,_2b,_2c,_2d){
with(_2a){
if(!concurrent){
var i=objj_msgSend(fileUploads,"indexOfObject:",_2c)+1;
if(i<objj_msgSend(fileUploads,"count")){
objj_msgSend(objj_msgSend(fileUploads,"objectAtIndex:",i),"begin");
}
}
objj_msgSend(_2a,"didChange");
if(objj_msgSend(endDelegate,"respondsToSelector:",sel_getUid("managerDidUpload:"))){
objj_msgSend(endDelegate,"managerDidUpload:",_2a);
}
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadDidEnd:withResponse:"))){
objj_msgSend(delegate,"fileUploadDidEnd:withResponse:",_2c,_2d);
}
}
}),new objj_method(sel_getUid("didChange"),function(_2e,_2f){
with(_2e){
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadManagerDidChange:"))){
objj_msgSend(delegate,"fileUploadManagerDidChange:",_2e);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sharedManager"),function(_30,_31){
with(_30){
if(!SharedFileUploadManager){
SharedFileUploadManager=objj_msgSend(objj_msgSend(DCFileUploadManager,"alloc"),"init");
}
return SharedFileUploadManager;
}
})]);
p;39;DeepDropFileUpload/DCFileUploadsPanel.jt;3408;@STATIC;1.0;I;16;AppKit/CPPanel.ji;21;DCFileUploadManager.ji;22;DCFileUploadsRowView.jt;3315;
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("DCFileUploadManager.j",YES);
objj_executeFile("DCFileUploadsRowView.j",YES);
var _1=objj_allocateClassPair(CPPanel,"DCFileUploadsPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("list"),new objj_ivar("tableView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"initWithContentRect:styleMask:",_5,CPHUDBackgroundWindowMask|CPClosableWindowMask|CPResizableWindowMask);
if(_3){
list=objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"fileUploads");
objj_msgSend(_3,"setTitle:","Uploads");
objj_msgSend(_3,"setFloatingPanel:",YES);
var _6=objj_msgSend(_3,"contentView");
var _7=objj_msgSend(_6,"bounds");
_7.size.height-=20;
tableView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",_7);
objj_msgSend(tableView,"setDataSource:",_3);
objj_msgSend(tableView,"setDelegate:",_3);
var _8=objj_msgSend(objj_msgSend(DCFileUploadsRowView,"alloc"),"initWithFrame:",CGRectMake(0,0,100,100));
var _9=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","uploads");
objj_msgSend(objj_msgSend(_9,"headerView"),"setStringValue:","Uploads");
objj_msgSend(_9,"setWidth:",220);
objj_msgSend(_9,"setMinWidth:",50);
objj_msgSend(_9,"setEditable:",NO);
objj_msgSend(_9,"setDataView:",_8);
objj_msgSend(tableView,"addTableColumn:",_9);
objj_msgSend(tableView,"setColumnAutoresizingStyle:",CPTableViewLastColumnOnlyAutoresizingStyle);
objj_msgSend(tableView,"setRowHeight:",46);
objj_msgSend(tableView,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleNone);
objj_msgSend(objj_msgSend(tableView,"headerView"),"setFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(tableView,"headerView"),"frame").size.width,0));
objj_msgSend(objj_msgSend(tableView,"cornerView"),"setFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(tableView,"cornerView"),"frame").size.width,0));
var _a=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_7);
objj_msgSend(_a,"setDocumentView:",tableView);
objj_msgSend(_a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a,"setAutohidesScrollers:",YES);
objj_msgSend(_6,"addSubview:",_a);
objj_msgSend(objj_msgSend(_a,"verticalScroller"),"setTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD"));
objj_msgSend(objj_msgSend(_a,"horizontalScroller"),"setTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD"));
objj_msgSend(tableView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_a,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
}
return _3;
}
}),new objj_method(sel_getUid("fileUploadManagerDidChange:"),function(_b,_c,_d){
with(_b){
objj_msgSend(tableView,"reloadData");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(tableView,"selectedRow");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_12,_13,_14,_15,_16){
with(_12){
return objj_msgSend(list,"objectAtIndex:",_16);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(list,"count");
}
})]);
e;
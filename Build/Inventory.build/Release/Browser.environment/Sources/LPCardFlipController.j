@STATIC;1.0;I;21;Foundation/CPObject.ji;17;LPViewAnimation.jt;6253;
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

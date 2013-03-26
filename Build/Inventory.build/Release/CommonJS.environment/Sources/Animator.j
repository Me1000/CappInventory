@STATIC;1.0;I;15;AppKit/CPView.jt;8339;
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

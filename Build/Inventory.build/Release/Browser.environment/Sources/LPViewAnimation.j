@STATIC;1.0;I;21;Foundation/CPObject.jt;7879;
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

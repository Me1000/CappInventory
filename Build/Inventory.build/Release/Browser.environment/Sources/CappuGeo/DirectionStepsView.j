@STATIC;1.0;t;2188;
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

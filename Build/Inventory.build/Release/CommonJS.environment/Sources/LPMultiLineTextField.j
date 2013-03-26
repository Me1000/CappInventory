@STATIC;1.0;I;20;AppKit/CPTextField.jt;6143;
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

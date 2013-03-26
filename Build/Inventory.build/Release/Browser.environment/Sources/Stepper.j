@STATIC;1.0;I;18;AppKit/CPControl.jI;17;AppKit/CPButton.jt;4886;
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

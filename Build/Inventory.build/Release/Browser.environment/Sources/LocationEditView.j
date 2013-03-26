@STATIC;1.0;t;17693;
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

@STATIC;1.0;t;8346;
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

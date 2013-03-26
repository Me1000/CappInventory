@STATIC;1.0;t;4502;
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

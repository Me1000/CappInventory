@STATIC;1.0;I;16;AppKit/CPPanel.ji;14;DCFileUpload.jt;3615;
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

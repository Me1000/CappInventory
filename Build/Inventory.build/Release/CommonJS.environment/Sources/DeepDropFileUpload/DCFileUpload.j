@STATIC;1.0;I;16;AppKit/CPPanel.jt;3582;
objj_executeFile("AppKit/CPPanel.j",NO);
var _1=objj_allocateClassPair(CPObject,"DCFileUpload"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("progress"),new objj_ivar("delegate"),new objj_ivar("uploadURL"),new objj_ivar("file"),new objj_ivar("xhr"),new objj_ivar("isUploading"),new objj_ivar("response")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("progress"),function(_8,_9){
with(_8){
return progress;
}
}),new objj_method(sel_getUid("setProgress:"),function(_a,_b,_c){
with(_a){
progress=_c;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f,_10,_11){
with(_f){
delegate=_11;
}
}),new objj_method(sel_getUid("uploadURL"),function(_12,_13){
with(_12){
return uploadURL;
}
}),new objj_method(sel_getUid("setUploadURL:"),function(_14,_15,_16){
with(_14){
uploadURL=_16;
}
}),new objj_method(sel_getUid("response"),function(_17,_18){
with(_17){
return response;
}
}),new objj_method(sel_getUid("setResponse:"),function(_19,_1a,_1b){
with(_19){
response=_1b;
}
}),new objj_method(sel_getUid("initWithFile:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("DCFileUpload").super_class},"init");
file=_1e;
progress=0;
isUploading=NO;
return _1c;
}
}),new objj_method(sel_getUid("begin"),function(_1f,_20){
with(_1f){
objj_msgSend(_1f,"processXHR");
}
}),new objj_method(sel_getUid("processXHR"),function(_21,_22){
with(_21){
xhr=new XMLHttpRequest();
var _23=xhr.upload;
_23.addEventListener("progress",function(_24){
if(_24.lengthComputable){
objj_msgSend(_21,"setProgress:",_24.loaded/_24.total);
objj_msgSend(_21,"fileUploadProgressDidChange");
}
},false);
_23.addEventListener("error",function(evt){
CPLog("error: "+evt);
},false);
xhr.addEventListener("load",function(evt){
if(xhr.responseText){
objj_msgSend(_21,"fileUploadDidEndWithResponse:",xhr.responseText);
}
},NO);
xhr.open("POST",objj_msgSend(uploadURL,"absoluteURL"));
xhr.setRequestHeader("If-Modified-Since","Mon, 26 Jul 1997 05:00:00 GMT");
xhr.setRequestHeader("Cache-Control","no-cache");
xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
xhr.setRequestHeader("X-File-Name",file.fileName);
xhr.setRequestHeader("X-File-Size",file.fileSize);
xhr.setRequestHeader("Content-Type","multipart/form-data");
xhr.send(file);
objj_msgSend(_21,"fileUploadDidBegin");
}
}),new objj_method(sel_getUid("fileUploadDidBegin"),function(_25,_26){
with(_25){
isUploading=YES;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadDidBegin:"))){
objj_msgSend(delegate,"fileUploadDidBegin:",_25);
}
}
}),new objj_method(sel_getUid("fileUploadProgressDidChange"),function(_27,_28){
with(_27){
isUploading=YES;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadProgressDidChange:"))){
objj_msgSend(delegate,"fileUploadProgressDidChange:",_27);
}
}
}),new objj_method(sel_getUid("fileUploadDidEndWithResponse:"),function(_29,_2a,_2b){
with(_29){
isUploading=NO;
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("fileUploadDidEnd:withResponse:"))){
objj_msgSend(delegate,"fileUploadDidEnd:withResponse:",_29,_2b);
}
}
}),new objj_method(sel_getUid("isUploading"),function(_2c,_2d){
with(_2c){
return isUploading;
}
}),new objj_method(sel_getUid("cancel"),function(_2e,_2f){
with(_2e){
isUploading=NO;
xhr.abort();
}
})]);

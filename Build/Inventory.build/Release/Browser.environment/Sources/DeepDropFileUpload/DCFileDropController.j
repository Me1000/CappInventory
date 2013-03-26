@STATIC;1.0;I;16;AppKit/CPPanel.jt;5921;
objj_executeFile("AppKit/CPPanel.j",NO);
DCFileDropableTargets=[];
var _1=objj_allocateClassPair(CPObject,"DCFileDropController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("view"),new objj_ivar("validFileTypes"),new objj_ivar("dropDelegate"),new objj_ivar("uploadURL"),new objj_ivar("uploadManager"),new objj_ivar("_overView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("view"),function(_3,_4){
with(_3){
return view;
}
}),new objj_method(sel_getUid("setView:"),function(_5,_6,_7){
with(_5){
view=_7;
}
}),new objj_method(sel_getUid("validFileTypes"),function(_8,_9){
with(_8){
return validFileTypes;
}
}),new objj_method(sel_getUid("setValidFileTypes:"),function(_a,_b,_c){
with(_a){
validFileTypes=_c;
}
}),new objj_method(sel_getUid("initWithView:dropDelegate:uploadURL:uploadManager:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
return objj_msgSend(_d,"initWithView:dropDelegate:uploadURL:uploadManager:insertAsFirstSubview:",_f,_10,_11,_12,NO);
}
}),new objj_method(sel_getUid("initWithView:dropDelegate:uploadURL:uploadManager:insertAsFirstSubview:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("DCFileDropController").super_class},"init");
view=_15;
dropDelegate=_16;
uploadURL=_17;
uploadManager=_18;
_overView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_15,"frame").size.width,objj_msgSend(_15,"frame").size.height));
objj_msgSend(_overView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_overView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_overView,"setHitTests:",NO);
objj_msgSend(_overView,"setHidden:",YES);
objj_msgSend(_13,"setFileDropState:",NO);
objj_msgSend(DCFileDropableTargets,"addObject:",_overView._DOMElement);
_15._DOMElement.addEventListener("dragenter",function(_1a){
_1a.preventDefault();
_1a.dataTransfer.dropEffect="copy";
objj_msgSend(_13,"fileDraggingEntered:",_1a);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_15._DOMElement.addEventListener("dragover",function(_1b){
_1b.preventDefault();
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_overView._DOMElement.addEventListener("dragover",function(_1c){
_1c.preventDefault();
_1c.dataTransfer.dropEffect="copy";
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
window.document.addEventListener("dragover",function(_1d){
_1d.preventDefault();
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
if(!objj_msgSend(DCFileDropableTargets,"containsObject:",_1d.toElement)){
_1d.dataTransfer.dropEffect="none";
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
window.document.addEventListener("drop",function(_1e){
_1e.preventDefault();
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
_15._DOMElement.addEventListener("drop",function(_1f){
_1f.preventDefault();
objj_msgSend(_13,"fileDropped:",_1f.dataTransfer.files);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
_overView._DOMElement.addEventListener("dragleave",function(_20){
_20.preventDefault();
_20.dataTransfer.dropEffect="none";
objj_msgSend(_13,"fileDraggingExited:",_20);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
}else{
_15._DOMElement.addEventListener("dragleave",function(_21){
_21.preventDefault();
_21.dataTransfer.dropEffect="none";
objj_msgSend(_13,"fileDraggingExited:",_21);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
},YES);
}
return _13;
}
}),new objj_method(sel_getUid("validateDraggedFiles:"),function(_22,_23,_24){
with(_22){
if(!objj_msgSend(validFileTypes,"count")){
return YES;
}
for(var i=0;i<_24.length;i++){
var _25=_24.item(i).fileName,_26=objj_msgSend(_25,"pathExtension");
return objj_msgSend(validFileTypes,"containsObject:",_26);
}
return YES;
}
}),new objj_method(sel_getUid("setFileDropState:"),function(_27,_28,_29){
with(_27){
if(objj_msgSend(view,"respondsToSelector:",sel_getUid("fileDropUploadController:setState:"))){
objj_msgSend(view,"fileDropUploadController:setState:",_27,_29);
}
}
}),new objj_method(sel_getUid("fileDraggingEntered:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"setFileDropState:",YES);
objj_msgSend(_overView,"setFrame:",CGRectMake(0,0,objj_msgSend(view,"frame").size.width,objj_msgSend(view,"frame").size.height));
objj_msgSend(_overView,"setHidden:",NO);
if(window.navigator.userAgent.indexOf("AppleWebKit")!=-1){
objj_msgSend(view,"addSubview:",_overView);
}
}
}),new objj_method(sel_getUid("fileDraggingExited:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"setFileDropState:",NO);
objj_msgSend(_overView,"setHidden:",YES);
}
}),new objj_method(sel_getUid("fileDropped:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"setFileDropState:",NO);
objj_msgSend(_overView,"setHidden:",YES);
for(var i=0,len=_32.length;i<len;i++){
if(objj_msgSend(dropDelegate,"respondsToSelector:",sel_getUid("newUploadManager:"))){
managerToUse=objj_msgSend(dropDelegate,"newUploadManager:",_30)||uploadManager;
}else{
managerToUse=uploadManager;
}
objj_msgSend(managerToUse,"setEndDelegate:",dropDelegate);
if(objj_msgSend(managerToUse,"respondsToSelector:",sel_getUid("fileUploadWithFile:uploadURL:"))){
var _33=objj_msgSend(managerToUse,"fileUploadWithFile:uploadURL:",_32[i],uploadURL);
if(objj_msgSend(dropDelegate,"respondsToSelector:",sel_getUid("fileDropController:didBeginUpload:"))){
objj_msgSend(dropDelegate,"fileDropController:didBeginUpload:",_30,_33);
}
}
}
}
})]);

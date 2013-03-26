@STATIC;1.0;t;3451;
var _1=objj_allocateClassPair(CPObject,"ItemController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("locationController"),new objj_ivar("activeItem"),new objj_ivar("itemView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("activeItem"),function(_3,_4){
with(_3){
return activeItem;
}
}),new objj_method(sel_getUid("setActiveItem:"),function(_5,_6,_7){
with(_5){
activeItem=_7;
}
}),new objj_method(sel_getUid("initWithItemView:locationController:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("ItemController").super_class},"init");
if(_8){
itemView=_a;
objj_msgSend(itemView,"setItemController:",_8);
locationController=_b;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("refreshItem:"),ItemAttachmentsDidChangeNotification,nil);
}
return _8;
}
}),new objj_method(sel_getUid("refreshItem:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_e,"object");
if(_f===activeItem){
objj_msgSend(itemView.attachmentsCollectionView,"reloadContent");
objj_msgSend(locationController,"refreshItemData");
}
}
}),new objj_method(sel_getUid("setItem:"),function(_10,_11,_12){
with(_10){
activeItem=_12;
objj_msgSend(itemView,"setItem:",activeItem);
}
}),new objj_method(sel_getUid("saveIfNeeded"),function(_13,_14){
with(_13){
if(objj_msgSend(itemView,"isEditing")){
objj_msgSend(_13,"itemDidEndEditing:",objj_msgSend(itemView,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("itemDidEndEditing:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(activeItem,"copy");
objj_msgSend(activeItem,"setName:",objj_msgSend(_17,"name"));
objj_msgSend(activeItem,"setMake:",objj_msgSend(_17,"make"));
objj_msgSend(activeItem,"setModel:",objj_msgSend(_17,"model"));
objj_msgSend(activeItem,"setPrice:",objj_msgSend(_17,"price"));
objj_msgSend(activeItem,"setNotes:",objj_msgSend(_17,"notes"));
objj_msgSend(activeItem,"setDateAcquired:",objj_msgSend(_17,"dateAcquired"));
objj_msgSend(activeItem,"setTags:",objj_msgSend(_17,"tags"));
objj_msgSend(activeItem,"setExtras:",objj_msgSend(_17,"extras"));
objj_msgSend(locationController,"refreshItemData");
var _19=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[activeItem,_18],["oldItem","newItem"]);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",objj_msgSend(locationController,"location"),sel_getUid("replaceItemWithItem:"),_19);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(_1a,_1b,_1c,_1d){
with(_1a){
}
}),new objj_method(sel_getUid("newUploadManager:"),function(_1e,_1f,_20){
with(_1e){
var _21=objj_msgSend(objj_msgSend(ItemAttachment,"alloc"),"init"),_22=objj_msgSend(objj_msgSend(DCFileUploadManager,"alloc"),"init");
objj_msgSend(_21,"setName:","Uploading...");
objj_msgSend(_21,"setUploadManager:",_22);
objj_msgSend(_22,"setDelegate:",_21);
var _23=objj_msgSend(activeItem,"attachments");
objj_msgSend(_23,"addObject:",_21);
objj_msgSend(itemView.attachmentsCollectionView,"reloadContent");
return _22;
}
}),new objj_method(sel_getUid("managerDidUpload:"),function(_24,_25,_26){
with(_24){
objj_msgSend(locationController,"refreshItemData");
}
}),new objj_method(sel_getUid("addAttachment:"),function(_27,_28,_29){
with(_27){
objj_msgSend(activeItem,"addAttachment:",_29);
objj_msgSend(locationController,"refreshItemData");
}
})]);

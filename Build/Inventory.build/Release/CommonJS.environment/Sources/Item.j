@STATIC;1.0;t;6800;
ItemAttachmentsDidChangeNotification="ItemAttachmentsDidChangeNotification";
var _1=objj_allocateClassPair(CPObject,"Item"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("make"),new objj_ivar("model"),new objj_ivar("notes"),new objj_ivar("serial"),new objj_ivar("dateAcquired"),new objj_ivar("price"),new objj_ivar("attachments"),new objj_ivar("tags"),new objj_ivar("extras")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("make"),function(_8,_9){
with(_8){
return make;
}
}),new objj_method(sel_getUid("setMake:"),function(_a,_b,_c){
with(_a){
make=_c;
}
}),new objj_method(sel_getUid("model"),function(_d,_e){
with(_d){
return model;
}
}),new objj_method(sel_getUid("setModel:"),function(_f,_10,_11){
with(_f){
model=_11;
}
}),new objj_method(sel_getUid("notes"),function(_12,_13){
with(_12){
return notes;
}
}),new objj_method(sel_getUid("setNotes:"),function(_14,_15,_16){
with(_14){
notes=_16;
}
}),new objj_method(sel_getUid("serial"),function(_17,_18){
with(_17){
return serial;
}
}),new objj_method(sel_getUid("setSerial:"),function(_19,_1a,_1b){
with(_19){
serial=_1b;
}
}),new objj_method(sel_getUid("dateAcquired"),function(_1c,_1d){
with(_1c){
return dateAcquired;
}
}),new objj_method(sel_getUid("setDateAcquired:"),function(_1e,_1f,_20){
with(_1e){
dateAcquired=_20;
}
}),new objj_method(sel_getUid("price"),function(_21,_22){
with(_21){
return price;
}
}),new objj_method(sel_getUid("setPrice:"),function(_23,_24,_25){
with(_23){
price=_25;
}
}),new objj_method(sel_getUid("attachments"),function(_26,_27){
with(_26){
return attachments;
}
}),new objj_method(sel_getUid("setAttachments:"),function(_28,_29,_2a){
with(_28){
attachments=_2a;
}
}),new objj_method(sel_getUid("tags"),function(_2b,_2c){
with(_2b){
return tags;
}
}),new objj_method(sel_getUid("setTags:"),function(_2d,_2e,_2f){
with(_2d){
tags=_2f;
}
}),new objj_method(sel_getUid("extras"),function(_30,_31){
with(_30){
return extras;
}
}),new objj_method(sel_getUid("setExtras:"),function(_32,_33,_34){
with(_32){
extras=_34;
}
}),new objj_method(sel_getUid("initWithName:"),function(_35,_36,_37){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("Item").super_class},"init");
if(_35){
name=_37;
make="Unknown";
model="";
notes="";
serial="";
dateAcquired=objj_msgSend(CPDate,"date");
attachments=[];
tags=[];
extras=objj_msgSend(CPDictionary,"dictionary");
}
return _35;
}
}),new objj_method(sel_getUid("addAttachment:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(attachments,"addObject:",_3a);
}
}),new objj_method(sel_getUid("removeAttachment:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(attachments,"removeObject:",_3d);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",ItemAttachmentsDidChangeNotification,_3b,nil);
saveAppData();
}
}),new objj_method(sel_getUid("setObject:forExtrasKey:"),function(_3e,_3f,_40,_41){
with(_3e){
objj_msgSend(extras,"setObject:forKey:",_40,_41);
}
}),new objj_method(sel_getUid("valueForExtrasWithKey:"),function(_42,_43,_44){
with(_42){
return objj_msgSend(extras,"objectValueForKey:",_44);
}
}),new objj_method(sel_getUid("isEqual:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_47,"class")===objj_msgSend(_45,"class")){
var one=(objj_msgSend(name,"isEqual:",objj_msgSend(_47,"name"))&&objj_msgSend(make,"isEqual:",objj_msgSend(_47,"make"))&&objj_msgSend(model,"isEqual:",objj_msgSend(_47,"model"))&&objj_msgSend(notes,"isEqual:",objj_msgSend(_47,"notes"))&&objj_msgSend(make,"isEqual:",objj_msgSend(_47,"make"))&&price===objj_msgSend(_47,"price")&&objj_msgSend(attachments,"isEqual:",objj_msgSend(_47,"attachments"))&&objj_msgSend(tags,"isEqual:",objj_msgSend(_47,"tags"))&&objj_msgSend(extras,"isEqual:",objj_msgSend(_47,"extras")));
if(one){
if(dateAcquired){
return objj_msgSend(dateAcquired,"isEqual:",objj_msgSend(_47,"dateAcquired"));
}else{
return YES;
}
}
}
return NO;
}
}),new objj_method(sel_getUid("copy"),function(_48,_49){
with(_48){
var _4a=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",name);
objj_msgSend(_4a,"setMake:",make);
objj_msgSend(_4a,"setModel:",model);
objj_msgSend(_4a,"setNotes:",notes);
objj_msgSend(_4a,"setDateAcquired:",objj_msgSend(dateAcquired,"copy"));
objj_msgSend(_4a,"setPrice:",price);
objj_msgSend(_4a,"setSerial:",serial);
objj_msgSend(_4a,"setAttachments:",objj_msgSend(attachments,"copy"));
objj_msgSend(_4a,"setTags:",objj_msgSend(tags,"copy"));
objj_msgSend(_4a,"setExtras:",objj_msgSend(extras,"copy"));
return _4a;
}
}),new objj_method(sel_getUid("toJSON"),function(_4b,_4c){
with(_4b){
var _4d={};
_4d.name=name;
_4d.attachments=attachments;
_4d.make=make;
_4d.model=model;
_4d.price=price;
_4d.serial=serial;
_4d.notes=notes;
_4d.dateAcquired=objj_msgSend(dateAcquired,"toJSON");
_4d.tags=tags;
_4d.extras=objj_msgSend(extras,"toJSON");
return _4d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_4e,_4f,_50){
with(_4e){
var _51=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",_50.name);
objj_msgSend(_51,"setMake:",_50.make);
objj_msgSend(_51,"setModel:",_50.model);
objj_msgSend(_51,"setPrice:",_50.price);
objj_msgSend(_51,"setNotes:",_50.notes);
objj_msgSend(_51,"setSerial:",_50.serial);
objj_msgSend(_51,"setDateAcquired:",objj_msgSend(CPDate,"decodeJSON:",_50.dateAcquired));
if(_50.tags){
objj_msgSend(_51,"setTags:",_50.tags);
}else{
objj_msgSend(_51,"setTags:",[]);
}
if(_50.attachments){
var _52=[];
for(var i=0;i<_50.attachments.length;i++){
var _53=objj_msgSend(ItemAttachment,"decodeJSON:",_50.attachments[i]);
_52.push(_53);
}
objj_msgSend(_51,"setAttachments:",_52);
}else{
objj_msgSend(_51,"setAttachments:",[]);
}
objj_msgSend(_51,"setExtras:",objj_msgSend(CPDictionary,"dictionaryWithJSObject:",_50.extras));
return _51;
}
})]);
var _1=objj_getClass("CPDate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_54,_55){
with(_54){
return _54.getTime();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_56,_57,_58){
with(_56){
_56=objj_msgSend(CPDate,"date");
_56.setTime(_58);
return _56;
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_59,_5a){
with(_59){
var _5b={},_5c=objj_msgSend(_59,"allKeys"),_5d=objj_msgSend(_59,"allValues");
for(var i=0;i<objj_msgSend(_5c,"count");i++){
_5b[_5c[i]]=_5d[i];
}
return _5b;
}
})]);

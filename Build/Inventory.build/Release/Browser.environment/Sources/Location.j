@STATIC;1.0;t;7709;
var _1=objj_allocateClassPair(CPObject,"Location"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("superLocation"),new objj_ivar("name"),new objj_ivar("type"),new objj_ivar("address"),new objj_ivar("subLocations"),new objj_ivar("items")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("superLocation"),function(_3,_4){
with(_3){
return superLocation;
}
}),new objj_method(sel_getUid("setSuperLocation:"),function(_5,_6,_7){
with(_5){
superLocation=_7;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_a,_b,_c){
with(_a){
name=_c;
}
}),new objj_method(sel_getUid("type"),function(_d,_e){
with(_d){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_f,_10,_11){
with(_f){
type=_11;
}
}),new objj_method(sel_getUid("address"),function(_12,_13){
with(_12){
return address;
}
}),new objj_method(sel_getUid("setAddress:"),function(_14,_15,_16){
with(_14){
address=_16;
}
}),new objj_method(sel_getUid("subLocations"),function(_17,_18){
with(_17){
return subLocations;
}
}),new objj_method(sel_getUid("setSubLocations:"),function(_19,_1a,_1b){
with(_19){
subLocations=_1b;
}
}),new objj_method(sel_getUid("items"),function(_1c,_1d){
with(_1c){
return items;
}
}),new objj_method(sel_getUid("setItems:"),function(_1e,_1f,_20){
with(_1e){
items=_20;
}
}),new objj_method(sel_getUid("initWithName:"),function(_21,_22,_23){
with(_21){
_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("Location").super_class},"init");
if(_21){
name=_23;
subLocations=[];
items=[];
type="";
address="";
superLocation=nil;
}
return _21;
}
}),new objj_method(sel_getUid("addSubLocation:atIndex:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_26,"setSuperLocation:",_24);
objj_msgSend(subLocations,"insertObject:atIndex:",_26,_27);
}
}),new objj_method(sel_getUid("addSubLocation:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"addSubLocation:atIndex:",_2a,subLocations.length);
}
}),new objj_method(sel_getUid("removeSubLocation:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2d,"setSuperLocation:",nil);
objj_msgSend(subLocations,"removeObject:",_2d);
}
}),new objj_method(sel_getUid("moveItemAtIndex:toIndex:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_31>_30){
_31--;
}
if(_30===_31){
return;
}
var _32=items[_30];
objj_msgSend(items,"removeObjectAtIndex:",_30);
objj_msgSend(items,"insertObject:atIndex:",_32,_31);
var _33=objj_msgSend(CPInvocation,"invocationWithMethodSignature:","moveItemAtIndex:toIndex:");
objj_msgSend(_33,"setTarget:",_2e);
objj_msgSend(_33,"setSelector:",sel_getUid("moveItemAtIndex:toIndex:"));
objj_msgSend(_33,"setArgument:atIndex:",_31,2);
objj_msgSend(_33,"setArgument:atIndex:",_30,3);
var _34=objj_msgSend(CPApp,"delegate");
objj_msgSend(objj_msgSend(_34,"locationController"),"refreshItemData");
objj_msgSend(objj_msgSend(_34,"undoManager"),"registerUndoWithTarget:selector:object:",_33,sel_getUid("invoke"),nil);
}
}),new objj_method(sel_getUid("indexOfSubLocation:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(subLocations,"indexOfObject:",_37);
}
}),new objj_method(sel_getUid("addItem:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(items,"addObject:",_3a);
}
}),new objj_method(sel_getUid("removeItem:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(items,"removeObjectIdenticalTo:",_3d);
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(items,"objectAtIndex:",_40);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_41,_42){
with(_41){
return objj_msgSend(items,"count");
}
}),new objj_method(sel_getUid("replaceItemWithItem:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_45,"valueForKey:","oldItem"),_47=objj_msgSend(_45,"valueForKey:","newItem"),_48=objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),_49=objj_msgSend(_48,"locationView");
objj_msgSend(items,"replaceObjectAtIndex:withObject:",objj_msgSend(items,"indexOfObject:",_46),_47);
objj_msgSend(_48,"refreshItemData");
var _4a=objj_msgSend(items,"indexOfObject:",_47);
if(_4a!==-1){
objj_msgSend(objj_msgSend(_49,"itemTableView"),"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_4a),NO);
objj_msgSend(_49,"setActiveItem:",_47);
}
var _4b=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_47,_46],["oldItem","newItem"]);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_43,sel_getUid("replaceItemWithItem:"),_4b);
}
}),new objj_method(sel_getUid("dictionaryValues"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend(CPDictionary,"new");
objj_msgSend(_4e,"setValue:forKey:",name,"name");
objj_msgSend(_4e,"setValue:forKey:",type,"type");
objj_msgSend(_4e,"setValue:forKey:",address,"address");
return _4e;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_4f,_50,_51){
with(_4f){
_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("Location").super_class},"init");
if(_4f){
name=objj_msgSend(_51,"decodeObjectForKey:","LocationName");
type=objj_msgSend(_51,"decodeObjectForKey:","LocationType");
address=objj_msgSend(_51,"decodeObjectForKey:","LocationAddress");
subLocations=objj_msgSend(_51,"decodeObjectForKey:","LocationSubLocations");
superLocation=objj_msgSend(_51,"decodeObjectForKey:","LocationSuperLocation");
}
return _4f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_54,"encodeObject:forKey:",name,"LocationName");
objj_msgSend(_54,"encodeObject:forKey:",type,"LocationType");
objj_msgSend(_54,"encodeObject:forKey:",address,"LocationAddress");
objj_msgSend(_54,"encodeObject:forKey:",subLocations,"LocationSubLocations");
objj_msgSend(_54,"encodeObject:forKey:",superLocation,"LocationSuperLocation");
}
}),new objj_method(sel_getUid("isEqual:"),function(_55,_56,_57){
with(_55){
if(objj_msgSend(_57,"class")===objj_msgSend(_55,"class")){
return (objj_msgSend(name,"isEqual:",objj_msgSend(_57,"name"))&&objj_msgSend(type,"isEqual:",objj_msgSend(_57,"type"))&&objj_msgSend(address,"isEqual:",objj_msgSend(_57,"address"))&&objj_msgSend(subLocations,"isEqual:",objj_msgSend(_57,"subLocations")));
}else{
return NO;
}
}
}),new objj_method(sel_getUid("copy"),function(_58,_59){
with(_58){
var _5a=objj_msgSendSuper({receiver:_58,super_class:objj_getClass("Location").super_class},"copy");
objj_msgSend(_5a,"setSuperLocation:",superLocation);
objj_msgSend(_5a,"setName:",name);
objj_msgSend(_5a,"setType:",type);
objj_msgSend(_5a,"setAddress:",address);
objj_msgSend(_5a,"setSubLocations:",subLocations);
return _5a;
}
}),new objj_method(sel_getUid("toJSON"),function(_5b,_5c){
with(_5b){
var _5d={};
_5d.name=name;
_5d.type=type;
_5d.address=address;
_5d.subLocations=subLocations;
_5d.items=items;
return _5d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("decodeJSON:"),function(_5e,_5f,_60){
with(_5e){
var _61=objj_msgSend(objj_msgSend(Location,"alloc"),"initWithName:",_60.name);
objj_msgSend(_61,"setType:",_60.type);
if(!objj_msgSend(_61,"type")){
objj_msgSend(_61,"setType:","");
}
objj_msgSend(_61,"setAddress:",_60.address);
for(var i=0;i<_60.subLocations.length;i++){
var _62=objj_msgSend(Location,"decodeJSON:",_60.subLocations[i]);
objj_msgSend(_61,"addSubLocation:",_62);
}
for(var i=0;i<_60.items.length;i++){
var _63=objj_msgSend(Item,"decodeJSON:",_60.items[i]);
objj_msgSend(_61,"addItem:",_63);
}
return _61;
}
})]);
objj_class.prototype.toJSON=objj_object.prototype.toJSON=function(){
if(this.isa&&class_getInstanceMethod(this.isa,"toJSON")!=NULL){
return objj_msgSend(this,"toJSON");
}else{
return String(this)+" (-toJSON not implemented)";
}
};

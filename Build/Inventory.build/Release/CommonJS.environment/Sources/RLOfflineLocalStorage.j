@STATIC;1.0;t;1232;
var _1=objj_allocateClassPair(CPObject,"RLOfflineLocalStorage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_3,_4){
with(_3){
return !!window.localStorage;
}
}),new objj_method(sel_getUid("initWithName:delegate:"),function(_5,_6,_7,_8){
with(_5){
_delegate=_8;
if(!objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("dataStoreIsNotSupported"))){
objj_msgSend(_delegate,"localStorageNotSupported");
return;
}
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("RLOfflineLocalStorage").super_class},"init");
return _5;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_9,_a,_b,_c){
with(_9){
localStorage.setItem(_c,_b);
}
}),new objj_method(sel_getUid("getValueForKey:"),function(_d,_e,_f){
with(_d){
return localStorage.getItem(_f);
}
}),new objj_method(sel_getUid("removeValueForKey:"),function(_10,_11,_12){
with(_10){
localStorage.removeItem(_12);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_13,_14){
with(_13){
return !!window.localStorage;
}
})]);

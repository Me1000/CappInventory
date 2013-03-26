@STATIC;1.0;t;2857;
var _1=objj_allocateClassPair(CPObject,"RLOfflineDatabaseStore"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_db"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:delegate:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("RLOfflineDatabaseStore").super_class},"init");
if(_3){
_delegate=_6;
if(!objj_msgSend(RLOfflineDataStore,"offlineDataStoreIsAvailable")&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("dataStoreIsNotSupported"))){
objj_msgSend(_delegate,"dataStoreIsNotSupported");
return;
}
_name=_5;
_size=1024*2000;
_db=openDatabase("RCOfflineDataStore-"+_name,"1.0",_name,_size);
if(!_db&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("userDidRejectDatabase"))){
objj_msgSend(_delegate,"userDidRejectDatabase");
return;
}else{
if(!_db){
objj_msgSend(CPException,"exceptionWithName:reason:userInfo:","RLOfflineDataStore","Offline storage was rejected by the user.",nil);
return;
}
}
_db.transaction(function(_7){
_7.executeSql("CREATE TABLE IF NOT EXISTS InventoryFileCache (key TEXT UNIQUE NOT NULL PRIMARY KEY, value TEXT NOT NULL)");
});
}
return _3;
}
}),new objj_method(sel_getUid("blahsetValue:forKey:"),function(_8,_9,_a,_b){
with(_8){
localStorage.setItem(_b,_a);
}
}),new objj_method(sel_getUid("blahgetValueForKey:"),function(_c,_d,_e){
with(_c){
return localStorage.getItem(_e);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_f,_10,_11,_12){
with(_f){
_db.transaction(function(db){
db.executeSql("UPDATE InventoryFileCache SET value = ? WHERE key = ?",[_11,_12],result=function(tx,rs){
},anError=function(tx,err){
});
db.executeSql("INSERT INTO InventoryFileCache (key, value) VALUES (?, ?)",[_12,_11],result=function(db,rs){
},error=function(db,err){
});
});
}
}),new objj_method(sel_getUid("getValueForKey:"),function(_13,_14,_15){
with(_13){
_db.transaction(function(db){
db.executeSql("SELECT value FROM InventoryFileCache WHERE key=?",[_15],result=function(_16,_17){
objj_msgSend(_13,"_parseResults:",_17);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",nil);
},anError=function(_18,_19){
});
});
}
}),new objj_method(sel_getUid("removeValueForKey:"),function(_1a,_1b,_1c){
with(_1a){
_db.transaction(function(db){
db.executeSql("DELETE FROM InventoryFileCache WHERE key=?",[_1c],result=function(_1d,_1e){
},anError=function(_1f,_20){
});
});
}
}),new objj_method(sel_getUid("_parseResults:"),function(_21,_22,_23){
with(_21){
if(_23.rows.length>0){
var _24=_23.rows.item(0).value;
}else{
var _24=nil;
}
objj_msgSend(_delegate,"didReciveData:",_24);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("offlineDataStoreIsAvailable"),function(_25,_26){
with(_25){
return !!window.openDatabase;
}
})]);

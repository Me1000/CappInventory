@STATIC;1.0;t;1083;
var _1=objj_allocateClassPair(CPObject,"RLFileWrapper"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fileAttributes"),new objj_ivar("_filename"),new objj_ivar("_preferredFilename"),new objj_ivar("_contentData")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_fileAttributes"),function(_3,_4){
with(_3){
return _fileAttributes;
}
}),new objj_method(sel_getUid("_setFileAttributes:"),function(_5,_6,_7){
with(_5){
_fileAttributes=_7;
}
}),new objj_method(sel_getUid("_filename"),function(_8,_9){
with(_8){
return _filename;
}
}),new objj_method(sel_getUid("_setFilename:"),function(_a,_b,_c){
with(_a){
_filename=_c;
}
}),new objj_method(sel_getUid("_preferredFilename"),function(_d,_e){
with(_d){
return _preferredFilename;
}
}),new objj_method(sel_getUid("_setPreferredFilename:"),function(_f,_10,_11){
with(_f){
_preferredFilename=_11;
}
}),new objj_method(sel_getUid("_contentData"),function(_12,_13){
with(_12){
return _contentData;
}
}),new objj_method(sel_getUid("_setContentData:"),function(_14,_15,_16){
with(_14){
_contentData=_16;
}
})]);

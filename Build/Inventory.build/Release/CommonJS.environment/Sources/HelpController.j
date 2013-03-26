@STATIC;1.0;t;555;
var _1=objj_allocateClassPair(CPObject,"HelpController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("helpWindow"),new objj_ivar("webview")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("showHelp:"),function(_3,_4,_5){
with(_3){
if(!helpWindow){
helpWindow=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,465,450),CPClosableWindowMask);
objj_msgSend(helpWindow,"setTitle:","Iguana Help");
}
objj_msgSend(helpWindow,"center");
objj_msgSend(helpWindow,"orderFront:",nil);
}
})]);

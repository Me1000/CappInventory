@STATIC;1.0;t;1117;
var _1=objj_getClass("CPDate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("monthByName"),function(_3,_4){
with(_3){
var _5=_3.getMonth();
switch(_5){
case 0:
_5="January";
break;
case 1:
_5="February";
break;
case 2:
_5="March";
break;
case 3:
_5="April";
break;
case 4:
_5="May";
break;
case 5:
_5="June";
break;
case 6:
_5="July";
break;
case 7:
_5="August";
break;
case 8:
_5="September";
break;
case 9:
_5="October";
break;
case 10:
_5="November";
break;
case 11:
_5="December";
break;
}
return _5;
}
}),new objj_method(sel_getUid("longStringDate"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"monthByName")+" "+objj_msgSend(_6,"enlongatedDay")+", "+_6.getFullYear();
}
}),new objj_method(sel_getUid("enlongatedDay"),function(_8,_9){
with(_8){
var _a=String(_8.getDate());
if(_a.length===2&&_a[1]==="1"){
return _a+"st";
}
if(_a[_a.length]==="1"){
return _a+"st";
}else{
if(_a[_a.length]==="2"){
return _a+"nd";
}else{
if(_a[_a.length]==="3"){
return _a+"rd";
}else{
return _a+"th";
}
}
}
}
})]);

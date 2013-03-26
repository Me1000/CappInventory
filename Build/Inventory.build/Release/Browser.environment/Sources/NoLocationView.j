@STATIC;1.0;t;4822;
var _1=objj_allocateClassPair(CPView,"NoLocationView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("NoLocationView").super_class},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
var _6=objj_msgSend(CPTextField,"new");
objj_msgSend(_6,"setStringValue:","No Location Selected");
objj_msgSend(_6,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",36));
objj_msgSend(_6,"sizeToFit");
objj_msgSend(_6,"setCenter:",CGPointMake(CGRectGetMidX(_5),60));
objj_msgSend(_6,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_6,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(_6,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_6,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(_3,"addSubview:",_6);
var _7=objj_msgSend(CPBundle,"mainBundle"),_8=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/1.png"),CGSizeMake(14,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/2.png"),CGSizeMake(9,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/3.png"),CGSizeMake(10,13)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/4.png"),CGSizeMake(14,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/5.png"),CGSizeMake(6,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/6.png"),CGSizeMake(10,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/7.png"),CGSizeMake(14,8)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/8.png"),CGSizeMake(9,8)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","WellView/9.png"),CGSizeMake(10,8))])),_9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake((_5.size.width/2-25)-91,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","SignPost.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_9,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_9,"setAction:",sel_getUid("addNewLocation:"));
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake(_5.size.width/2-25,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","help.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(LocationEditView,"customBigButton");
objj_msgSend(_9,"setFrame:",CGRectMake(_5.size.width/2-25+91,90,84,39));
objj_msgSend(_9,"setAutoresizingMask:",CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","iPhoneIcon.png"),CGSizeMake(32,32)));
objj_msgSend(_9,"setImagePosition:",CPImageOnly);
objj_msgSend(_3,"addSubview:",_9);
var _9=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(50,300,_5.size.width-100,90)),_a=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(53,285,0,0));
objj_msgSend(_a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_a,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(_a,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_a,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_a,"setStringValue:","Import Queue");
objj_msgSend(_a,"sizeToFit");
objj_msgSend(_9,"setBackgroundColor:",_8);
objj_msgSend(_9,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3,"addSubview:",_a);
objj_msgSend(_3,"addSubview:",_9);
}
return _3;
}
})]);

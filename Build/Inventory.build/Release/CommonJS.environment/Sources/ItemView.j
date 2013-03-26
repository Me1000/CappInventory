@STATIC;1.0;t;55583;
var _1=objj_allocateClassPair(CPView,"ItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("MINHEIGHT"),new objj_ivar("locationController"),new objj_ivar("itemController"),new objj_ivar("isEditing"),new objj_ivar("itemContentView"),new objj_ivar("scrollView"),new objj_ivar("mainItemImage"),new objj_ivar("nameField"),new objj_ivar("makeField"),new objj_ivar("modelField"),new objj_ivar("priceField"),new objj_ivar("serialField"),new objj_ivar("dateAcquiredField"),new objj_ivar("clearDateButton"),new objj_ivar("dateAcquiredTextField"),new objj_ivar("tagsField"),new objj_ivar("tagsUnedited"),new objj_ivar("notesLabel"),new objj_ivar("tagsArray"),new objj_ivar("notesField"),new objj_ivar("extrasLabels"),new objj_ivar("extrasFields"),new objj_ivar("removeExtraFieldButtons"),new objj_ivar("addExtraFieldButton"),new objj_ivar("_completionMenu"),new objj_ivar("noItemView"),new objj_ivar("newFieldPrompt"),new objj_ivar("createNewFieldButton"),new objj_ivar("attachmentsScrollView"),new objj_ivar("attachmentsCollectionView"),new objj_ivar("mainImageUpload")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("locationController"),function(_3,_4){
with(_3){
return locationController;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_5,_6,_7){
with(_5){
locationController=_7;
}
}),new objj_method(sel_getUid("itemController"),function(_8,_9){
with(_8){
return itemController;
}
}),new objj_method(sel_getUid("setItemController:"),function(_a,_b,_c){
with(_a){
itemController=_c;
}
}),new objj_method(sel_getUid("isEditing"),function(_d,_e){
with(_d){
return isEditing;
}
}),new objj_method(sel_getUid("setIsEditing:"),function(_f,_10,_11){
with(_f){
isEditing=_11;
}
}),new objj_method(sel_getUid("nameField"),function(_12,_13){
with(_12){
return nameField;
}
}),new objj_method(sel_getUid("setNameField:"),function(_14,_15,_16){
with(_14){
nameField=_16;
}
}),new objj_method(sel_getUid("mainImageUpload"),function(_17,_18){
with(_17){
return mainImageUpload;
}
}),new objj_method(sel_getUid("setMainImageUpload:"),function(_19,_1a,_1b){
with(_19){
mainImageUpload=_1b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("ItemView").super_class},"initWithFrame:",_1e);
if(_1c){
MINHEIGHT=_1e.size.height-100;
objj_msgSend(_1c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
tagsArray=[];
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width,_1e.size.height-90));
itemContentView=objj_msgSend(objj_msgSend(ItemContentView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width-20,_1e.size.height-100));
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(scrollView,"setDocumentView:",itemContentView);
objj_msgSend(_1c,"addSubview:",scrollView);
objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"setDelegate:",itemController);
mainItemImage=objj_msgSend(objj_msgSend(MainItemView,"alloc"),"initWithFrame:",CGRectMake(_1e.size.width-160,10,145,145));
objj_msgSend(mainItemImage,"setController:",_1c);
objj_msgSend(itemContentView,"addSubview:",mainItemImage);
var _1f=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,24,65,28));
objj_msgSend(_1f,"setStringValue:","Name: ");
objj_msgSend(_1f,"sizeToFit");
objj_msgSend(itemContentView,"addSubview:",_1f);
nameField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(nameField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_1f,"frame"))+5,15,275,35));
objj_msgSend(nameField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",24));
objj_msgSend(itemContentView,"addSubview:",nameField);
var _20=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,64,65,28));
objj_msgSend(_20,"setStringValue:","Make: ");
objj_msgSend(_20,"sizeToFit");
objj_msgSend(itemContentView,"addSubview:",_20);
makeField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(makeField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_1f,"frame"))+5,60,275,28));
objj_msgSend(makeField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(nameField,"setNextKeyView:",makeField);
objj_msgSend(nameField,"setNextResponder:",makeField);
objj_msgSend(itemContentView,"addSubview:",makeField);
var _21=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,124,100,28));
objj_msgSend(_21,"setStringValue:","Model: ");
objj_msgSend(itemContentView,"addSubview:",_21);
modelField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(modelField,"setFrame:",CGRectMake(115,120,275,28));
objj_msgSend(modelField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",modelField);
var _22=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,154,100,28));
objj_msgSend(_22,"setStringValue:","Price: ");
objj_msgSend(itemContentView,"addSubview:",_22);
priceField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(priceField,"setFrame:",CGRectMake(115,150,275,28));
objj_msgSend(priceField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",priceField);
var _23=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,184,100,28));
objj_msgSend(_23,"setStringValue:","Serial Number: ");
objj_msgSend(itemContentView,"addSubview:",_23);
serialField=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(serialField,"setFrame:",CGRectMake(115,180,275,28));
objj_msgSend(serialField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(itemContentView,"addSubview:",serialField);
var _24=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,214,100,28));
objj_msgSend(_24,"setStringValue:","Date Acquired: ");
objj_msgSend(itemContentView,"addSubview:",_24);
dateAcquiredField=objj_msgSend(objj_msgSend(DatePicker,"alloc"),"initWithFrame:",CGRectMake(115,210,215,28));
objj_msgSend(dateAcquiredField,"displayPreset:",1);
clearDateButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(340,213,50,24));
objj_msgSend(clearDateButton,"setTitle:","Clear");
objj_msgSend(clearDateButton,"setTarget:",_1c);
objj_msgSend(clearDateButton,"setAction:",sel_getUid("clearDate:"));
dateAcquiredTextField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(115,214,275,28));
objj_msgSend(itemContentView,"addSubview:",dateAcquiredTextField);
var _25=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,244,100,28));
objj_msgSend(_25,"setStringValue:","Tags: ");
objj_msgSend(itemContentView,"addSubview:",_25);
tagsField=objj_msgSend(objj_msgSend(NATokenTextView,"alloc"),"initWithFrame:",CGRectMake(115,240,275,28));
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",CGInsetMake(-1,10,0,10),"content-inset",CPThemeStateNormal);
var _26=objj_msgSend(CPBundle,"mainBundle"),_27=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-8.png"),CGSizeMake(11,9))])),_28=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-0.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-1.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-2.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-3.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-5.png"),CGSizeMake(11,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-6.png"),CGSizeMake(11,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-7.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","TextField/textfield-focused-8.png"),CGSizeMake(11,9))]));
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",_27,"bezel-color",CPThemeStateBezeled);
objj_msgSend(tagsField,"setValue:forThemeAttribute:inState:",_28,"bezel-color",CPThemeStateBezeled|CPThemeStateEditing);
objj_msgSend(tagsField,"setDelegate:",_1c);
tagsUnedited=objj_msgSend(objj_msgSend(AutoExpandingTextField,"alloc"),"initWithFrame:",CGRectMake(115,240,275,28));
objj_msgSend(tagsUnedited,"setValue:forThemeAttribute:",CGInsetMake(7,10,2,10),"content-inset");
objj_msgSend(tagsUnedited,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(itemContentView,"addSubview:",tagsUnedited);
notesLabel=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,274,100,28));
objj_msgSend(notesLabel,"setStringValue:","Notes: ");
objj_msgSend(itemContentView,"addSubview:",notesLabel);
notesField=objj_msgSend(objj_msgSend(AutoExpandingTextField,"alloc"),"init");
objj_msgSend(notesField,"setFrame:",CGRectMake(115,270,275,50));
objj_msgSend(notesField,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(notesField,"setEditable:",NO);
objj_msgSend(notesField,"setBezeled:",NO);
objj_msgSend(notesField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(notesField,"setDelegate:",_1c);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.6,1),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",CGInsetMakeZero(),"bezel-inset",CPThemeStateNormal);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",CGInsetMake(5,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(notesField,"setValue:forThemeAttribute:inState:",_27,"bezel-color",CPThemeStateBezeled);
objj_msgSend(itemContentView,"addSubview:",notesField);
extrasLabels=objj_msgSend(CPDictionary,"dictionary");
extrasFields=objj_msgSend(CPDictionary,"dictionary");
removeExtraFieldButtons=objj_msgSend(CPDictionary,"dictionary");
addExtraFieldButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(17,216,12,12));
objj_msgSend(addExtraFieldButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","AddButton.png"),CGSizeMake(12,12)));
objj_msgSend(addExtraFieldButton,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","AddButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(addExtraFieldButton,"setBordered:",NO);
objj_msgSend(addExtraFieldButton,"setTarget:",_1c);
objj_msgSend(addExtraFieldButton,"setAction:",sel_getUid("promptAddExtraField:"));
attachmentsScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,_1e.size.height-90,_1e.size.width,90));
objj_msgSend(attachmentsScrollView,"setHasVerticalScroller:",NO);
objj_msgSend(attachmentsScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(attachmentsScrollView,"setVerticalLineScroll:",0.0001);
objj_msgSend(attachmentsScrollView,"setHorizontalScroller:",objj_msgSend(LocationController,"customHorizontalScroller"));
attachmentsCollectionView=objj_msgSend(objj_msgSend(DropUploadCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1e.size.width,90));
var _29=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_29,"setView:",objj_msgSend(AttachmentCell,"new"));
objj_msgSend(attachmentsCollectionView,"setMinItemSize:",CGSizeMake(80,85));
objj_msgSend(attachmentsCollectionView,"setMaxItemSize:",CGSizeMake(80,85));
objj_msgSend(attachmentsCollectionView,"setVerticalMargin:",5);
objj_msgSend(attachmentsCollectionView,"setDelegate:",_1c);
objj_msgSend(attachmentsCollectionView,"setItemPrototype:",_29);
objj_msgSend(attachmentsCollectionView,"setMaxNumberOfRows:",1);
window.setTimeout(function(){
var _2a=objj_msgSend(objj_msgSend(DCFileDropController,"alloc"),"initWithView:dropDelegate:uploadURL:uploadManager:",attachmentsCollectionView,itemController,objj_msgSend(CPURL,"URLWithString:","http://timetableapp.com/TestingEnviro/Iguana/upload.php"),objj_msgSend(DCFileUploadManager,"sharedManager"));
objj_msgSend(_2a,"setValidFileTypes:",["png","gif","jpg","pdf"]);
},0);
objj_msgSend(attachmentsScrollView,"setDocumentView:",attachmentsCollectionView);
var _2b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1e.size.height-90,_1e.size.width,11));
objj_msgSend(_2b,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_26,"pathForResource:","Attachments/CollectionShadow.png"),CGSizeMake(52,11))));
objj_msgSend(_2b,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_1c,"addSubview:",attachmentsScrollView);
objj_msgSend(_1c,"addSubview:",_2b);
noItemView=nil;
objj_msgSend(_1c,"setItem:",nil);
}
return _1c;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_2c,_2d,_2e){
with(_2c){
locationController=_2e;
objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"setDelegate:",itemController);
}
}),new objj_method(sel_getUid("setWidth:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(itemContentView,"frame").size.height;
objj_msgSend(itemContentView,"setFrameSize:",CGSizeMake(_31,_32));
}
}),new objj_method(sel_getUid("setupEditViewsWithItem:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"extras"),_37=objj_msgSend(_36,"allKeys"),y=CGRectGetMaxY(objj_msgSend(notesField,"frame"))+3,i=0;
for(;i<objj_msgSend(_37,"count");i++){
var key=_37[i],_38=objj_msgSend(_36,"valueForKey:",key);
var _39=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,y+4,100,28));
objj_msgSend(_39,"setStringValue:",key+": ");
objj_msgSend(extrasLabels,"setValue:forKey:",_39,key);
objj_msgSend(itemContentView,"addSubview:",_39);
var _3a=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(_3a,"setFrame:",CGRectMake(115,y,275,28));
objj_msgSend(_3a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_3a,"setStringValue:",_38);
objj_msgSend(extrasFields,"setValue:forKey:",_3a,key);
objj_msgSend(itemContentView,"addSubview:",_3a);
var _3b=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(3,y+4,12,12)),_3c=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_3b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","MinusButton.png"),CGSizeMake(12,12)));
objj_msgSend(_3b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3c,"pathForResource:","MinusButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(_3b,"setBordered:",NO);
objj_msgSend(_3b,"setTarget:",_33);
objj_msgSend(_3b,"setAction:",sel_getUid("removeField:"));
objj_msgSend(_3b,"setTag:",key);
objj_msgSend(removeExtraFieldButtons,"setValue:forKey:",_3b,key);
y+=30;
}
}
}),new objj_method(sel_getUid("moveExtrasIntoPlace"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(extrasLabels,"allKeys"),y=CGRectGetMaxY(objj_msgSend(notesField,"frame"))+3,i=0;
for(;i<objj_msgSend(_3f,"count");i++){
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(extrasLabels,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(15,y+4));
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(extrasFields,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(115,y));
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(removeExtraFieldButtons,"valueForKey:",_3f[i]));
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_3f[i]),"setFrameOrigin:",CGPointMake(3,y+7));
y+=30;
}
objj_msgSend(addExtraFieldButton,"setFrameOrigin:",CGPointMake(3,y));
var _40=objj_msgSend(itemContentView,"bounds").size;
objj_msgSend(itemContentView,"setFrameSize:",CGSizeMake(_40.width,MAX(MINHEIGHT,y+30)));
}
}),new objj_method(sel_getUid("setExtrasToEdit:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(extrasFields,"allKeys");
i=0;
for(;i<objj_msgSend(_44,"count");i++){
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_44[i]),"setEditable:",_43);
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_44[i]),"setBezeled:",_43);
if(_43){
objj_msgSend(itemContentView,"addSubview:",objj_msgSend(removeExtraFieldButtons,"valueForKey:",_44[i]));
}else{
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_44[i]),"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("removeAllExtras"),function(_45,_46){
with(_45){
var _47=objj_msgSend(extrasLabels,"allKeys"),i=0;
for(;i<objj_msgSend(_47,"count");i++){
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",_47[i]),"removeFromSuperview");
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",_47[i]),"removeFromSuperview");
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",_47[i]),"removeFromSuperview");
}
objj_msgSend(extrasLabels,"removeAllObjects");
objj_msgSend(extrasFields,"removeAllObjects");
objj_msgSend(removeExtraFieldButtons,"removeAllObjects");
}
}),new objj_method(sel_getUid("promptAddExtraField:"),function(_48,_49,_4a){
with(_48){
var _4b=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,300,120),CPDocModalWindowMask),_4c=objj_msgSend(_4b,"contentView"),_4d=objj_msgSend(CPTextField,"labelWithTitle:","Add Item Field: ");
objj_msgSend(_4d,"setFrame:",CGRectMake(15,10,200,25));
objj_msgSend(_4d,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_4d,"sizeToFit");
objj_msgSend(_4c,"addSubview:",_4d);
createNewFieldButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(183,80,100,24));
newFieldPrompt=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,CGRectGetMaxY(objj_msgSend(_4d,"frame"))+5,270,28));
objj_msgSend(newFieldPrompt,"setEditable:",YES);
objj_msgSend(newFieldPrompt,"setBezeled:",YES);
objj_msgSend(newFieldPrompt,"setTarget:",createNewFieldButton);
objj_msgSend(newFieldPrompt,"setAction:",sel_getUid("performClick:"));
objj_msgSend(newFieldPrompt,"setDelegate:",_48);
objj_msgSend(_4c,"addSubview:",newFieldPrompt);
objj_msgSend(createNewFieldButton,"setTitle:","Create");
objj_msgSend(createNewFieldButton,"setTag:",0);
objj_msgSend(createNewFieldButton,"setTarget:",_48);
objj_msgSend(createNewFieldButton,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(createNewFieldButton,"setEnabled:",NO);
objj_msgSend(_4c,"addSubview:",createNewFieldButton);
objj_msgSend(_4b,"setDefaultButton:",createNewFieldButton);
var _4e=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(73,80,100,24));
objj_msgSend(_4e,"setTag:",-1);
objj_msgSend(_4e,"setTitle:","Cancel");
objj_msgSend(_4e,"setTarget:",_48);
objj_msgSend(_4e,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_4c,"addSubview:",_4e);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_4b,objj_msgSend(_48,"window"),_48,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
objj_msgSend(_4b,"makeFirstResponder:",newFieldPrompt);
}
}),new objj_method(sel_getUid("removeField:"),function(_4f,_50,_51){
with(_4f){
var key=objj_msgSend(_51,"tag");
objj_msgSend(objj_msgSend(extrasLabels,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(objj_msgSend(extrasFields,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(objj_msgSend(removeExtraFieldButtons,"valueForKey:",key),"removeFromSuperview");
objj_msgSend(extrasLabels,"removeObjectForKey:",key);
objj_msgSend(extrasFields,"removeObjectForKey:",key);
objj_msgSend(removeExtraFieldButtons,"removeObjectForKey:",key);
objj_msgSend(_4f,"moveExtrasIntoPlace");
}
}),new objj_method(sel_getUid("setItem:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"removeAllExtras");
if(!_54){
if(!noItemView){
noItemView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_52,"bounds"));
objj_msgSend(noItemView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
objj_msgSend(noItemView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
var _55=objj_msgSend(CPTextField,"new");
objj_msgSend(_55,"setStringValue:","No Item Selected");
objj_msgSend(_55,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",22));
objj_msgSend(_55,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","727272"));
objj_msgSend(_55,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_55,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(_55,"sizeToFit");
objj_msgSend(_55,"setCenter:",CGPointMake(CGRectGetMidX(objj_msgSend(_52,"bounds")),CGRectGetMidY(objj_msgSend(_52,"bounds"))-50));
objj_msgSend(_55,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxXMargin|CPViewMaxYMargin);
objj_msgSend(noItemView,"addSubview:",_55);
}
var _56=objj_msgSend(locationController,"locationView");
objj_msgSend(objj_msgSend(_56,"editButton"),"setHidden:",YES);
objj_msgSend(objj_msgSend(_56,"deleteButton"),"setHidden:",YES);
objj_msgSend(objj_msgSend(_56,"uploadButton"),"setHidden:",YES);
objj_msgSend(_52,"addSubview:",noItemView);
return;
}
var _56=objj_msgSend(locationController,"locationView");
objj_msgSend(objj_msgSend(_56,"editButton"),"setHidden:",NO);
objj_msgSend(objj_msgSend(_56,"deleteButton"),"setHidden:",NO);
objj_msgSend(objj_msgSend(_56,"uploadButton"),"setHidden:",NO);
objj_msgSend(noItemView,"removeFromSuperview");
objj_msgSend(nameField,"setStringValue:",objj_msgSend(_54,"name"));
objj_msgSend(makeField,"setStringValue:",objj_msgSend(_54,"make"));
objj_msgSend(modelField,"setStringValue:",objj_msgSend(_54,"model"));
objj_msgSend(priceField,"setStringValue:",objj_msgSend(_54,"price"));
objj_msgSend(serialField,"setStringValue:",objj_msgSend(_54,"serial"));
objj_msgSend(dateAcquiredField,"setDate:",objj_msgSend(objj_msgSend(_54,"dateAcquired"),"copy"));
objj_msgSend(dateAcquiredTextField,"setStringValue:",objj_msgSend(objj_msgSend(_54,"dateAcquired"),"longStringDate"));
objj_msgSend(tagsField,"setTokens:",objj_msgSend(_54,"tags"));
objj_msgSend(tagsUnedited,"setStringValue:",objj_msgSend(objj_msgSend(_54,"tags"),"componentsJoinedByString:",", "));
objj_msgSend(notesField,"setStringValue:",objj_msgSend(_54,"notes"));
objj_msgSend(attachmentsCollectionView,"setContent:",objj_msgSend(_54,"attachments"));
window.setTimeout(function(){
objj_msgSend(tagsUnedited,"sizeToFit");
if(objj_msgSend(tagsUnedited,"frame").size.height<28){
objj_msgSend(tagsUnedited,"setFrameSize:",CGSizeMake(objj_msgSend(tagsUnedited,"frame").size.width,28));
}
objj_msgSend(notesField,"sizeToFit");
if(CGRectGetHeight(objj_msgSend(notesField,"frame"))<50){
objj_msgSend(notesField,"setFrameSize:",CGSizeMake(objj_msgSend(notesField,"frame").size.width,50));
}
objj_msgSend(_52,"setupEditViewsWithItem:",_54);
objj_msgSend(_52,"moveExtrasIntoPlace");
objj_msgSend(_52,"setExtrasToEdit:",isEditing);
},0);
}
}),new objj_method(sel_getUid("extrasForEditingItem"),function(_57,_58){
with(_57){
var _59=objj_msgSend(CPDictionary,"dictionary"),_5a=objj_msgSend(extrasFields,"allKeys"),_5b=objj_msgSend(extrasFields,"allValues"),i=0;
for(;i<objj_msgSend(_5a,"count");i++){
objj_msgSend(_59,"setValue:forKey:",objj_msgSend(_5b[i],"stringValue"),_5a[i]);
}
return _59;
}
}),new objj_method(sel_getUid("toggleEditMode:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5c,"enterEditMode:",!isEditing);
if(!isEditing){
objj_msgSend(itemController,"itemDidEndEditing:",objj_msgSend(_5c,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("itemForEditingValues"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:",objj_msgSend(nameField,"stringValue"));
objj_msgSend(_61,"setMake:",objj_msgSend(makeField,"stringValue"));
objj_msgSend(_61,"setModel:",objj_msgSend(modelField,"stringValue"));
objj_msgSend(_61,"setNotes:",objj_msgSend(notesField,"stringValue"));
objj_msgSend(_61,"setDateAcquired:",objj_msgSend(dateAcquiredField,"date"));
objj_msgSend(_61,"setPrice:",objj_msgSend(priceField,"stringValue"));
tagsArray=objj_msgSend(tagsField,"tokens");
objj_msgSend(_61,"setTags:",tagsArray);
objj_msgSend(_61,"setExtras:",objj_msgSend(_5f,"extrasForEditingItem"));
return _61;
}
}),new objj_method(sel_getUid("enterEditMode:"),function(_62,_63,_64){
with(_62){
isEditing=_64;
objj_msgSend(nameField,"setEditable:",_64);
objj_msgSend(nameField,"setBezeled:",_64);
objj_msgSend(makeField,"setEditable:",_64);
objj_msgSend(makeField,"setBezeled:",_64);
objj_msgSend(makeField,"setEditable:",_64);
objj_msgSend(makeField,"setBezeled:",_64);
objj_msgSend(modelField,"setEditable:",_64);
objj_msgSend(modelField,"setBezeled:",_64);
objj_msgSend(priceField,"setEditable:",_64);
objj_msgSend(priceField,"setBezeled:",_64);
objj_msgSend(serialField,"setEditable:",_64);
objj_msgSend(serialField,"setBezeled:",_64);
objj_msgSend(notesField,"setEditable:",_64);
objj_msgSend(notesField,"setBezeled:",_64);
if(isEditing){
objj_msgSend(dateAcquiredTextField,"removeFromSuperview");
objj_msgSend(itemContentView,"addSubview:",dateAcquiredField);
objj_msgSend(itemContentView,"addSubview:",clearDateButton);
objj_msgSend(itemContentView,"addSubview:",addExtraFieldButton);
objj_msgSend(tagsField,"setFrame:",objj_msgSend(tagsUnedited,"frame"));
objj_msgSend(tagsUnedited,"removeFromSuperview");
objj_msgSend(itemContentView,"addSubview:",tagsField);
objj_msgSend(_62,"tokenTextViewFrameSizeDidChange:",tagsField);
var _65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton-selected.png"),CGSizeMake(18,18));
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"editButton"),"setImage:",_65);
}else{
objj_msgSend(addExtraFieldButton,"removeFromSuperview");
objj_msgSend(dateAcquiredField,"removeFromSuperview");
objj_msgSend(clearDateButton,"removeFromSuperview");
var _66=objj_msgSend(objj_msgSend(dateAcquiredField,"date"),"longStringDate");
objj_msgSend(dateAcquiredTextField,"setStringValue:",_66);
objj_msgSend(itemContentView,"addSubview:",dateAcquiredTextField);
objj_msgSend(tagsUnedited,"setFrame:",objj_msgSend(tagsField,"frame"));
objj_msgSend(tagsField,"removeFromSuperview");
tagsArray=objj_msgSend(tagsField,"tokens");
objj_msgSend(tagsUnedited,"setStringValue:",objj_msgSend(tagsArray,"componentsJoinedByString:",", "));
objj_msgSend(itemContentView,"addSubview:",tagsUnedited);
objj_msgSend(_62,"tokenTextViewFrameSizeDidChange:",tagsUnedited);
var _65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton.png"),CGSizeMake(18,18));
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"editButton"),"setImage:",_65);
}
objj_msgSend(_62,"setExtrasToEdit:",_64);
}
}),new objj_method(sel_getUid("clearDate:"),function(_67,_68,_69){
with(_67){
objj_msgSend(dateAcquiredTextField,"setStringValue:","");
objj_msgSend(dateAcquiredField,"setDate:",nil);
}
}),new objj_method(sel_getUid("closeSheet:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSend(CPApp,"endSheet:returnCode:",objj_msgSend(_6c,"window"),objj_msgSend(_6c,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6f,"orderOut:",_6d);
switch(_70){
case 0:
var key=objj_msgSend(objj_msgSend(newFieldPrompt,"stringValue"),"capitalizedString"),_72=objj_msgSend(ItemView,"customLabelWithFrame:",CGRectMake(15,10,100,28));
if(objj_msgSend(extrasLabels,"containsKey:",key)){
alert("Sorry, You cannot have two extras with the same name.");
return;
}
if(!key){
alert("Sorry, You must enter a name for the new extra.");
return;
}
objj_msgSend(_72,"setStringValue:",key+": ");
objj_msgSend(extrasLabels,"setValue:forKey:",_72,key);
objj_msgSend(itemContentView,"addSubview:",_72);
var _73=objj_msgSend(ItemView,"ItemViewTextField");
objj_msgSend(_73,"setFrame:",CGRectMake(115,10,275,28));
objj_msgSend(_73,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_73,"setBezeled:",YES);
objj_msgSend(_73,"setEditable:",YES);
objj_msgSend(extrasFields,"setValue:forKey:",_73,key);
objj_msgSend(itemContentView,"addSubview:",_73);
var _74=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(3,10,12,12)),_75=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_74,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_75,"pathForResource:","MinusButton.png"),CGSizeMake(12,12)));
objj_msgSend(_74,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_75,"pathForResource:","MinusButtonP.png"),CGSizeMake(12,12)));
objj_msgSend(_74,"setBordered:",NO);
objj_msgSend(_74,"setTarget:",_6d);
objj_msgSend(_74,"setAction:",sel_getUid("removeField:"));
objj_msgSend(_74,"setTag:",key);
objj_msgSend(removeExtraFieldButtons,"setValue:forKey:",_74,key);
objj_msgSend(_6d,"moveExtrasIntoPlace");
objj_msgSend(objj_msgSend(_6d,"window"),"makeFirstResponder:",_73);
var _76=objj_msgSend(scrollView,"contentView");
objj_msgSend(_76,"scrollToPoint:",CGPointMake(0,objj_msgSend(_76,"bounds").size.height));
objj_msgSend(scrollView,"reflectScrolledClipView:",_76);
break;
}
objj_msgSend(newFieldPrompt,"setStringValue:","");
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_79,"object");
if(_7a===newFieldPrompt){
var _7b=objj_msgSend(objj_msgSend(_7a,"stringValue"),"capitalizedString");
objj_msgSend(createNewFieldButton,"setEnabled:",(_7b&&!objj_msgSend(extrasLabels,"containsKey:",_7b)));
}else{
if(_7a===notesField){
objj_msgSend(_7a,"sizeToFit");
if(CGRectGetHeight(objj_msgSend(_7a,"frame"))<50){
objj_msgSend(_7a,"setFrameSize:",CGSizeMake(objj_msgSend(_7a,"frame").size.width,50));
}
objj_msgSend(_77,"moveExtrasIntoPlace");
}
}
}
}),new objj_method(sel_getUid("tokenTextViewFrameSizeDidChange:"),function(_7c,_7d,_7e){
with(_7c){
var _7f=CGRectGetMaxY(objj_msgSend(_7e,"frame"))+4;
objj_msgSend(notesLabel,"setFrameOrigin:",CGPointMake(15,_7f+2));
objj_msgSend(notesField,"setFrameOrigin:",CGPointMake(115,_7f));
objj_msgSend(_7c,"moveExtrasIntoPlace");
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_80,_81,_82,_83){
with(_80){
return ["ItemImageAttachment"];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_84,_85,_86,_87,_88){
with(_84){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_87);
}
}),new objj_method(sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"),function(_89,_8a,_8b,_8c){
with(_89){
return YES;
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_8d,_8e,_8f,_90){
with(_8d){
var _91=objj_msgSend(_8f,"content")[_90],_92=objj_msgSend(_8f,"frameForItemAtIndex:",_90);
_92=objj_msgSend(_8f,"convertRect:toView:",_92,nil);
var _93=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",_92,CPTitledWindowMask|CPHUDBackgroundWindowMask|CPResizableWindowMask|CPClosableWindowMask);
objj_msgSend(_93,"setTitle:",objj_msgSend(_91,"name"));
mediaView=objj_msgSend(objj_msgSend(MediaView,"alloc"),"initWithFrame:",CGRectMake(0,0,900,650));
objj_msgSend(mediaView,"setMedia:forItem:",_91,objj_msgSend(itemController,"activeItem"));
objj_msgSend(_93,"setContentView:",mediaView);
objj_msgSend(_93,"makeKeyAndOrderFront:",_8d);
objj_msgSend(_93,"makeFirstResponder:",mediaView);
var _94=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(_93,"platformWindow"),"contentBounds").size:objj_msgSend(objj_msgSend(_8d,"screen"),"visibleFrame").size,_95=CGPointMake((_94.width-900)/2,(_94.height-650)/2),_96=objj_msgSend(objj_msgSend(_8f,"window"),"frame").size,_97=CGRectMake(_95.x,_95.y,900,650);
objj_msgSend(_93,"setFrame:display:animate:",_97,YES,YES);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("ItemViewTextField"),function(_98,_99){
with(_98){
var _9a=objj_msgSend(LocationEditView,"customTextField");
objj_msgSend(_9a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
objj_msgSend(_9a,"setValue:forThemeAttribute:inState:",CGInsetMake(0,10,0,10),"content-inset",CPThemeStateNormal);
objj_msgSend(_9a,"setValue:forThemeAttribute:inState:",CGInsetMake(1,10,0,10),"content-inset",CPThemeStateEditing);
objj_msgSend(_9a,"setBezeled:",NO);
objj_msgSend(_9a,"setEditable:",NO);
return _9a;
}
}),new objj_method(sel_getUid("customLabelWithFrame:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_9d);
objj_msgSend(_9e,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","666666"));
objj_msgSend(_9e,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_9e,"setAlignment:",CPRightTextAlignment);
return _9e;
}
})]);
var _1=objj_allocateClassPair(LPMultiLineTextField,"AutoExpandingTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setFrameHeightToFit"),function(_9f,_a0){
with(_9f){
var _a1=document.getElementsByTagName("textarea"),_a2=nil;
for(var i=0;i<_a1.length;i++){
if(_a1[i]===document.activeElement){
var _a3=_a1[i],_a4=_a3.clientHeight;
_a4=MAX(_a3.scrollHeight,_a4);
if(_a4>_a3.clientHeight){
_a3.style.height=_a4+"px";
}
var _a5=parseInt(_a3.style.height);
_a2=CGSizeMake(CGRectGetWidth(objj_msgSend(_9f,"bounds")),_a5+14);
}
}
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("AutoExpandingTextField").super_class},"setFrameSize:",_a2);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_a6,_a7){
with(_a6){
var _a8=CGRectGetWidth(objj_msgSend(_a6,"bounds")),_a9=document.createElement("div"),_aa=objj_msgSend(_a6,"stringValue").lastIndexOf("\n")+1;
_a9.style.width=(_a8-objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").left-objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").right)+"px";
_a9.style.font=objj_msgSend(objj_msgSend(_a6,"font"),"cssString");
_a9.innerHTML=objj_msgSend(_a6,"stringValue").replace(/\n/gi,"<br />");
_a9.style.zindex=-200;
document.body.appendChild(_a9);
var _ab=_a9.offsetHeight+objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").top+objj_msgSend(_a6,"currentValueForThemeAttribute:","content-inset").bottom+16;
document.body.removeChild(_a9);
objj_msgSend(_a6,"setFrameSize:",CGSizeMake(_a8,_ab));
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemContentView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_ac,_ad,_ae){
with(_ac){
var _af=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_af,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _b0=[CGPointMake(15,100.5),CGPointMake(388,100.5)];
CGContextStrokeLineSegments(_af,_b0,2);
}
})]);
var _1=objj_allocateClassPair(CPProgressIndicator,"RLProgressIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("updateBackgroundColor"),function(_b1,_b2){
with(_b1){
objj_msgSend(_b1,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-background.png"),CGSizeMake(47,7))));
objj_msgSend(_b1,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_b3,_b4){
with(_b3){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
if(!_barView){
_barView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,1,0,5));
objj_msgSend(_b3,"addSubview:",_barView);
}
var _b5=objj_msgSend(CPBundle,"mainBundle");
objj_msgSend(_barView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-0.png"),CGSizeMake(3,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/upload-bar-2.png"),CGSizeMake(3,5))],NO)));
var _b6=CGRectGetWidth(objj_msgSend(_b3,"bounds")),_b7=_b6*((_doubleValue-_minValue)/(_maxValue-_minValue));
if(_b7>0&&_b7<4){
_b7=4;
}
objj_msgSend(_barView,"setFrameSize:",CGSizeMake(_b7,5));
}
})]);
var _1=objj_allocateClassPair(CPView,"AttachmentCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("bgColor"),new objj_ivar("selectedBGColor"),new objj_ivar("progress"),new objj_ivar("progressBar")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_b8,_b9,_ba){
with(_b8){
if(!borderOverlay){
var _bb=objj_msgSend(CPBundle,"mainBundle");
bgColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_bb,"pathForResource:","Attachments/AttachmentBG.png"),CGSizeMake(54,54)));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(13,5,54,54));
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(14,5,53,52));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_b8,"addSubview:",borderOverlay);
objj_msgSend(_b8,"addSubview:",image);
name=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,58,60,24));
objj_msgSend(name,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(name,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","626262"));
objj_msgSend(name,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(name,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(name,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(name,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_b8,"addSubview:",name);
}
objj_msgSend(image,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"data"),objj_msgSend(_b8,"scaleImageWithSize:",CGSizeMake(578,397))));
objj_msgSend(name,"setStringValue:",objj_msgSend(_ba,"name"));
objj_msgSend(_ba,"setRepresentedView:",_b8);
objj_msgSend(progressBar,"removeFromSuperview");
}
}),new objj_method(sel_getUid("setProgress:"),function(_bc,_bd,_be){
with(_bc){
progress=_be;
if(!progressBar){
var _bf=objj_msgSend(_bc,"bounds");
progressBar=objj_msgSend(objj_msgSend(RLProgressIndicator,"alloc"),"initWithFrame:",CGRectMake(17,_bf.size.height-37,47,7));
objj_msgSend(progressBar,"setMaxValue:",1);
objj_msgSend(_bc,"addSubview:",progressBar);
}
objj_msgSend(_bc,"addSubview:",progressBar);
objj_msgSend(progressBar,"setDoubleValue:",_be);
if(progress>=1){
objj_msgSend(name,"setStringValue:","Processing");
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_c0,_c1,_c2){
with(_c0){
var _c3=objj_msgSend(CPBundle,"mainBundle");
if(!selectedBGColor){
selectedBGColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_c3,"pathForResource:","Attachments/AttachmentBG.png"),CGSizeMake(54,54)));
}
if(_c2){
objj_msgSend(borderOverlay,"setBackgroundColor:",selectedBGColor);
}else{
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
}
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_c4,_c5,_c6){
with(_c4){
var _c7=54,_c8=_c6.height,_c9=_c6.width,_ca=MAX(_c7/_c9,_c7/_c8);
_c9=_ca*_c9;
_c8=_ca*_c8;
return CGSizeMake(_c9,_c8);
}
})]);
var _1=objj_allocateClassPair(CPView,"MainItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("normalBorder"),new objj_ivar("highlightBorder"),new objj_ivar("controller")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("controller"),function(_cb,_cc){
with(_cb){
return controller;
}
}),new objj_method(sel_getUid("setController:"),function(_cd,_ce,_cf){
with(_cd){
controller=_cf;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d0,_d1,_d2){
with(_d0){
_d0=objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("MainItemView").super_class},"initWithFrame:",_d2);
if(_d0){
var _d3=objj_msgSend(CPBundle,"mainBundle");
normalBorder=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-0.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-2.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-3.png"),CGSizeMake(5,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-5.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-6.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-7.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d3,"pathForResource:","ItemCellView/ItemView-8.png"),CGSizeMake(5,5))]));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(5,5,_d2.size.width-10,_d2.size.height-10));
objj_msgSend(borderOverlay,"setBackgroundColor:",normalBorder);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(5,5,_d2.size.width-10,_d2.size.height-10));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_d0,"addSubview:",image);
objj_msgSend(_d0,"addSubview:",borderOverlay);
objj_msgSend(_d0,"registerForDraggedTypes:",["ItemImageAttachment"]);
var _d4=objj_msgSend(objj_msgSend(DCFileDropController,"alloc"),"initWithView:dropDelegate:uploadURL:uploadManager:",_d0,_d0,objj_msgSend(CPURL,"URLWithString:","http://timetableapp.com/TestingEnviro/Iguana/upload.php"),objj_msgSend(DCFileUploadManager,"sharedManager"));
objj_msgSend(_d4,"setValidFileTypes:",["png","gif","jpg"]);
}
return _d0;
}
}),new objj_method(sel_getUid("draggingEntered:"),function(_d5,_d6,_d7){
with(_d5){
if(!highlightBorder){
var _d8=objj_msgSend(CPBundle,"mainBundle");
highlightBorder=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-0.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-1.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-2.png"),CGSizeMake(8,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-3.png"),CGSizeMake(9,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-5.png"),CGSizeMake(8,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-6.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-7.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d8,"pathForResource:","ItemCellView/ItemView-selected-8.png"),CGSizeMake(8,9))]));
}
objj_msgSend(borderOverlay,"setBackgroundColor:",highlightBorder);
}
}),new objj_method(sel_getUid("draggingExited:"),function(_d9,_da,_db){
with(_d9){
objj_msgSend(borderOverlay,"setBackgroundColor:",normalBorder);
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_dc,_dd,_de){
with(_dc){
objj_msgSend(_dc,"setImage:",_de);
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_df,_e0,_e1){
with(_df){
objj_msgSend(_df,"draggingExited:",_e1);
var _e2=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_e1,"draggingPasteboard"),"dataForType:","ItemImageAttachment")),"firstIndex"),cv=objj_msgSend(_e1,"draggingSource"),_e3=objj_msgSend(objj_msgSend(cv,"content")[_e2],"data"),_e4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_e3);
objj_msgSend(_e4,"setDelegate:",_df);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(_e5,_e6,_e7,_e8){
with(_e5){
if(_e8){
objj_msgSend(_e5,"draggingEntered:",nil);
}else{
objj_msgSend(_e5,"draggingExited:",nil);
}
}
}),new objj_method(sel_getUid("fileDropController:didBeginUpload:"),function(_e9,_ea,_eb,_ec){
with(_e9){
objj_msgSend(locationController,"setMainImageUpload:",_ec);
}
}),new objj_method(sel_getUid("setImage:"),function(_ed,_ee,_ef){
with(_ed){
objj_msgSend(_ef,"setSize:",objj_msgSend(_ed,"scaleImageWithSize:",objj_msgSend(_ef,"size")));
objj_msgSend(image,"setImage:",_ef);
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_f0,_f1,_f2){
with(_f0){
var _f3=135,_f4=_f2.height,_f5=_f2.width,_f6=MAX(_f3/_f5,_f3/_f4);
_f5=_f6*_f5;
_f4=_f6*_f4;
return CGSizeMake(_f5,_f4);
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("tile"),function(_f7,_f8){
with(_f7){
var _f9=CGRectGetWidth(objj_msgSend(_f7,"bounds"));
if(!objj_msgSend(_content,"count")||_f9==_tileWidth){
return;
}
var _fa=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_f9/_fa.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _fb=_f9-_numberOfColumns*_fa.width,_fc=NO;
if(_fb>0&&_fa.width<_maxItemSize.width){
_fa.width=MIN(_maxItemSize.width,_fa.width+FLOOR(_fb/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_fa.width<_maxItemSize.width&&_fa.width<_f9){
_fa.width=MIN(_maxItemSize.width,_f9);
}
if(!CGSizeEqualToSize(_itemSize,_fa)){
_itemSize=_fa;
_fc=YES;
}
var _fd=0,_fe=_items.length;
_numberOfRows=CEIL(_fe/_numberOfColumns);
if(_maxNumberOfRows>0){
_numberOfRows=MIN(_maxNumberOfRows,_numberOfRows);
_numberOfColumns=MAX(1,_fe/_numberOfRows);
if(_maxNumberOfColumns>0&&_numberOfColumns>_maxNumberOfColumns){
_numberOfColumns=_maxNumberOfColumns;
}
}
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_fe=MIN(_fe,_maxNumberOfColumns*_maxNumberOfRows);
}
var x=_horizontalMargin,y=-_fa.height;
for(;_fd<_fe;++_fd){
if(_fd%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_fa.height;
}
var _ff=objj_msgSend(_items[_fd],"view");
objj_msgSend(_ff,"setFrameOrigin:",CGPointMake(x,y));
if(_fc){
objj_msgSend(_ff,"setFrameSize:",_itemSize);
}
x+=_fa.width+_horizontalMargin;
}
var _100=objj_msgSend(_f7,"superview"),_101=y+_fa.height,_102=_numberOfColumns*(_fa.width+_horizontalMargin);
_102=MAX(originalWidth,_102);
_101=MAX(originalHeight,_101);
_tileWidth=_102;
objj_msgSend(_f7,"setFrameSize:",CGSizeMake(_102,_101));
_tileWidth=-1;
}
})]);
var _1=objj_allocateClassPair(CPCollectionView,"DropUploadCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("noItemsLabel"),new objj_ivar("isDragging")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(self,_103,_104){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("DropUploadCollectionView").super_class},"initWithFrame:",_104);
originalWidth=_104.size.width;
originalHeight=_104.size.height;
return self;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(self,_105,_106){
with(self){
var _107=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",self,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_107,self);
var _108=objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_106,"locationInWindow"),nil);
if(!_itemForDragging){
_itemForDragging=objj_msgSend(self,"newItemForRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}else{
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}
var view=objj_msgSend(_itemForDragging,"view");
objj_msgSend(view,"setFrameSize:",_itemSize);
objj_msgSend(view,"setAlphaValue:",0.7);
objj_msgSend(self,"dragView:at:offset:event:pasteboard:source:slideBack:",view,objj_msgSend(self,"convertPoint:fromView:",objj_msgSend(_106,"locationInWindow"),nil),CGRectMakeZero(),_mouseDownEvent,nil,self,YES);
}
}),new objj_method(sel_getUid("draggingEntered:"),function(self,_109,info){
with(self){
isDragging=YES;
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("draggingExited:"),function(self,_10a,info){
with(self){
isDragging=NO;
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("fileDropUploadController:setState:"),function(self,_10b,_10c,_10d){
with(self){
if(_10d){
objj_msgSend(self,"draggingEntered:",nil);
}else{
objj_msgSend(self,"draggingExited:",nil);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("tile"),function(self,_10e){
with(self){
if(objj_msgSend(_items,"count")){
objj_msgSend(noItemsLabel,"removeFromSuperview");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("DropUploadCollectionView").super_class},"tile");
}else{
if(!noItemsLabel){
noItemsLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"init");
objj_msgSend(noItemsLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",16));
objj_msgSend(noItemsLabel,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
objj_msgSend(noItemsLabel,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(noItemsLabel,"setTextShadowOffset:",CGSizeMake(2,2));
objj_msgSend(noItemsLabel,"setStringValue:","Drop Files Here To Upload Them.");
objj_msgSend(noItemsLabel,"sizeToFit");
objj_msgSend(noItemsLabel,"setCenter:",objj_msgSend(self,"center"));
}
objj_msgSend(self,"addSubview:",noItemsLabel);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_10f,_110){
with(self){
if(!isDragging){
return;
}
var _111=objj_msgSend(self,"superview"),_110=objj_msgSend(_111,"bounds"),_112=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
_110=objj_msgSend(self,"convertRect:fromView:",_110,_111);
CGContextSetStrokeColor(_112,objj_msgSend(CPColor,"colorWithHexString:","4886ca"));
CGContextSetLineWidth(_112,3);
var _113=CGRectMake(_110.origin.x+4,_110.origin.y+6,_110.size.width-8,_110.size.height-17);
CGContextSetFillColor(_112,objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",72/255,134/255,202/255,0.25));
CGContextFillRoundedRectangleInRect(_112,_113,8,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_112,_113,8,YES,YES,YES,YES);
}
})]);
var _1=objj_getClass("CPEvent");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPEvent\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_couldBeKeyEquivalent"),function(self,_114){
with(self){
if(_type!==CPKeyDown){
return NO;
}
var _115=_characters.length;
if(!_115){
return NO;
}
if(_modifierFlags&(CPCommandKeyMask|CPControlKeyMask)){
return YES;
}
for(var i=0;i<_115;i++){
switch(_characters.charAt(i)){
case CPCarriageReturnCharacter:
case CPNewlineCharacter:
case CPEscapeFunctionKey:
case CPPageUpFunctionKey:
case CPPageDownFunctionKey:
return YES;
}
}
return NO;
}
})]);

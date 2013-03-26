@STATIC;1.0;t;17496;
var _1=objj_allocateClassPair(CPObject,"LocationController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("location"),new objj_ivar("containerView"),new objj_ivar("noLocationView"),new objj_ivar("scrollview"),new objj_ivar("locationView"),new objj_ivar("itemController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("location"),function(_3,_4){
with(_3){
return location;
}
}),new objj_method(sel_getUid("setLocation:"),function(_5,_6,_7){
with(_5){
location=_7;
}
}),new objj_method(sel_getUid("locationView"),function(_8,_9){
with(_8){
return locationView;
}
}),new objj_method(sel_getUid("setLocationView:"),function(_a,_b,_c){
with(_a){
locationView=_c;
}
}),new objj_method(sel_getUid("itemController"),function(_d,_e){
with(_d){
return itemController;
}
}),new objj_method(sel_getUid("setItemController:"),function(_f,_10,_11){
with(_f){
itemController=_11;
}
}),new objj_method(sel_getUid("initWithContentView:"),function(_12,_13,_14){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("LocationController").super_class},"init");
if(_12){
containerView=_14;
var _15=objj_msgSend(containerView,"bounds");
scrollview=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_15);
objj_msgSend(scrollview,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _16=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","texture4.png"),CGSizeMake(97,97));
objj_msgSend(scrollview,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_16));
locationView=objj_msgSend(objj_msgSend(LocationView,"alloc"),"initWithFrame:andController:",CGRectMake(0,0,845,600),_12);
itemController=objj_msgSend(objj_msgSend(ItemController,"alloc"),"initWithItemView:locationController:",objj_msgSend(locationView,"itemView"),_12);
objj_msgSend(scrollview,"setDocumentView:",locationView);
objj_msgSend(scrollview,"setAutohidesScrollers:",YES);
objj_msgSend(containerView,"addSubview:",scrollview);
noLocationView=objj_msgSend(objj_msgSend(NoLocationView,"alloc"),"initWithFrame:",_15);
objj_msgSend(noLocationView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(containerView,"addSubview:",noLocationView);
objj_msgSend(_12,"setLocation:",nil);
}
return _12;
}
}),new objj_method(sel_getUid("edit:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(locationView,"shadowView"),_1b=objj_msgSend(_1a,"frame"),_1c=objj_msgSend(objj_msgSend(scrollview,"window"),"contentView");
_1b=objj_msgSend(objj_msgSend(_1a,"superview"),"convertRect:toView:",_1b,_1c);
var _1d=objj_msgSend(objj_msgSend(LocationEditView,"alloc"),"initWithFrame:",_1b),_1e=objj_msgSend(_1c,"frame");
objj_msgSend(_1d,"setLocationData:",objj_msgSend(location,"dictionaryValues"));
objj_msgSend(_1c,"addSubview:",_1d);
objj_msgSend(_1d,"setSaveAndCloseAction:",sel_getUid("saveAndCloseEditLocationWindow:"));
objj_msgSend(_1d,"setTarget:",_17);
objj_msgSend(_1d,"animateToFrame:willRemove:",CGRectMake(30,5,_1e.size.width-60,_1e.size.height-10),NO);
}
}),new objj_method(sel_getUid("saveAndCloseEditLocationWindow:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_21,"locationData"),_23=objj_msgSend(locationView,"shadowView");
objj_msgSend(_1f,"setLocationData:",_22);
var _24=objj_msgSend(_23,"frame");
_24=objj_msgSend(objj_msgSend(_23,"superview"),"convertRect:toView:",_24,objj_msgSend(objj_msgSend(scrollview,"window"),"contentView"));
objj_msgSend(_21,"animateToFrame:willRemove:",_24,YES);
}
}),new objj_method(sel_getUid("addNewItem:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(objj_msgSend(Item,"alloc"),"initWithName:","Untitled"),_29=objj_msgSend(locationView,"itemTableView");
objj_msgSend(location,"addItem:",_28);
if(objj_msgSend(location,"numberOfItems")){
objj_msgSend(locationView,"hideNoItemsView");
}
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(_29,"reloadData");
var _2a=objj_msgSend(objj_msgSend(location,"items"),"count")-1;
objj_msgSend(_29,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_2a),NO);
objj_msgSend(_29,"scrollRowToVisible:",_2a);
var _2b=objj_msgSend(locationView,"itemView");
objj_msgSend(_2b,"enterEditMode:",YES);
objj_msgSend(objj_msgSend(locationView,"window"),"makeFirstResponder:",objj_msgSend(_2b,"nameField"));
objj_msgSend(objj_msgSend(_2b,"nameField"),"selectText:",_25);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_25,sel_getUid("removeItem:"),_28);
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("refreshItemData"),function(_2c,_2d){
with(_2c){
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(objj_msgSend(locationView,"itemTableView"),"reloadData");
}
}),new objj_method(sel_getUid("addItem:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(locationView,"hideNoItemsView");
objj_msgSend(location,"addItem:",_30);
objj_msgSend(objj_msgSend(locationView,"itemTableView"),"reloadData");
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_2e,sel_getUid("removeItem:"),_30);
}
}),new objj_method(sel_getUid("confirmRemovalOfItem:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,120),CPDocModalWindowMask),_35=objj_msgSend(_34,"contentView"),_36=objj_msgSend(CPTextField,"labelWithTitle:","Delete Item");
objj_msgSend(_36,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_36,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_35,"addSubview:",_36);
var _37=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68));
var _38=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_38,"setImage:",_37);
objj_msgSend(_35,"addSubview:",_38);
var _39=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,325,60));
objj_msgSend(_39,"setStringValue:","Are you sure you want to delete '"+objj_msgSend(_33,"name")+"'? ");
objj_msgSend(_39,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_35,"addSubview:",_39);
var _3a=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(285,85,100,24));
objj_msgSend(_3a,"setTitle:","Remove");
objj_msgSend(_3a,"setTag:",0);
objj_msgSend(_3a,"setTarget:",_31);
objj_msgSend(_3a,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_35,"addSubview:",_3a);
objj_msgSend(_34,"setDefaultButton:",_3a);
var _3b=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,85,100,24));
objj_msgSend(_3b,"setTag:",-1);
objj_msgSend(_3b,"setTitle:","Cancel");
objj_msgSend(_3b,"setTarget:",_31);
objj_msgSend(_3b,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_35,"addSubview:",_3b);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_34,objj_msgSend(locationView,"window"),_31,sel_getUid("didEndSheet:returnCode:contextInfo:"),_33);
}
}),new objj_method(sel_getUid("removeItem:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(location,"removeItem:",_3e);
objj_msgSend(_3c,"refreshItemData");
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_3c,sel_getUid("addItem:"),_3e);
}
}),new objj_method(sel_getUid("setLocation:"),function(_3f,_40,_41){
with(_3f){
location=_41;
if(_41){
var _42=objj_msgSend(locationView,"itemTableView");
objj_msgSend(_42,"reloadData");
objj_msgSend(objj_msgSend(locationView,"collectionView"),"reloadContent");
objj_msgSend(_42,"_noteSelectionIsChanging");
objj_msgSend(_42,"_noteSelectionDidChange");
objj_msgSend(locationView,"setLocationTitle:",objj_msgSend(location,"name"));
objj_msgSend(scrollview,"setHidden:",NO);
objj_msgSend(noLocationView,"setHidden:",YES);
}else{
objj_msgSend(scrollview,"setHidden:",YES);
objj_msgSend(noLocationView,"setHidden:",NO);
}
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"mainToolbar"),"validateVisibleItems");
}
}),new objj_method(sel_getUid("setLocationData:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(location,"dictionaryValues");
if(objj_msgSend(_46,"isEqual:",_45)){
return;
}
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_43,sel_getUid("setLocationData:"),_46);
objj_msgSend(location,"setName:",objj_msgSend(_45,"valueForKey:","name"));
objj_msgSend(location,"setType:",objj_msgSend(_45,"valueForKey:","type"));
objj_msgSend(location,"setAddress:",objj_msgSend(_45,"valueForKey:","address"));
objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"sourceViewController"),"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("allItemsForLocation"),function(_47,_48){
with(_47){
return objj_msgSend(location,"items");
}
}),new objj_method(sel_getUid("currentItem"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(objj_msgSend(objj_msgSend(locationView,"itemTableView"),"selectedRowIndexes"),"firstIndex");
return objj_msgSend(location,"items")[_4b];
}
}),new objj_method(sel_getUid("closeSheet:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(CPApp,"endSheet:returnCode:",objj_msgSend(_4e,"window"),objj_msgSend(_4e,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_4f,_50,_51,_52,_53){
with(_4f){
objj_msgSend(_51,"orderOut:",_4f);
switch(_52){
case 0:
objj_msgSend(locationView,"setActiveItem:",nil);
objj_msgSend(_4f,"removeItem:",_53);
break;
}
}
}),new objj_method(sel_getUid("tableViewSelectionIsChanging:"),function(_54,_55,_56){
with(_54){
objj_msgSend(itemController,"saveIfNeeded");
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_57,_58,_59){
with(_57){
var row=objj_msgSend(objj_msgSend(objj_msgSend(_59,"object"),"selectedRowIndexes"),"firstIndex");
if(row<0){
objj_msgSend(locationView,"setActiveItem:",nil);
}else{
objj_msgSend(locationView,"setActiveItem:",objj_msgSend(location,"itemAtIndex:",row));
}
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_5a,_5b,_5c,_5d,_5e){
with(_5a){
var _5f=objj_msgSend(CPDictionary,"new"),_60=objj_msgSend(location,"items")[_5e];
objj_msgSend(_5f,"setValue:forKey:",objj_msgSend(_60,"name"),"name");
objj_msgSend(_5f,"setValue:forKey:",objj_msgSend(_60,"make"),"maker");
objj_msgSend(_5f,"setValue:forKey:",(objj_msgSend(objj_msgSend(_60,"attachments"),"count")>0),"attachments");
return _5f;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_61,_62,_63){
with(_61){
var _64=objj_msgSend(objj_msgSend(location,"items"),"count");
if(!_64){
objj_msgSend(locationView,"showNoItemsView");
}else{
objj_msgSend(locationView,"hideNoItemsView");
}
return objj_msgSend(objj_msgSend(location,"items"),"count");
}
}),new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"),function(_65,_66,_67,_68,_69){
with(_65){
objj_msgSend(_69,"declareTypes:owner:",["ItemDragType"],_65);
objj_msgSend(_69,"setData:forType:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_68),"ItemDragType");
return YES;
}
}),new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"),function(_6a,_6b,_6c,_6d,row,_6e){
with(_6a){
var _6f=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_6d,"draggingPasteboard"),"dataForType:","ItemDragType")),"firstIndex");
if(row===_6f||row===_6f+1){
return CPDragOperationNone;
}
objj_msgSend(_6c,"setDropRow:dropOperation:",row,CPTableViewDropAbove);
return CPDragOperationMove;
}
}),new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"),function(_70,_71,_72,_73,row,_74){
with(_70){
var _75=objj_msgSend(_73,"draggingPasteboard"),_76=objj_msgSend(_75,"dataForType:","ItemDragType"),_77=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_76),"firstIndex");
if(_77===row){
return NO;
}
objj_msgSend(location,"moveItemAtIndex:toIndex:",_77,row);
return YES;
}
}),new objj_method(sel_getUid("tableViewDeleteKeyPressed:"),function(_78,_79,_7a){
with(_78){
objj_msgSend(_78,"confirmRemovalOfItem:",objj_msgSend(location,"itemAtIndex:",objj_msgSend(objj_msgSend(_7a,"selectedRowIndexes"),"firstIndex")));
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(_7d,"itemIdentifier");
if(_7e==="newItem"){
return !!location;
}else{
return !!location;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("customVerticalScroller"),function(_7f,_80){
with(_7f){
var _81=objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,12,170)),_82=objj_msgSend(CPBundle,"mainBundle"),_83=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-top.png"),CGSizeMake(12,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-center.png"),CGSizeMake(12,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-track-bottom.png"),CGSizeMake(12,6))],YES));
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",21,"minimum-knob-length",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGInsetMake(0,0,0,0),"knob-inset",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGInsetMake(3,0,3,0),"track-inset",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",_83,"knob-slot-color",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGSizeMake(0,0),"decrement-line-size",CPThemeStateVertical);
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",CGSizeMake(0,0),"increment-line-size",CPThemeStateVertical);
var _84=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-top.png"),CGSizeMake(12,7)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-center.png"),CGSizeMake(12,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_82,"pathForResource:","Scroller/scroller-vertical-knob-bottom.png"),CGSizeMake(12,6))],YES));
objj_msgSend(_81,"setValue:forThemeAttribute:inState:",_84,"knob-color",CPThemeStateVertical);
return _81;
}
}),new objj_method(sel_getUid("customHorizontalScroller"),function(_85,_86){
with(_85){
var _87=objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,170,12)),_88=objj_msgSend(CPBundle,"mainBundle"),_89=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-bottom.png"),CGSizeMake(6,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-center.png"),CGSizeMake(1,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-track-top.png"),CGSizeMake(6,12))],NO));
objj_msgSend(_87,"setValue:forThemeAttribute:",21,"minimum-knob-length");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGInsetMake(0,0,0,0),"knob-inset");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGInsetMake(0,3,0,3),"track-inset");
objj_msgSend(_87,"setValue:forThemeAttribute:",_89,"knob-slot-color");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGSizeMake(0,0),"decrement-line-size");
objj_msgSend(_87,"setValue:forThemeAttribute:",CGSizeMake(0,0),"increment-line-size");
var _8a=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-bottom.png"),CGSizeMake(6,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-center.png"),CGSizeMake(1,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","Scroller/scroller-horizontal-knob-top.png"),CGSizeMake(6,12))],NO));
objj_msgSend(_87,"setValue:forThemeAttribute:",_8a,"knob-color");
return _87;
}
})]);

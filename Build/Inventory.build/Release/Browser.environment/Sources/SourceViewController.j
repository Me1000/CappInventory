@STATIC;1.0;t;25767;
var _1;
var _2=objj_allocateClassPair(CPObject,"SourceViewController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("containerView"),new objj_ivar("buttonBar"),new objj_ivar("sourceList"),new objj_ivar("scrollView"),new objj_ivar("minusButton"),new objj_ivar("detailsPanelIsUp"),new objj_ivar("detailsPanel")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("containerView"),function(_4,_5){
with(_4){
return containerView;
}
}),new objj_method(sel_getUid("setContainerView:"),function(_6,_7,_8){
with(_6){
containerView=_8;
}
}),new objj_method(sel_getUid("sourceList"),function(_9,_a){
with(_9){
return sourceList;
}
}),new objj_method(sel_getUid("setSourceList:"),function(_b,_c,_d){
with(_b){
sourceList=_d;
}
}),new objj_method(sel_getUid("initWithContainerView:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("SourceViewController").super_class},"init");
if(_e){
detailsPanelIsUp=NO;
containerView=_10;
var _11=objj_msgSend(_10,"bounds");
buttonBar=objj_msgSend(SourceViewController,"myThemedButtonBar");
objj_msgSend(buttonBar,"setFrame:",CGRectMake(0,_11.size.height-24,_11.size.width,24));
objj_msgSend(buttonBar,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
var _12=objj_msgSend(SourceViewController,"plusButton");
minusButton=objj_msgSend(SourceViewController,"minusButton");
objj_msgSend(minusButton,"setTarget:",_e);
objj_msgSend(minusButton,"setAction:",sel_getUid("removeLocation:"));
objj_msgSend(_12,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_12,"setAction:",sel_getUid("addNewLocation:"));
var _13=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,22)),_14=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-up.png"),CGSizeMake(11,12));
objj_msgSend(_13,"setBordered:",NO);
objj_msgSend(_13,"setImage:",_14);
objj_msgSend(_13,"setImagePosition:",CPImageOnly);
objj_msgSend(_13,"setTarget:",_e);
objj_msgSend(_13,"setAction:",sel_getUid("toggleDetailsPanel:"));
objj_msgSend(buttonBar,"setButtons:",[_12,_13,minusButton]);
objj_msgSend(_10,"addSubview:",buttonBar);
objj_msgSend(objj_msgSend(_10,"superview"),"setButtonBar:forDividerAtIndex:",buttonBar,0);
scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_11.size.width,_11.size.height-24));
sourceList=objj_msgSend(objj_msgSend(RLSourceList,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(sourceList,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(sourceList,"setDelegate:",_e);
objj_msgSend(sourceList,"setDataSource:",_e);
objj_msgSend(sourceList,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleSourceList);
objj_msgSend(sourceList,"registerForDraggedTypes:",["LocationDragType","ItemDragType"]);
objj_msgSend(sourceList,"setTarget:",objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"));
objj_msgSend(sourceList,"setDoubleAction:",sel_getUid("edit:"));
objj_msgSend(sourceList,"setSelectionGradientColors:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(),[109/255,126/255,152.18/255,1,87/255,104/255,124/255,1],[0,1],2),objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",(152/255),(165/255),(182/255),1),objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",(87/255),(127/255),(151/255),1)],[CPSourceListGradient,CPSourceListTopLineColor,CPSourceListBottomLineColor]));
var _15=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","sourcelist"),_16=objj_msgSend(_15,"headerView");
objj_msgSend(_16,"setStringValue:","LOCATIONS");
objj_msgSend(_15,"setDataView:",objj_msgSend(objj_msgSend(SourceListDataView,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_15,"setWidth:",300);
objj_msgSend(_15,"setMinWidth:",50);
objj_msgSend(_15,"setMaxWidth:",250);
objj_msgSend(sourceList,"addTableColumn:",_15);
objj_msgSend(sourceList,"setOutlineTableColumn:",_15);
objj_msgSend(sourceList,"setColumnAutoresizingStyle:",CPTableViewFirstColumnOnlyAutoresizingStyle);
objj_msgSend(sourceList,"setRowHeight:",40);
var _17=objj_msgSend(CPColor,"colorWithHexString:","ededed");
objj_msgSend(sourceList,"setBackgroundColor:",_17);
objj_msgSend(objj_msgSend(sourceList,"headerView"),"setValue:forThemeAttribute:",_17,"background-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",objj_msgSend(CPNull,"null"),"background-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","666666"),"text-color");
objj_msgSend(_16,"setValue:forThemeAttribute:",CGInsetMake(6,7,2,10),"text-inset");
objj_msgSend(objj_msgSend(sourceList,"cornerView"),"setValue:forThemeAttribute:",_17,"background-color");
objj_msgSend(scrollView,"setDocumentView:",sourceList);
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(scrollView,"setAutohidesScrollers:",YES);
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(scrollView,"setHorizontalLineScroll:",0);
objj_msgSend(_10,"addSubview:",scrollView);
}
return _e;
}
}),new objj_method(sel_getUid("removeLocation:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"),_1c=objj_msgSend(sourceList,"itemAtRow:",_1b);
objj_msgSend(objj_msgSend(CPApp,"delegate"),"confirmRemovalOfLocation:",_1c);
}
}),new objj_method(sel_getUid("outlineView:shouldSelectItem:"),function(_1d,_1e,_1f,_20){
with(_1d){
return !objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"isUploading");
}
}),new objj_method(sel_getUid("outlineViewSelectionIsChanging:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),_25=objj_msgSend(objj_msgSend(_24,"locationView"),"itemView");
if(objj_msgSend(_25,"isEditing")){
objj_msgSend(_25,"enterEditMode:",NO);
objj_msgSend(_24,"itemDidEndEditing:",objj_msgSend(_25,"itemForEditingValues"));
}
}
}),new objj_method(sel_getUid("outlineViewSelectionDidChange:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"),_2a=objj_msgSend(sourceList,"itemAtRow:",_29);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),"setLocation:",_2a);
if(!_2a){
objj_msgSend(minusButton,"setEnabled:",NO);
}else{
objj_msgSend(minusButton,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2f){
return objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations")[_2e];
}else{
return objj_msgSend(_2f,"subLocations")[_2e];
}
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_30,_31,_32,_33){
with(_30){
return (objj_msgSend(objj_msgSend(_33,"subLocations"),"count"));
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_34,_35,_36,_37){
with(_34){
if(_37===nil){
return objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"count");
}else{
return objj_msgSend(objj_msgSend(_37,"subLocations"),"count");
}
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_38,_39,_3a,_3b,_3c){
with(_38){
var _3d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
objj_msgSend(_3d,"setValue:forKey:",objj_msgSend(LocationItemTypes,"imageForItemWithTitle:",objj_msgSend(_3c,"type")),"image");
objj_msgSend(_3d,"setObject:forKey:",objj_msgSend(_3c,"name"),"title");
objj_msgSend(_3d,"setObject:forKey:",objj_msgSend(_3c,"numberOfItems"),"items");
return _3d;
}
}),new objj_method(sel_getUid("outlineView:writeItems:toPasteboard:"),function(_3e,_3f,_40,_41,_42){
with(_3e){
objj_msgSend(_42,"declareTypes:owner:",["LocationDragType"],_3e);
objj_msgSend(_42,"setData:forType:",nil,"LocationDragType");
_1=_41;
return YES;
}
}),new objj_method(sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"),function(_43,_44,_45,_46,_47,_48){
with(_43){
var _49=objj_msgSend(_46,"draggingPasteboard");
if(objj_msgSend(objj_msgSend(_49,"types"),"containsObject:","LocationDragType")){
var _4a=(_47)?objj_msgSend(_47,"indexOfSubLocation:",_1[0]):objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_1[0]);
if((_48===_4a||_48===_4a+1)&&_47===objj_msgSend(_1[0],"superLocation")){
return CPDragOperationNone;
}
if(_47===nil){
objj_msgSend(_45,"setDropItem:dropChildIndex:",nil,_48);
}
var _49=objj_msgSend(_46,"draggingPasteboard"),_4b=_1[0];
if(_4b===_47||objj_msgSend(_43,"item:isSubItemOf:",_47,_4b)){
return CPDragOperationNone;
}
if(objj_msgSend(_4b,"superLocation")===_47){
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
}else{
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
}
return CPDragOperationMove;
}else{
if(objj_msgSend(objj_msgSend(_49,"types"),"containsObject:","ItemDragType")){
if(!_47||_48!==-1){
return CPDragOperationNone;
}
objj_msgSend(_45,"setDropItem:dropChildIndex:",_47,_48);
return CPDragOperationMove;
}
}
}
}),new objj_method(sel_getUid("outlineView:acceptDrop:item:childIndex:"),function(_4c,_4d,_4e,_4f,_50,_51){
with(_4c){
var _52=objj_msgSend(_4f,"draggingPasteboard");
if(objj_msgSend(objj_msgSend(_52,"types"),"containsObject:","LocationDragType")){
var _53=_1[0];
var _54=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
objj_msgSend(_54,"setObject:forKey:",_53,"item");
objj_msgSend(_54,"setObject:forKey:",_50,"to");
objj_msgSend(_54,"setObject:forKey:",_51,"index");
objj_msgSend(_4c,"moveLocation:",_54);
_1=nil;
return YES;
}else{
if(objj_msgSend(objj_msgSend(_52,"types"),"containsObject:","ItemDragType")){
var _55=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(_52,"dataForType:","ItemDragType")),"firstIndex"),_56=objj_msgSend(sourceList,"itemAtRow:",objj_msgSend(objj_msgSend(sourceList,"selectedRowIndexes"),"firstIndex"));
_55=objj_msgSend(_56,"itemAtIndex:",_55);
if(objj_msgSend(objj_msgSend(_50,"items"),"containsObject:",_55)){
return NO;
}
objj_msgSend(objj_msgSend(CPApp,"delegate"),"moveItem:fromLocation:to:",_55,_56,_50);
return YES;
}
}
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_57,_58,_59,_5a){
with(_57){
}
}),new objj_method(sel_getUid("moveLocation:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=objj_msgSend(_5d,"objectForKey:","item"),to=objj_msgSend(_5d,"objectForKey:","to"),_5f=(objj_msgSend(_5d,"objectForKey:","index")||0),_60=objj_msgSend(_5e,"superLocation"),_61=nil;
if(_60===to&&((_60&&objj_msgSend(_60,"indexOfSubLocation:",_5e)<_5f)||(objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_5e)<_5f))){
_5f--;
}
if(_60){
_61=objj_msgSend(_60,"indexOfSubLocation:",_5e);
objj_msgSend(_60,"removeSubLocation:",_5e);
}else{
_61=objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"indexOfObject:",_5e);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"removeObject:",_5e);
}
if(to){
objj_msgSend(to,"addSubLocation:atIndex:",_5e,_5f);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"allLocations"),"insertObject:atIndex:",_5e,_5f);
}
objj_msgSend(_5d,"setObject:forKey:",_60,"to");
objj_msgSend(_5d,"setObject:forKey:",_61,"index");
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"undoManager"),"registerUndoWithTarget:selector:object:",_5b,sel_getUid("moveLocation:"),_5d);
objj_msgSend(sourceList,"reloadData");
}
}),new objj_method(sel_getUid("item:isSubItemOf:"),function(_62,_63,_64,_65){
with(_62){
if(objj_msgSend(objj_msgSend(_65,"subLocations"),"containsObject:",_64)){
return YES;
}
for(var i=0;i<objj_msgSend(objj_msgSend(_65,"subLocations"),"count");i++){
if(objj_msgSend(_62,"item:isSubItemOf:",_64,objj_msgSend(_65,"subLocations")[i])){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("toggleDetailsPanel:"),function(_66,_67,_68){
with(_66){
var _69=objj_msgSend(containerView,"bounds");
if(detailsPanelIsUp){
objj_msgSend(containerView,"addSubview:",buttonBar);
objj_msgSend(_68,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-up.png"),CGSizeMake(11,12)));
var _6a=CGRectMake(0,_69.size.height-25,_69.size.width,125),_6b=CGRectMake(0,0,_69.size.width,_69.size.height-24);
}else{
objj_msgSend(_68,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ButtonBar/details-button-down.png"),CGSizeMake(11,12)));
if(!detailsPanel){
detailsPanel=objj_msgSend(objj_msgSend(RLDetailsPane,"alloc"),"initWithFrame:",CGRectMake(0,_69.size.height-25,_69.size.width,125));
}
objj_msgSend(containerView,"addSubview:",detailsPanel);
objj_msgSend(containerView,"addSubview:",buttonBar);
var _6a=CGRectMake(0,_69.size.height-150,_69.size.width,125),_6b=CGRectMake(0,0,_69.size.width,_69.size.height-150);
}
var _6c=objj_msgSend(CPDictionary,"new"),_6d=objj_msgSend(CPDictionary,"new");
objj_msgSend(_6c,"setValue:forKey:",detailsPanel,CPViewAnimationTargetKey);
objj_msgSend(_6c,"setValue:forKey:",objj_msgSend(detailsPanel,"frame"),CPViewAnimationStartFrameKey);
objj_msgSend(_6c,"setValue:forKey:",_6a,CPViewAnimationEndFrameKey);
objj_msgSend(_6c,"setValue:forKey:",CPAnimationEaseOut,CPViewAnimationEffectKey);
objj_msgSend(_6d,"setValue:forKey:",scrollView,CPViewAnimationTargetKey);
objj_msgSend(_6d,"setValue:forKey:",objj_msgSend(scrollView,"frame"),CPViewAnimationStartFrameKey);
objj_msgSend(_6d,"setValue:forKey:",_6b,CPViewAnimationEndFrameKey);
var _6e=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_6c,_6d]);
objj_msgSend(_6e,"setDuration:",0.2);
objj_msgSend(_6e,"startAnimation");
detailsPanelIsUp=!detailsPanelIsUp;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("myThemedButtonBar"),function(_6f,_70){
with(_6f){
var _71=objj_msgSend(objj_msgSend(CPButtonBar,"alloc"),"initWithFrame:",CGRectMake(0,0,147,23)),_72=objj_msgSend(CPBundle,"mainBundle"),_73=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bar-bg.png"),CGSizeMake(1,23)));
objj_msgSend(_71,"setHasResizeControl:",YES);
objj_msgSend(_71,"setValue:forThemeAttribute:",_73,"bezel-color");
var _74=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-left.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bar-center-none.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-right.png"),CGSizeMake(3,22))],NO)),_75=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-left-highlighted.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-center-highlighted.png"),CGSizeMake(2,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_72,"pathForResource:","ButtonBar/button-bezel-right-highlighted.png"),CGSizeMake(2,22))],NO));
objj_msgSend(_71,"setValue:forThemeAttribute:",_74,"button-bezel-color");
objj_msgSend(_71,"setValue:forThemeAttribute:inState:",_75,"button-bezel-color",CPThemeStateHighlighted);
objj_msgSend(_71,"setValue:forThemeAttribute:inState:",_74,"button-bezel-color",CPThemeStateDisabled);
objj_msgSend(_71,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"blackColor"),"button-text-color");
return _71;
}
}),new objj_method(sel_getUid("plusButton"),function(_76,_77){
with(_76){
var _78=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,22)),_79=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","plus_button.png"),CGSizeMake(11,12));
objj_msgSend(_78,"setBordered:",NO);
objj_msgSend(_78,"setImage:",_79);
objj_msgSend(_78,"setImagePosition:",CPImageOnly);
return _78;
}
}),new objj_method(sel_getUid("minusButton"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,5)),_7d=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPButtonBar,"class")),"pathForResource:","minus_button.png"),CGSizeMake(11,4));
objj_msgSend(_7c,"setImageDimsWhenDisabled:",YES);
objj_msgSend(_7c,"setBordered:",NO);
objj_msgSend(_7c,"setImage:",_7d);
objj_msgSend(_7c,"setImagePosition:",CPImageOnly);
return _7c;
}
})]);
var _2=objj_allocateClassPair(CPView,"SourceListDataView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("imageView"),new objj_ivar("label"),new objj_ivar("itemsLabel")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_7e,_7f,_80){
with(_7e){
_7e=objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("SourceListDataView").super_class},"initWithFrame:",_80);
if(_7e){
label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,5,_80.size.width-20,27));
objj_msgSend(label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(label,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","555555"),"text-color");
objj_msgSend(label,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.8),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(label,"setValue:forThemeAttribute:",CGSizeMake(0,1),"text-shadow-offset");
objj_msgSend(label,"setAutoresizingMask:",CPViewWidthSizable);
itemsLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,23,_80.size.width-20,27));
objj_msgSend(itemsLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(itemsLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","333333"),"text-color");
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.8),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(itemsLabel,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",11),"font",CPThemeStateSelectedDataView);
objj_msgSend(itemsLabel,"setAutoresizingMask:",CPViewWidthSizable);
imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(3,10,22,22));
objj_msgSend(_7e,"addSubview:",label);
objj_msgSend(_7e,"addSubview:",itemsLabel);
objj_msgSend(_7e,"addSubview:",imageView);
}
return _7e;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_81,_82,_83){
with(_81){
if(!_83){
return;
}
objj_msgSend(label,"setStringValue:",objj_msgSend(_83,"objectForKey:","title"));
objj_msgSend(imageView,"setImage:",objj_msgSend(_83,"objectForKey:","image"));
objj_msgSend(itemsLabel,"setStringValue:",(objj_msgSend(_83,"objectForKey:","items")||"No")+" Items");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_84,_85,_86){
with(_84){
objj_msgSendSuper({receiver:_84,super_class:objj_getClass("SourceListDataView").super_class},"setThemeState:",_86);
if(_86===CPThemeStateSelectedDataView){
objj_msgSend(label,"setThemeState:",_86);
objj_msgSend(itemsLabel,"setThemeState:",_86);
}
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(_87,_88,_89){
with(_87){
objj_msgSendSuper({receiver:_87,super_class:objj_getClass("SourceListDataView").super_class},"unsetThemeState:",_89);
if(_89===CPThemeStateSelectedDataView){
objj_msgSend(label,"unsetThemeState:",_89);
objj_msgSend(itemsLabel,"unsetThemeState:",_89);
}
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8c,"encodeObject:forKey:",imageView,"imageView");
objj_msgSend(_8c,"encodeObject:forKey:",label,"label");
objj_msgSend(_8c,"encodeObject:forKey:",itemsLabel,"items");
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("SourceListDataView").super_class},"encodeWithCoder:",_8c);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_8d,_8e,_8f){
with(_8d){
_8d=objj_msgSendSuper({receiver:_8d,super_class:objj_getClass("SourceListDataView").super_class},"initWithCoder:",_8f);
if(_8d){
imageView=objj_msgSend(_8f,"decodeObjectForKey:","imageView");
label=objj_msgSend(_8f,"decodeObjectForKey:","label");
itemsLabel=objj_msgSend(_8f,"decodeObjectForKey:","items");
}
return _8d;
}
})]);
var _2=objj_allocateClassPair(CPOutlineView,"RLSourceList"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("menuForEvent:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""),_94=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Remove Location",sel_getUid("removeItem:"),nil),_95=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Add Location",sel_getUid("addNewLocation:"),nil),_96=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","View Location",sel_getUid("newSelectRow:"),nil),_97=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit Location",sel_getUid("edit:"),nil),_98=objj_msgSend(_90,"convertPoint:fromView:",objj_msgSend(_92,"locationInWindow"),nil),row=objj_msgSend(_90,"rowAtPoint:",_98);
objj_msgSend(_94,"setTarget:",_90);
objj_msgSend(_95,"setTarget:",objj_msgSend(CPApp,"delegate"));
objj_msgSend(_96,"setTarget:",_90);
objj_msgSend(_97,"setTarget:",_90);
objj_msgSend(_94,"setRepresentedObject:",row);
objj_msgSend(_96,"setRepresentedObject:",row);
objj_msgSend(_97,"setRepresentedObject:",row);
if(row<0){
objj_msgSend(_94,"setEnabled:",NO);
objj_msgSend(_96,"setEnabled:",NO);
objj_msgSend(_97,"setEnabled:",NO);
}
objj_msgSend(_93,"addItem:",_94);
objj_msgSend(_93,"addItem:",_96);
objj_msgSend(_93,"addItem:",_95);
objj_msgSend(_93,"addItem:",_97);
return _93;
}
}),new objj_method(sel_getUid("edit:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"_noteSelectionIsChanging");
objj_msgSend(_99,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_9b,"representedObject")),NO);
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"delegate"),"locationController"),"edit:",nil);
objj_msgSend(_99,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("newSelectRow:"),function(_9c,_9d,_9e){
with(_9c){
objj_msgSend(_9c,"_noteSelectionIsChanging");
var _9f=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_9e,"representedObject"));
objj_msgSend(_9c,"selectRowIndexes:byExtendingSelection:",_9f,NO);
objj_msgSend(_9c,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("removeItem:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_a0,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_a2,"representedObject")),NO);
objj_msgSend(objj_msgSend(_a0,"delegate"),"removeLocation:",nil);
}
})]);
var _2=objj_allocateClassPair(CPView,"RLDetailsPane"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("spaceUsed"),new objj_ivar("spaceUsedText")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("RLDetailsPane").super_class},"initWithFrame:",_a5);
spaceUsed=objj_msgSend(objj_msgSend(CPProgressIndicator,"alloc"),"initWithFrame:",CGRectMake(15,_a5.size.height-31,_a5.size.width-30,16));
objj_msgSend(spaceUsed,"setDoubleValue:",75);
objj_msgSend(_a3,"addSubview:",spaceUsed);
spaceUsedText=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,_a5.size.height-50,_a5.size.width-30,14));
objj_msgSend(spaceUsedText,"setStringValue:","Storage Used: 1.5GB");
objj_msgSend(spaceUsedText,"sizeToFit");
objj_msgSend(_a3,"addSubview:",spaceUsedText);
var _a6=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,5,_a5.size.width-30,21));
objj_msgSend(_a6,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_a6,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","333333"));
objj_msgSend(_a6,"setTextShadowOffset:",CGSizeMake(1,2));
objj_msgSend(_a6,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_a6,"setStringValue:","Account Details");
objj_msgSend(_a6,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_a3,"addSubview:",_a6);
return _a3;
}
}),new objj_method(sel_getUid("drawRect:"),function(_a7,_a8,_a9){
with(_a7){
var _aa=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_aa,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _ab=[CGPointMake(0,0.5),CGPointMake(_a9.size.width,0.5)];
CGContextStrokeLineSegments(_aa,_ab,2);
}
})]);

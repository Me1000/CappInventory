@STATIC;1.0;I;21;AppKit/CPScrollView.jI;21;Foundation/CPObject.jI;15;MapKit/MapKit.ji;21;CappuGeo/CPLocation.ji;31;CappuGeo/CPLocationController.ji;23;CappuGeo/CPDirections.ji;21;CappuGeo/CPMapImage.ji;22;CappuGeo/CPMapMarker.ji;20;CappuGeo/CPMapView.ji;22;LPMultiLineTextField.ji;22;LPCardFlipController.ji;22;SourceViewController.ji;10;ItemView.ji;20;ItemViewController.ji;14;LocationView.ji;18;LocationEditView.ji;16;NoLocationView.ji;10;Location.ji;20;LocationController.ji;6;Item.ji;16;ItemController.ji;16;ItemAttachment.ji;23;RLOfflineLocalStorage.ji;24;RLOfflineDatabaseStore.ji;11;RLMapView.ji;17;NATokenTextView.ji;9;Stepper.ji;12;DatePicker.ji;18;CPDate+Additions.ji;41;DeepDropFileUpload/DCFileDropController.ji;40;DeepDropFileUpload/DCFileUploadManager.ji;11;MediaView.jt;25560;
saveAppData=function(){
objj_msgSend(objj_msgSend(CPApp,"delegate"),"serialize");
};
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("MapKit/MapKit.j",NO);
objj_executeFile("CappuGeo/CPLocation.j",YES);
objj_executeFile("CappuGeo/CPLocationController.j",YES);
objj_executeFile("CappuGeo/CPDirections.j",YES);
objj_executeFile("CappuGeo/CPMapImage.j",YES);
objj_executeFile("CappuGeo/CPMapMarker.j",YES);
objj_executeFile("CappuGeo/CPMapView.j",YES);
objj_executeFile("LPMultiLineTextField.j",YES);
objj_executeFile("LPCardFlipController.j",YES);
objj_executeFile("SourceViewController.j",YES);
objj_executeFile("ItemView.j",YES);
objj_executeFile("ItemViewController.j",YES);
objj_executeFile("LocationView.j",YES);
objj_executeFile("LocationEditView.j",YES);
objj_executeFile("NoLocationView.j",YES);
objj_executeFile("Location.j",YES);
objj_executeFile("LocationController.j",YES);
objj_executeFile("Item.j",YES);
objj_executeFile("ItemController.j",YES);
objj_executeFile("ItemAttachment.j",YES);
objj_executeFile("RLOfflineLocalStorage.j",YES);
objj_executeFile("RLOfflineDatabaseStore.j",YES);
objj_executeFile("RLMapView.j",YES);
objj_executeFile("NATokenTextView.j",YES);
objj_executeFile("Stepper.j",YES);
objj_executeFile("DatePicker.j",YES);
objj_executeFile("CPDate+Additions.j",YES);
objj_executeFile("DeepDropFileUpload/DCFileDropController.j",YES);
objj_executeFile("DeepDropFileUpload/DCFileUploadManager.j",YES);
objj_executeFile("MediaView.j",YES);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("outsideSplitView"),new objj_ivar("sourceViewController"),new objj_ivar("allLocations"),new objj_ivar("mainWindow"),new objj_ivar("mainToolbar"),new objj_ivar("undoManager"),new objj_ivar("locationController"),new objj_ivar("newLocationTitle"),new objj_ivar("newLocationType")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("sourceViewController"),function(_3,_4){
with(_3){
return sourceViewController;
}
}),new objj_method(sel_getUid("setSourceViewController:"),function(_5,_6,_7){
with(_5){
sourceViewController=_7;
}
}),new objj_method(sel_getUid("allLocations"),function(_8,_9){
with(_8){
return allLocations;
}
}),new objj_method(sel_getUid("setAllLocations:"),function(_a,_b,_c){
with(_a){
allLocations=_c;
}
}),new objj_method(sel_getUid("mainToolbar"),function(_d,_e){
with(_d){
return mainToolbar;
}
}),new objj_method(sel_getUid("setMainToolbar:"),function(_f,_10,_11){
with(_f){
mainToolbar=_11;
}
}),new objj_method(sel_getUid("undoManager"),function(_12,_13){
with(_12){
return undoManager;
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_14,_15,_16){
with(_14){
undoManager=_16;
}
}),new objj_method(sel_getUid("locationController"),function(_17,_18){
with(_17){
return locationController;
}
}),new objj_method(sel_getUid("setLocationController:"),function(_19,_1a,_1b){
with(_19){
locationController=_1b;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_1c,_1d,_1e){
with(_1c){
allLocations=[];
undoManager=objj_msgSend(objj_msgSend(RLUndoManager,"alloc"),"init");
objj_msgSend(undoManager,"setDelegate:",_1c);
mainWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(50,75,1100,650),CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask);
var _1f=objj_msgSend(mainWindow,"contentView");
objj_msgSend(mainWindow,"setFullBridge:",YES);
outsideSplitView=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",objj_msgSend(_1f,"bounds"));
objj_msgSend(outsideSplitView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(outsideSplitView,"setDelegate:",_1c);
objj_msgSend(outsideSplitView,"setIsPaneSplitter:",YES);
var _20=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,500,CGRectGetHeight(objj_msgSend(_1f,"bounds"))));
objj_msgSend(_20,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
locationController=objj_msgSend(objj_msgSend(LocationController,"alloc"),"initWithContentView:",_20);
var _21=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,230,CGRectGetHeight(objj_msgSend(_1f,"bounds"))));
objj_msgSend(outsideSplitView,"addSubview:",_21);
objj_msgSend(outsideSplitView,"addSubview:",_20);
sourceViewController=objj_msgSend(objj_msgSend(SourceViewController,"alloc"),"initWithContainerView:",_21);
objj_msgSend(outsideSplitView,"setVertical:",YES);
objj_msgSend(outsideSplitView,"setPosition:ofDividerAtIndex:",230,0);
objj_msgSend(_1f,"addSubview:",outsideSplitView);
objj_msgSend(mainWindow,"orderFront:",_1c);
var _22=objj_msgSend(CPApp,"mainMenu"),_23=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_24=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_25=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo"),"z"),_26=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo"),"Z"),_27=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("serialize"),"s"),_28=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("load"),"o");
objj_msgSend(_25,"setTarget:",undoManager);
objj_msgSend(_26,"setTarget:",undoManager);
objj_msgSend(_27,"setTarget:",_1c);
objj_msgSend(_28,"setTarget:",_1c);
objj_msgSend(_24,"addItem:",_25);
objj_msgSend(_24,"addItem:",_26);
objj_msgSend(_24,"addItem:",_27);
objj_msgSend(_24,"addItem:",_28);
objj_msgSend(_23,"setSubmenu:",_24);
objj_msgSend(_24,"_setMenuName:","CPMainMenu");
objj_msgSend(CPApp,"setMainMenu:",_24);
objj_msgSend(_22,"removeAllItems");
objj_msgSend(_1c,"load");
mainToolbar=objj_msgSend(objj_msgSend(CPToolbar,"alloc"),"initWithIdentifier:","maintoolbar");
objj_msgSend(mainToolbar,"setDelegate:",_1c);
objj_msgSend(mainWindow,"setToolbar:",mainToolbar);
objj_msgSend(mainToolbar,"validateVisibleItems");
}
}),new objj_method(sel_getUid("confirmRemovalOfLocation:"),function(_29,_2a,_2b){
with(_29){
if(!_2b){
return;
}
var _2c=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,120),CPDocModalWindowMask),_2d=objj_msgSend(_2c,"contentView"),_2e=objj_msgSend(CPTextField,"labelWithTitle:","Delete Location");
objj_msgSend(_2e,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_2e,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_2d,"addSubview:",_2e);
var _2f=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68));
var _30=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_30,"setImage:",_2f);
objj_msgSend(_2d,"addSubview:",_30);
var _31=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,325,60));
objj_msgSend(_31,"setStringValue:","Are you sure you want to remove this location? ");
objj_msgSend(_31,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_2d,"addSubview:",_31);
var _32=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(285,85,100,24));
objj_msgSend(_32,"setTitle:","Remove");
objj_msgSend(_32,"setTag:",0);
objj_msgSend(_32,"setTarget:",_29);
objj_msgSend(_32,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_2d,"addSubview:",_32);
objj_msgSend(_2c,"setDefaultButton:",_32);
var _33=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,85,100,24));
objj_msgSend(_33,"setTag:",-1);
objj_msgSend(_33,"setTitle:","Cancel");
objj_msgSend(_33,"setTarget:",_29);
objj_msgSend(_33,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_2d,"addSubview:",_33);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_2c,mainWindow,_29,sel_getUid("didEndSheet:returnCode:contextInfo:"),_2b);
}
}),new objj_method(sel_getUid("addNewLocation:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,150),CPDocModalWindowMask),_38=objj_msgSend(_37,"contentView"),_39=objj_msgSend(CPTextField,"labelWithTitle:","Add New Location");
objj_msgSend(_39,"setFrame:",CGRectMake(100,10,415,25));
objj_msgSend(_39,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",15));
objj_msgSend(_38,"addSubview:",_39);
var _3a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","logoPlain.png"),CGSizeMake(68,68)),_3b=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(20,10,68,68));
objj_msgSend(_3b,"setImage:",_3a);
objj_msgSend(_38,"addSubview:",_3b);
var _3c=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(280,115,100,24));
objj_msgSend(_3c,"setTitle:","Create");
objj_msgSend(_3c,"setTag:",1);
objj_msgSend(_3c,"setTarget:",_34);
objj_msgSend(_3c,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_38,"addSubview:",_3c);
objj_msgSend(_37,"setDefaultButton:",_3c);
var _3d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(175,115,100,24));
objj_msgSend(_3d,"setTag:",-1);
objj_msgSend(_3d,"setTitle:","Cancel");
objj_msgSend(_3d,"setTarget:",_34);
objj_msgSend(_3d,"setAction:",sel_getUid("closeSheet:"));
objj_msgSend(_38,"addSubview:",_3d);
newLocationTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(100,35,287,28));
objj_msgSend(newLocationTitle,"setBezeled:",YES);
objj_msgSend(newLocationTitle,"setEditable:",YES);
objj_msgSend(newLocationTitle,"setPlaceholderString:","Add new location");
objj_msgSend(newLocationTitle,"setTarget:",_3c);
objj_msgSend(newLocationTitle,"setAction:",sel_getUid("performClick:"));
objj_msgSend(newLocationTitle,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_38,"addSubview:",newLocationTitle);
newLocationType=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(105,70,200,24));
objj_msgSend(newLocationType,"setBordered:",NO);
objj_msgSend(newLocationType,"setTitle:","Select Type");
objj_msgSend(newLocationType,"addItems:",objj_msgSend(LocationItemTypes,"menuItems"));
objj_msgSend(_38,"addSubview:",newLocationType);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_37,mainWindow,_34,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
objj_msgSend(_37,"makeFirstResponder:",newLocationTitle);
}
}),new objj_method(sel_getUid("removeLocation:"),function(_3e,_3f,_40){
with(_3e){
if(!_40){
return;
}
var _41=objj_msgSend(_40,"superLocation");
if(_41){
objj_msgSend(_41,"removeSubLocation:",_40);
}else{
objj_msgSend(allLocations,"removeObject:",_40);
}
var _42=objj_msgSend(sourceViewController,"sourceList");
objj_msgSend(_42,"reloadData");
objj_msgSend(_42,"_noteSelectionDidChange");
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_3e,sel_getUid("addLocation:"),_40);
}
}),new objj_method(sel_getUid("addLocation:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_45,"superLocation")){
objj_msgSend(objj_msgSend(_45,"superLocation"),"addSubLocation:",_45);
}else{
objj_msgSend(allLocations,"addObject:",_45);
}
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_43,sel_getUid("removeLocation:"),_45);
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
}
}),new objj_method(sel_getUid("moveItem:fromLocation:to:"),function(_46,_47,_48,_49,_4a){
with(_46){
objj_msgSend(_4a,"addItem:",_48);
objj_msgSend(_49,"removeItem:",_48);
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"itemTableView"),"reloadData");
objj_msgSend(objj_msgSend(objj_msgSend(locationController,"locationView"),"collectionView"),"reloadContent");
var _4b=objj_msgSend(CPInvocation,"invocationWithMethodSignature:","MoveItem:FromLocation:to:");
objj_msgSend(_4b,"setTarget:",_46);
objj_msgSend(_4b,"setSelector:",sel_getUid("moveItem:fromLocation:to:"));
objj_msgSend(_4b,"setArgument:atIndex:",_48,2);
objj_msgSend(_4b,"setArgument:atIndex:",_4a,3);
objj_msgSend(_4b,"setArgument:atIndex:",_49,4);
objj_msgSend(undoManager,"registerUndoWithTarget:selector:object:",_4b,sel_getUid("invoke"),nil);
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
objj_msgSend(_4f,"removeLocation:",_53);
break;
case 1:
var _54=objj_msgSend(newLocationTitle,"stringValue");
if(!_54){
alert("You gotta enter a name for this location dude!");
return;
}
var _55=objj_msgSend(objj_msgSend(Location,"alloc"),"initWithName:",objj_msgSend(newLocationTitle,"stringValue"));
objj_msgSend(_55,"setType:",(objj_msgSend(newLocationType,"titleOfSelectedItem")||""));
objj_msgSend(_4f,"addLocation:",_55);
break;
}
}
}),new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"),function(_56,_57,_58){
with(_56){
return [CPToolbarFlexibleSpaceItemIdentifier,CPToolbarSeparatorItemIdentifier,CPToolbarSpaceItemIdentifier,"searchfield","newItem","newLocation","undo","redo"];
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_59,_5a,_5b){
with(_59){
return ["newItem","newLocation",CPToolbarSeparatorItemIdentifier,"undo","redo",CPToolbarFlexibleSpaceItemIdentifier,"searchfield"];
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
var _61=objj_msgSend(CPBundle,"mainBundle"),_62=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_5f);
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityHigh);
switch(_5f){
case "newItem":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","itemIcon.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","itemIcon.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",locationController);
objj_msgSend(_62,"setAction:",sel_getUid("addNewItem:"));
objj_msgSend(_62,"setLabel:","New Item");
objj_msgSend(_62,"setTag:","NewItem");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "newLocation":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","SignPost.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","SignPost.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",_5c);
objj_msgSend(_62,"setAction:",sel_getUid("addNewLocation:"));
objj_msgSend(_62,"setLabel:","New Location");
objj_msgSend(_62,"setTag:","NewLocation");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "searchfield":
var _65=objj_msgSend(objj_msgSend(CPSearchField,"alloc"),"initWithFrame:",CGRectMake(0,10,140,30));
objj_msgSend(_65,"setTarget:",_5c);
objj_msgSend(_65,"setAction:",sel_getUid("searchFieldDidChange:"));
objj_msgSend(_65,"setSendsSearchStringImmediately:",YES);
objj_msgSend(_62,"setView:",_65);
objj_msgSend(_62,"setLabel:","Search Items");
objj_msgSend(_62,"setTag:","SearchItems");
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityHigh);
objj_msgSend(_62,"setMinSize:",CGSizeMake(200,30));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(200,30));
break;
case "undo":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","undo.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","undo.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",undoManager);
objj_msgSend(_62,"setAction:",sel_getUid("undo"));
objj_msgSend(_62,"setLabel:","Undo");
objj_msgSend(_62,"setTag:","Undo");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
case "redo":
var _63=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","redo.png"),CPSizeMake(32,32)),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_61,"pathForResource:","redo.png"),CPSizeMake(32,32));
objj_msgSend(_62,"setImage:",_63);
objj_msgSend(_62,"setAlternateImage:",_64);
objj_msgSend(_62,"setTarget:",undoManager);
objj_msgSend(_62,"setAction:",sel_getUid("redo"));
objj_msgSend(_62,"setLabel:","Redo");
objj_msgSend(_62,"setTag:","Redo");
objj_msgSend(_62,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setMaxSize:",CGSizeMake(32,32));
objj_msgSend(_62,"setVisibilityPriority:",CPToolbarItemVisibilityPriorityLow);
break;
}
return _62;
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_66,_67,_68){
with(_66){
return YES;
}
}),new objj_method(sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"),function(_69,_6a,_6b,_6c,_6d){
with(_69){
return 140;
}
}),new objj_method(sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"),function(_6e,_6f,_70,_71,_72){
with(_6e){
return 400;
}
}),new objj_method(sel_getUid("undoManagerStackDidChange:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_73,"serialize");
window.setTimeout(function(){
objj_msgSend(mainToolbar,"validateVisibleItems");
},0);
}
}),new objj_method(sel_getUid("serialize"),function(_76,_77){
with(_76){
var _78=JSON.stringify(allLocations),_79=objj_msgSend(objj_msgSend(RLOfflineLocalStorage,"alloc"),"init");
if(objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")){
objj_msgSend(_79,"setValue:forKey:",_78,"InventoryData");
}else{
alert("You're using a bad browser. Get one that supports local storage.");
return;
}
}
}),new objj_method(sel_getUid("load"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(objj_msgSend(RLOfflineLocalStorage,"alloc"),"init");
if(objj_msgSend(RLOfflineLocalStorage,"offlineDataStoreIsAvailable")){
var _7d=objj_msgSend(_7c,"getValueForKey:","InventoryData");
}else{
alert("You're using a bad browser. Get one that supports local storage.");
return;
}
if(!_7d||_7d==="null"){
return;
}
_7d=JSON.parse(_7d);
allLocations=[];
for(var i=0;i<_7d.length;i++){
var _7e=objj_msgSend(Location,"decodeJSON:",_7d[i]);
objj_msgSend(allLocations,"addObject:",_7e);
}
objj_msgSend(objj_msgSend(sourceViewController,"sourceList"),"reloadData");
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_7f,_80,_81){
with(_7f){
if(objj_msgSend(_7f,"hasThemeState:",CPThemeStateBordered)){
return;
}
var _82=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_82);
CGContextTranslateCTM(_82,FLOOR(CGRectGetWidth(_81)-19),12);
CGContextRotateCTM(_82,PI);
CGContextMoveToPoint(_82,0,0);
CGContextAddLineToPoint(_82,5,0);
CGContextAddLineToPoint(_82,2.5,5);
CGContextAddLineToPoint(_82,0,0);
CGContextClosePath(_82);
var _83=objj_msgSend(CPColor,"grayColor");
CGContextSetFillColor(_82,_83);
CGContextFillPath(_82);
CGContextTranslateCTM(_82,5,-2.5);
CGContextRotateCTM(_82,PI);
CGContextMoveToPoint(_82,0,0);
CGContextAddLineToPoint(_82,5,0);
CGContextAddLineToPoint(_82,2.5,5);
CGContextAddLineToPoint(_82,0,0);
CGContextClosePath(_82);
var _83=objj_msgSend(CPColor,"grayColor");
CGContextSetFillColor(_82,_83);
CGContextFillPath(_82);
}
})]);
var _1=objj_getClass("CPMenu");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("removeAllItems"),function(_84,_85){
with(_84){
return;
for(var i=0;i<objj_msgSend(_84,"numberOfItems");i++){
objj_msgSend(_84,"removeItemAtIndex:",i);
}
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addItems:"),function(_86,_87,_88){
with(_86){
for(var i=0;i<_88.length;i++){
objj_msgSend(_86,"addItem:",_88[i]);
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"LocationItemTypes"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("menuItems"),function(_89,_8a){
with(_89){
var _8b=[],_8c=objj_msgSend(CPBundle,"mainBundle"),_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Building",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Building"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Computer",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Computer"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Safe",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Safe"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Car",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Car"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Bank",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Bank"));
objj_msgSend(_8b,"addObject:",_8d);
_8d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Yard",nil,nil);
objj_msgSend(_8d,"setImage:",objj_msgSend(objj_msgSend(_89,"class"),"imageForItemWithTitle:","Yard"));
objj_msgSend(_8b,"addObject:",_8d);
return _8b;
}
}),new objj_method(sel_getUid("imageForItemWithTitle:"),function(_8e,_8f,_90){
with(_8e){
var _91=objj_msgSend(CPBundle,"mainBundle");
switch(_90){
case "Building":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","building.png"),CGSizeMake(16,16));
break;
case "Computer":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","computer.png"),CGSizeMake(16,16));
break;
case "Safe":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","safe.png"),CGSizeMake(16,16));
break;
case "Car":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","car.png"),CGSizeMake(16,16));
break;
case "Bank":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","bank.png"),CGSizeMake(16,16));
break;
case "Yard":
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","yard.png"),CGSizeMake(16,16));
break;
default:
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_91,"pathForResource:","SignPost.png"),CGSizeMake(20,20));
break;
}
}
})]);
var _1=objj_allocateClassPair(CPUndoManager,"RLUndoManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_92,_93){
with(_92){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_94,_95,_96){
with(_94){
delegate=_96;
}
}),new objj_method(sel_getUid("init"),function(_97,_98){
with(_97){
_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("RLUndoManager").super_class},"init");
if(_97){
delegate=nil;
}
return _97;
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_99,_9a,_9b,_9c,_9d){
with(_99){
objj_msgSendSuper({receiver:_99,super_class:objj_getClass("RLUndoManager").super_class},"registerUndoWithTarget:selector:object:",_9b,_9c,_9d);
if(objj_msgSend(delegate,"respondsToSelector:",sel_getUid("undoManagerStackDidChange:"))){
objj_msgSend(delegate,"undoManagerStackDidChange:",_99);
}
}
}),new objj_method(sel_getUid("validateToolbarItem:"),function(_9e,_9f,_a0){
with(_9e){
var _a1=objj_msgSend(_a0,"itemIdentifier");
if(_a1==="undo"){
return objj_msgSend(_9e,"canUndo");
}else{
if(_a1==="redo"){
return objj_msgSend(_9e,"canRedo");
}
}
}
})]);

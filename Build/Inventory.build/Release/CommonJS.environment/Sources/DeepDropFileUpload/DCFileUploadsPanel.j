@STATIC;1.0;I;16;AppKit/CPPanel.ji;21;DCFileUploadManager.ji;22;DCFileUploadsRowView.jt;3315;
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("DCFileUploadManager.j",YES);
objj_executeFile("DCFileUploadsRowView.j",YES);
var _1=objj_allocateClassPair(CPPanel,"DCFileUploadsPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("list"),new objj_ivar("tableView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"initWithContentRect:styleMask:",_5,CPHUDBackgroundWindowMask|CPClosableWindowMask|CPResizableWindowMask);
if(_3){
list=objj_msgSend(objj_msgSend(DCFileUploadManager,"sharedManager"),"fileUploads");
objj_msgSend(_3,"setTitle:","Uploads");
objj_msgSend(_3,"setFloatingPanel:",YES);
var _6=objj_msgSend(_3,"contentView");
var _7=objj_msgSend(_6,"bounds");
_7.size.height-=20;
tableView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",_7);
objj_msgSend(tableView,"setDataSource:",_3);
objj_msgSend(tableView,"setDelegate:",_3);
var _8=objj_msgSend(objj_msgSend(DCFileUploadsRowView,"alloc"),"initWithFrame:",CGRectMake(0,0,100,100));
var _9=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","uploads");
objj_msgSend(objj_msgSend(_9,"headerView"),"setStringValue:","Uploads");
objj_msgSend(_9,"setWidth:",220);
objj_msgSend(_9,"setMinWidth:",50);
objj_msgSend(_9,"setEditable:",NO);
objj_msgSend(_9,"setDataView:",_8);
objj_msgSend(tableView,"addTableColumn:",_9);
objj_msgSend(tableView,"setColumnAutoresizingStyle:",CPTableViewLastColumnOnlyAutoresizingStyle);
objj_msgSend(tableView,"setRowHeight:",46);
objj_msgSend(tableView,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleNone);
objj_msgSend(objj_msgSend(tableView,"headerView"),"setFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(tableView,"headerView"),"frame").size.width,0));
objj_msgSend(objj_msgSend(tableView,"cornerView"),"setFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(tableView,"cornerView"),"frame").size.width,0));
var _a=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_7);
objj_msgSend(_a,"setDocumentView:",tableView);
objj_msgSend(_a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a,"setAutohidesScrollers:",YES);
objj_msgSend(_6,"addSubview:",_a);
objj_msgSend(objj_msgSend(_a,"verticalScroller"),"setTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD"));
objj_msgSend(objj_msgSend(_a,"horizontalScroller"),"setTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD"));
objj_msgSend(tableView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_a,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
}
return _3;
}
}),new objj_method(sel_getUid("fileUploadManagerDidChange:"),function(_b,_c,_d){
with(_b){
objj_msgSend(tableView,"reloadData");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(tableView,"selectedRow");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_12,_13,_14,_15,_16){
with(_12){
return objj_msgSend(list,"objectAtIndex:",_16);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(list,"count");
}
})]);

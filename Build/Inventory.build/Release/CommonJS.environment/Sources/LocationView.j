@STATIC;1.0;t;28345;
var _1=objj_allocateClassPair(CPView,"LocationView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("viewController"),new objj_ivar("shadowView"),new objj_ivar("contain"),new objj_ivar("locationTitle"),new objj_ivar("viewSwitcher"),new objj_ivar("itemScrollView"),new objj_ivar("itemTableView"),new objj_ivar("itemViewScrollView"),new objj_ivar("itemView"),new objj_ivar("noItemsView"),new objj_ivar("topView"),new objj_ivar("gradientOverlay"),new objj_ivar("editButton"),new objj_ivar("uploadButton"),new objj_ivar("deleteButton"),new objj_ivar("backToItemsButton"),new objj_ivar("collectionViewScrollView"),new objj_ivar("collectionView"),new objj_ivar("animation")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("viewController"),function(_3,_4){
with(_3){
return viewController;
}
}),new objj_method(sel_getUid("setViewController:"),function(_5,_6,_7){
with(_5){
viewController=_7;
}
}),new objj_method(sel_getUid("shadowView"),function(_8,_9){
with(_8){
return shadowView;
}
}),new objj_method(sel_getUid("setShadowView:"),function(_a,_b,_c){
with(_a){
shadowView=_c;
}
}),new objj_method(sel_getUid("itemTableView"),function(_d,_e){
with(_d){
return itemTableView;
}
}),new objj_method(sel_getUid("setItemTableView:"),function(_f,_10,_11){
with(_f){
itemTableView=_11;
}
}),new objj_method(sel_getUid("itemView"),function(_12,_13){
with(_12){
return itemView;
}
}),new objj_method(sel_getUid("setItemView:"),function(_14,_15,_16){
with(_14){
itemView=_16;
}
}),new objj_method(sel_getUid("editButton"),function(_17,_18){
with(_17){
return editButton;
}
}),new objj_method(sel_getUid("setEditButton:"),function(_19,_1a,_1b){
with(_19){
editButton=_1b;
}
}),new objj_method(sel_getUid("uploadButton"),function(_1c,_1d){
with(_1c){
return uploadButton;
}
}),new objj_method(sel_getUid("setUploadButton:"),function(_1e,_1f,_20){
with(_1e){
uploadButton=_20;
}
}),new objj_method(sel_getUid("deleteButton"),function(_21,_22){
with(_21){
return deleteButton;
}
}),new objj_method(sel_getUid("setDeleteButton:"),function(_23,_24,_25){
with(_23){
deleteButton=_25;
}
}),new objj_method(sel_getUid("collectionView"),function(_26,_27){
with(_26){
return collectionView;
}
}),new objj_method(sel_getUid("setCollectionView:"),function(_28,_29,_2a){
with(_28){
collectionView=_2a;
}
}),new objj_method(sel_getUid("initWithFrame:andController:"),function(_2b,_2c,_2d,_2e){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("LocationView").super_class},"initWithFrame:",_2d);
if(_2b){
viewController=_2e;
locationTitle=objj_msgSend(CPTextField,"new");
objj_msgSend(locationTitle,"setFrameOrigin:",CGPointMake(50,15));
objj_msgSend(locationTitle,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",32));
objj_msgSend(locationTitle,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(locationTitle,"setValue:forThemeAttribute:",CGSizeMake(1,1),"text-shadow-offset");
objj_msgSend(locationTitle,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0/255,0.9),"text-shadow-color");
objj_msgSend(locationTitle,"setStringValue:","My Location");
objj_msgSend(locationTitle,"sizeToFit");
objj_msgSend(_2b,"addSubview:",locationTitle);
var _2f=objj_msgSend(CPBundle,"mainBundle");
viewSwitcher=objj_msgSend(objj_msgSend(CPSegmentedControl,"alloc"),"initWithFrame:",CGRectMake(_2d.size.width-88,28,0,24));
objj_msgSend(viewSwitcher,"setSegmentCount:",2);
objj_msgSend(viewSwitcher,"setImage:forSegment:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","list-view.png"),CGSizeMake(15,15)),0);
objj_msgSend(viewSwitcher,"setImage:forSegment:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","grid-view.png"),CGSizeMake(15,15)),1);
objj_msgSend(viewSwitcher,"setWidth:forSegment:",37,0);
objj_msgSend(viewSwitcher,"setWidth:forSegment:",37,1);
objj_msgSend(viewSwitcher,"setSelectedSegment:",0);
objj_msgSend(viewSwitcher,"setTarget:",_2b);
objj_msgSend(viewSwitcher,"setAction:",sel_getUid("switchViews:"));
objj_msgSend(_2b,"addSubview:",viewSwitcher);
shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(shadowView,"setWeight:",CPHeavyShadow);
objj_msgSend(shadowView,"setFrameForContentFrame:",CGRectMake(50,70,790,525));
objj_msgSend(_2b,"addSubview:",shadowView);
contain=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(50,70,790,525));
objj_msgSend(_2b,"addSubview:",contain);
topArea=objj_msgSend(objj_msgSend(TopView,"alloc"),"initWithFrame:",CGRectMake(225,0,565,44));
objj_msgSend(topArea,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f4f4f4"));
objj_msgSend(contain,"addSubview:",topArea);
itemScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,225,525));
objj_msgSend(itemScrollView,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxYMargin);
objj_msgSend(itemScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(itemScrollView,"setVerticalScroller:",objj_msgSend(LocationController,"customVerticalScroller"));
objj_msgSend(itemScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
itemTableView=objj_msgSend(objj_msgSend(ItemViewTableView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(itemTableView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","f8f8f8"));
objj_msgSend(itemTableView,"setGridColor:",objj_msgSend(CPColor,"colorWithHexString:","f0f0f0"));
objj_msgSend(itemTableView,"setGridStyleMask:",CPTableViewSolidHorizontalGridLineMask);
objj_msgSend(itemTableView,"setDelegate:",viewController);
objj_msgSend(itemTableView,"setDataSource:",viewController);
objj_msgSend(itemTableView,"setSelectionHighlightColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
objj_msgSend(itemTableView,"setRowHeight:",50);
objj_msgSend(itemTableView,"registerForDraggedTypes:",["ItemDragType"]);
var _30=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","Items");
objj_msgSend(objj_msgSend(_30,"headerView"),"setStringValue:","Items");
objj_msgSend(_30,"setWidth:",210);
objj_msgSend(_30,"setMinWidth:",210);
objj_msgSend(_30,"setDataView:",objj_msgSend(objj_msgSend(ItemDataView,"alloc"),"initWithFrame:",CGRectMake(0,0,210,50)));
objj_msgSend(itemTableView,"addTableColumn:",_30);
objj_msgSend(itemScrollView,"setDocumentView:",itemTableView);
objj_msgSend(contain,"addSubview:",itemScrollView);
gradientOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(225,44,550,10));
objj_msgSend(gradientOverlay,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2f,"pathForResource:","itemScrollShadow.png"),CGSizeMake(10,10))));
itemView=objj_msgSend(objj_msgSend(ItemView,"alloc"),"initWithFrame:",CGRectMake(225,44,565,481));
objj_msgSend(itemView,"setLocationController:",_2e);
objj_msgSend(contain,"addSubview:",itemView);
objj_msgSend(contain,"addSubview:",gradientOverlay);
editButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(520,9,30,24));
var _31=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","editbutton.png"),CGSizeMake(18,18));
objj_msgSend(editButton,"setImage:",_31);
objj_msgSend(editButton,"setTarget:",itemView);
objj_msgSend(editButton,"setAction:",sel_getUid("toggleEditMode:"));
objj_msgSend(editButton,"setImagePosition:",CPImageOnly);
objj_msgSend(editButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(editButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",editButton);
uploadButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(480,9,30,24));
objj_msgSend(uploadButton,"setTitle:","⇧");
objj_msgSend(uploadButton,"setTarget:",itemView);
objj_msgSend(uploadButton,"setAction:",sel_getUid("uploadAttachment:"));
objj_msgSend(uploadButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(uploadButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",uploadButton);
deleteButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(440,9,30,24));
var _31=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","deletebutton.png"),CGSizeMake(14,18));
objj_msgSend(deleteButton,"setImage:",_31);
objj_msgSend(deleteButton,"setTarget:",_2b);
objj_msgSend(deleteButton,"setAction:",sel_getUid("deleteItemPushed:"));
objj_msgSend(deleteButton,"setImagePosition:",CPImageOnly);
objj_msgSend(deleteButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(deleteButton,"setHidden:",YES);
objj_msgSend(topArea,"addSubview:",deleteButton);
objj_msgSend(_2b,"showNoItemsView");
}
return _2b;
}
}),new objj_method(sel_getUid("setLocationTitle:"),function(_32,_33,_34){
with(_32){
objj_msgSend(locationTitle,"setStringValue:",_34);
objj_msgSend(locationTitle,"sizeToFit");
}
}),new objj_method(sel_getUid("setActiveItem:"),function(_35,_36,_37){
with(_35){
objj_msgSend(objj_msgSend(viewController,"itemController"),"setItem:",_37);
if(!_37){
objj_msgSend(itemTableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
}
}
}),new objj_method(sel_getUid("showNoItemsView"),function(_38,_39){
with(_38){
if(!noItemsView){
noItemsView=objj_msgSend(CPTextField,"new");
objj_msgSend(noItemsView,"setStringValue:","No Items");
objj_msgSend(noItemsView,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(noItemsView,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","666666"));
objj_msgSend(noItemsView,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(noItemsView,"setTextShadowOffset:",CGSizeMake(0,2));
objj_msgSend(noItemsView,"sizeToFit");
var _3a=objj_msgSend(_38,"convertRect:fromView:",objj_msgSend(itemTableView,"rectOfRow:",4),itemTableView);
objj_msgSend(noItemsView,"setCenter:",CGPointMake(CGRectGetMidX(_3a),CGRectGetMidY(_3a)));
}
objj_msgSend(_38,"addSubview:",noItemsView);
}
}),new objj_method(sel_getUid("hideNoItemsView"),function(_3b,_3c){
with(_3b){
objj_msgSend(noItemsView,"removeFromSuperview");
}
}),new objj_method(sel_getUid("deleteItemPushed:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(objj_msgSend(viewController,"location"),"itemAtIndex:",objj_msgSend(objj_msgSend(itemTableView,"selectedRowIndexes"),"firstIndex"));
objj_msgSend(viewController,"confirmRemovalOfItem:",_40);
}
}),new objj_method(sel_getUid("switchViews:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(_43,"selectedSegment");
if(_44===0){
objj_msgSend(collectionViewScrollView,"removeFromSuperview");
objj_msgSend(contain,"addSubview:",itemScrollView);
objj_msgSend(topArea,"setFrame:",CGRectMake(225,0,565,44));
objj_msgSend(itemViewScrollView,"setFrameOrigin:",CGPointMake(225,44));
objj_msgSend(backToItemsButton,"removeFromSuperview");
objj_msgSend(itemView,"setWidth:",565);
objj_msgSend(gradientOverlay,"setFrame:",CGRectMake(225,44,550,10));
objj_msgSend(contain,"addSubview:",gradientOverlay);
}else{
objj_msgSend(itemScrollView,"removeFromSuperview");
objj_msgSend(topArea,"setFrame:",CGRectMake(790,0,790,44));
var _45=objj_msgSend(itemView,"frame");
objj_msgSend(itemView,"setFrame:",CGRectMake(790,_45.origin.y,790,481));
objj_msgSend(itemView,"setWidth:",775);
if(!backToItemsButton){
backToItemsButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(15,9,70,24));
objj_msgSend(backToItemsButton,"setTitle:","Back");
objj_msgSend(backToItemsButton,"setAction:",sel_getUid("animateToCollectionView:"));
objj_msgSend(backToItemsButton,"setTarget:",_41);
}
objj_msgSend(topArea,"addSubview:",backToItemsButton);
if(!collectionViewScrollView){
collectionViewScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,790,525));
objj_msgSend(collectionViewScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(collectionViewScrollView,"setAutohidesScrollers:",YES);
var _46=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_46,"setView:",objj_msgSend(objj_msgSend(ItemCell,"alloc"),"initWithFrame:",CGRectMakeZero()));
collectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,775,510));
objj_msgSend(collectionView,"setMinItemSize:",CGSizeMake(131,155));
objj_msgSend(collectionView,"setMaxItemSize:",CGSizeMake(131,155));
objj_msgSend(collectionView,"setVerticalMargin:",3);
objj_msgSend(collectionView,"setDelegate:",_41);
objj_msgSend(collectionView,"setItemPrototype:",_46);
objj_msgSend(collectionViewScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","EEEEEE"));
objj_msgSend(collectionView,"setAllowsMultipleSelection:",YES);
objj_msgSend(collectionViewScrollView,"setDocumentView:",collectionView);
objj_msgSend(collectionView,"setContent:",objj_msgSend(objj_msgSend(viewController,"location"),"items"));
}
objj_msgSend(itemView,"enterEditMode:",NO);
objj_msgSend(collectionViewScrollView,"setFrameOrigin:",CGPointMake(0,0));
objj_msgSend(contain,"addSubview:",collectionViewScrollView);
objj_msgSend(gradientOverlay,"setFrame:",CGRectMake(0,44,775,10));
objj_msgSend(gradientOverlay,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_47,_48,_49,_4a){
with(_47){
if(objj_msgSend(animation,"isAnimating")){
return;
}
objj_msgSend(itemTableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_4a),NO);
var _4b=objj_msgSend(collectionViewScrollView,"frame"),_4c=objj_msgSend(itemView,"frame"),_4d=objj_msgSend(topArea,"frame"),_4e=CGRectMake(_4b.origin.x-_4b.size.width,_4b.origin.y,_4b.size.width,_4b.size.height),_4f=CGRectMake(_4b.origin.x,_4c.origin.y,_4c.size.width,_4c.size.height),_50=CGRectMake(_4b.origin.x,_4d.origin.y,_4d.size.width,_4d.size.height);
var _51=objj_msgSend(CPDictionary,"new");
objj_msgSend(_51,"setValue:forKey:",collectionViewScrollView,CPViewAnimationTargetKey);
objj_msgSend(_51,"setValue:forKey:",_4b,CPViewAnimationStartFrameKey);
objj_msgSend(_51,"setValue:forKey:",_4e,CPViewAnimationEndFrameKey);
objj_msgSend(_51,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _52=objj_msgSend(CPDictionary,"new");
objj_msgSend(_52,"setValue:forKey:",itemView,CPViewAnimationTargetKey);
objj_msgSend(_52,"setValue:forKey:",_4c,CPViewAnimationStartFrameKey);
objj_msgSend(_52,"setValue:forKey:",_4f,CPViewAnimationEndFrameKey);
objj_msgSend(_52,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _53=objj_msgSend(CPDictionary,"new");
objj_msgSend(_53,"setValue:forKey:",topArea,CPViewAnimationTargetKey);
objj_msgSend(_53,"setValue:forKey:",_4d,CPViewAnimationStartFrameKey);
objj_msgSend(_53,"setValue:forKey:",_50,CPViewAnimationEndFrameKey);
objj_msgSend(_53,"setValue:forKey:",nil,CPViewAnimationEffectKey);
animation=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_51,_52,_53]);
objj_msgSend(animation,"setDuration:",0.3);
objj_msgSend(animation,"setDelegate:",_47);
objj_msgSend(animation,"startAnimation");
window.setTimeout(function(){
},1);
}
}),new objj_method(sel_getUid("animateToCollectionView:"),function(_54,_55,_56){
with(_54){
if(objj_msgSend(animation,"isAnimating")){
return;
}
var _57=objj_msgSend(collectionViewScrollView,"frame"),_58=objj_msgSend(itemView,"frame"),_59=objj_msgSend(topArea,"frame"),_5a=CGRectMake(_57.origin.x+_57.size.width,_57.origin.y,_57.size.width,_57.size.height),_5b=CGRectMake(840,_58.origin.y,790,481),_5c=CGRectMake(840,_59.origin.y,790,44);
var _5d=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5d,"setValue:forKey:",collectionViewScrollView,CPViewAnimationTargetKey);
objj_msgSend(_5d,"setValue:forKey:",_57,CPViewAnimationStartFrameKey);
objj_msgSend(_5d,"setValue:forKey:",_5a,CPViewAnimationEndFrameKey);
objj_msgSend(_5d,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _5e=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5e,"setValue:forKey:",itemView,CPViewAnimationTargetKey);
objj_msgSend(_5e,"setValue:forKey:",_58,CPViewAnimationStartFrameKey);
objj_msgSend(_5e,"setValue:forKey:",_5b,CPViewAnimationEndFrameKey);
objj_msgSend(_5e,"setValue:forKey:",nil,CPViewAnimationEffectKey);
var _5f=objj_msgSend(CPDictionary,"new");
objj_msgSend(_5f,"setValue:forKey:",topArea,CPViewAnimationTargetKey);
objj_msgSend(_5f,"setValue:forKey:",_59,CPViewAnimationStartFrameKey);
objj_msgSend(_5f,"setValue:forKey:",_5c,CPViewAnimationEndFrameKey);
objj_msgSend(_5f,"setValue:forKey:",nil,CPViewAnimationEffectKey);
animation=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_5d,_5e,_5f]);
objj_msgSend(animation,"setDuration:",0.3);
objj_msgSend(animation,"setDelegate:",_54);
objj_msgSend(animation,"startAnimation");
objj_msgSend(gradientOverlay,"removeFromSuperview");
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_60,_61,_62,_63){
with(_60){
return ["ItemDragType"];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_64,_65,_66,_67,_68){
with(_64){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_67);
}
}),new objj_method(sel_getUid("collectionView:shouldDeleteItemsAtIndexes:"),function(_69,_6a,_6b,_6c){
with(_69){
return NO;
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemDataView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("itemName"),new objj_ivar("itemMaker"),new objj_ivar("attachments")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_6d,_6e,_6f){
with(_6d){
_6d=objj_msgSendSuper({receiver:_6d,super_class:objj_getClass("ItemDataView").super_class},"initWithFrame:",_6f);
if(_6d){
itemName=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(8,3,_6f.size.width-45,20));
objj_msgSend(itemName,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","4c4c4c"));
objj_msgSend(itemName,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(itemName,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(itemName,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",16));
objj_msgSend(_6d,"addSubview:",itemName);
itemMaker=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(8,22,_6f.size.width-45,20));
objj_msgSend(itemMaker,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","555555"));
objj_msgSend(itemMaker,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_6d,"addSubview:",itemMaker);
attachments=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_6f.size.width-25,5,22,23));
objj_msgSend(attachments,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Attachments/Attachment.png"),CGSizeMake(22,23)));
objj_msgSend(_6d,"addSubview:",attachments);
}
return _6d;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_70,_71,_72){
with(_70){
objj_msgSend(itemName,"setStringValue:",objj_msgSend(_72,"valueForKey:","name"));
objj_msgSend(itemMaker,"setStringValue:",objj_msgSend(_72,"valueForKey:","maker"));
objj_msgSend(attachments,"setHidden:",!objj_msgSend(_72,"valueForKey:","attachments"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_75,"encodeObject:forKey:",itemName,"ItemName");
objj_msgSend(_75,"encodeObject:forKey:",itemMaker,"ItemMaker");
objj_msgSend(_75,"encodeObject:forKey:",attachments,"Attachments");
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("ItemDataView").super_class},"encodeWithCoder:",_75);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_76,_77,_78){
with(_76){
_76=objj_msgSendSuper({receiver:_76,super_class:objj_getClass("ItemDataView").super_class},"initWithCoder:",_78);
if(_76){
itemName=objj_msgSend(_78,"decodeObjectForKey:","ItemName");
itemMaker=objj_msgSend(_78,"decodeObjectForKey:","ItemMaker");
attachments=objj_msgSend(_78,"decodeObjectForKey:","Attachments");
}
return _76;
}
})]);
var _1=objj_allocateClassPair(CPTableView,"ItemViewTableView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("menuForEvent:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""),_7d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Remove Item",sel_getUid("removeItem:"),nil),_7e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Add Item",sel_getUid("addNewItem:"),nil),_7f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","View Item",sel_getUid("newSelectRow:"),nil),_80=objj_msgSend(_79,"convertPoint:fromView:",objj_msgSend(_7b,"locationInWindow"),nil),row=objj_msgSend(_79,"rowAtPoint:",_80);
objj_msgSend(_7d,"setTarget:",_79);
objj_msgSend(_7e,"setTarget:",objj_msgSend(_79,"delegate"));
objj_msgSend(_7f,"setTarget:",_79);
objj_msgSend(_7d,"setRepresentedObject:",row);
objj_msgSend(_7f,"setRepresentedObject:",row);
if(row<0){
objj_msgSend(_7d,"setEnabled:",NO);
objj_msgSend(_7f,"setEnabled:",NO);
}
objj_msgSend(_7c,"addItem:",_7d);
objj_msgSend(_7c,"addItem:",_7f);
objj_msgSend(_7c,"addItem:",_7e);
return _7c;
}
}),new objj_method(sel_getUid("newSelectRow:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_81,"_noteSelectionIsChanging");
var _84=objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_83,"representedObject"));
objj_msgSend(_81,"selectRowIndexes:byExtendingSelection:",_84,NO);
objj_msgSend(_81,"_noteSelectionDidChange");
}
}),new objj_method(sel_getUid("removeItem:"),function(_85,_86,_87){
with(_85){
var _88=objj_msgSend(objj_msgSend(objj_msgSend(_85,"delegate"),"location"),"itemAtIndex:",objj_msgSend(_87,"representedObject"));
objj_msgSend(objj_msgSend(_85,"delegate"),"confirmRemovalOfItem:",_88);
}
})]);
var _1=objj_allocateClassPair(CPView,"ItemCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("make"),new objj_ivar("image"),new objj_ivar("borderOverlay"),new objj_ivar("bgColor"),new objj_ivar("selectedBGColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_89,_8a,_8b){
with(_89){
if(!borderOverlay){
var _8c=objj_msgSend(CPBundle,"mainBundle");
bgColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-0.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-1.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-2.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-3.png"),CGSizeMake(5,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-5.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-6.png"),CGSizeMake(5,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-7.png"),CGSizeMake(1,5)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","ItemCellView/ItemView-8.png"),CGSizeMake(5,5))]));
borderOverlay=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(5,5,121,121));
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
image=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(5,5,121,121));
objj_msgSend(image,"setImageScaling:",CPScaleNone);
objj_msgSend(_89,"addSubview:",image);
objj_msgSend(_89,"addSubview:",borderOverlay);
name=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(5,126,121,24));
objj_msgSend(name,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(name,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(name,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(name,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_89,"addSubview:",name);
make=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(5,140,121,24));
objj_msgSend(make,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(make,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(make,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(make,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_89,"addSubview:",make);
}
objj_msgSend(image,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:","Resources/ItemCellView/iPhone-test-image.png",objj_msgSend(_89,"scaleImageWithSize:",CGSizeMake(578,397))));
objj_msgSend(make,"setStringValue:",objj_msgSend(_8b,"make"));
objj_msgSend(name,"setStringValue:",objj_msgSend(_8b,"name"));
}
}),new objj_method(sel_getUid("setSelected:"),function(_8d,_8e,_8f){
with(_8d){
var _90=objj_msgSend(CPBundle,"mainBundle");
if(!selectedBGColor){
selectedBGColor=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-0.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-1.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-2.png"),CGSizeMake(8,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-3.png"),CGSizeMake(9,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-4.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-5.png"),CGSizeMake(8,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-6.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-7.png"),CGSizeMake(2,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_90,"pathForResource:","ItemCellView/ItemView-selected-8.png"),CGSizeMake(8,9))]));
}
if(_8f){
objj_msgSend(borderOverlay,"setBackgroundColor:",selectedBGColor);
}else{
objj_msgSend(borderOverlay,"setBackgroundColor:",bgColor);
}
}
}),new objj_method(sel_getUid("scaleImageWithSize:"),function(_91,_92,_93){
with(_91){
var _94=121,_95=_93.height,_96=_93.width,_97=MAX(_94/_96,_94/_95);
_96=_97*_96;
_95=_97*_95;
return CGSizeMake(_96,_95);
}
})]);
var _1=objj_allocateClassPair(CPView,"TopView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("drawRect:"),function(_98,_99,_9a){
with(_98){
var _9b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(_9b,objj_msgSend(CPColor,"colorWithHexString:","CCCCCC"));
var _9c=[CGPointMake(15,43.5),CGPointMake(_9a.size.width-30,43.5)];
CGContextStrokeLineSegments(_9b,_9c,2);
}
})]);

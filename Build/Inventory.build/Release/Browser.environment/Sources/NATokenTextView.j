@STATIC;1.0;I;21;Foundation/CPObject.jt;46430;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPView,"NATokenTextView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_labelToHaveWithOfText"),new objj_ivar("_tokenViews"),new objj_ivar("_selectedIndexes"),new objj_ivar("_anchor"),new objj_ivar("_theScrollView"),new objj_ivar("_containerView"),new objj_ivar("_anchorIndex"),new objj_ivar("_maxAnchorIndex"),new objj_ivar("_minHeight"),new objj_ivar("_maxHeight"),new objj_ivar("_delegate"),new objj_ivar("_DOMInputElement"),new objj_ivar("_tokenOrigin"),new objj_ivar("_selectionBackground1"),new objj_ivar("_selectionBackground2"),new objj_ivar("_selectionBackground3"),new objj_ivar("editable"),new objj_ivar("bezeled")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("editable"),function(_3,_4){
with(_3){
return editable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_5,_6,_7){
with(_5){
editable=_7;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_8,_9,_a){
with(_8){
bezeled=_a;
objj_msgSend(_8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("NATokenTextView").super_class},"initWithFrame:",_d);
if(_b){
editable=YES;
bezeled=YES;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tokenViews=[];
_tokenOrigin=nil;
_maxHeight=1000;
_theScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_d.size.width,_d.size.height));
objj_msgSend(_theScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(_theScrollView,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(_b,"addSubview:",_theScrollView);
_containerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,1,15));
objj_msgSend(_theScrollView,"setDocumentView:",_containerView);
_containerView._DOMElement.style.cursor="text";
_DOMInputElement=document.createElement("input");
_DOMInputElement.style.position="absolute";
_DOMInputElement.style.zIndex="-1000";
_DOMInputElement.style.opacity="0";
_DOMInputElement.style.filter="alpha(opacity=0)";
_DOMInputElement.onfocus=function(){
objj_msgSend(_b,"becomeFirstResponder");
};
_DOMInputElement.onblur=function(){
objj_msgSend(_b,"resignFirstResponder");
};
_containerView._DOMElement.appendChild(_DOMInputElement);
_minHeight=_d.size.height;
objj_msgSend(_b,"setThemeState:",CPThemeStateBezeled);
_labelToHaveWithOfText=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_labelToHaveWithOfText,"setHidden:",YES);
objj_msgSend(_labelToHaveWithOfText,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_labelToHaveWithOfText,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_containerView,"addSubview:",_labelToHaveWithOfText);
_selectionBackground1=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground1,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground1);
_selectionBackground2=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground2,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground2);
_selectionBackground3=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","d3eafa"));
objj_msgSend(_containerView,"addSubview:",_selectionBackground3);
_anchorIndex=0;
_maxAnchorIndex=0;
_anchor=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,1,15));
objj_msgSend(_anchor,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_containerView,"addSubview:",_anchor);
}
return _b;
}
}),new objj_method(sel_getUid("_createTokenTextField"),function(_e,_f){
with(_e){
var _10=objj_msgSend(objj_msgSend(NATokenTextField,"alloc"),"init");
objj_msgSend(_containerView,"addSubview:",_10);
return _10;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"isEqualToIndexSet:",_selectionIndexes)){
return;
}
var _14={from:objj_msgSend(_13,"firstIndex"),to:objj_msgSend(_13,"lastIndex")};
var i,_15,_16=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_15=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_15,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
if(_16>=_14.from&&_16<=_14.to){
objj_msgSend(_15,"setSelected:",YES);
}else{
objj_msgSend(_15,"setSelected:",NO);
}
}
if(objj_msgSend(_15,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_16+=objj_msgSend(objj_msgSend(_15,"stringValue"),"length");
}else{
_16+=1;
}
}
_selectionIndexes=_13;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeSelection:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeSelection:",_11);
}
objj_msgSend(_11,"setNeedsLayout");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_17,_18){
with(_17){
return editable;
}
}),new objj_method(sel_getUid("_updateAutoCompletion"),function(_19,_1a){
with(_19){
if(objj_msgSend(_19,"_currentTokenTextField")==nil){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCurrentTokenDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewCurrentTokenDidChange:",_19);
}
}
}),new objj_method(sel_getUid("_charDown:"),function(_1b,_1c,_1d){
with(_1b){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_1b,"_removeTokens:",_selectionIndexes);
}
var pos=objj_msgSend(_1b,"_indexForAnchorIndex:",_anchorIndex);
objj_msgSend(objj_msgSend(_1b,"_currentTokenTextField"),"addStringToStringValue:atIndex:",_1d,pos.offset);
_anchorIndex+=objj_msgSend(_1d,"length");
objj_msgSend(_1b,"_processMaxAnchorIndex");
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"_updateAutoCompletion");
}
}),new objj_method(sel_getUid("keyUp:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"keyCode")==86&&(objj_msgSend(_20,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_20,"modifierFlags")&CPControlKeyMask)){
return;
}
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("NATokenTextView").super_class},"keyUp:",_20);
}
}),new objj_method(sel_getUid("keyDown:"),function(_21,_22,_23){
with(_21){
if(objj_msgSend(_23,"keyCode")==67&&(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)){
objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"setString:forType:",objj_msgSend(_21,"_stringForTokens:",_selectionIndexes),CPStringPboardType);
}else{
if(objj_msgSend(_23,"keyCode")==86&&(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)){
var _24=objj_msgSend(objj_msgSend(CPPasteboard,"generalPasteboard"),"stringForType:",CPStringPboardType);
window.setTimeout(function(){
_DOMInputElement.value="";
},0);
if(_24!=nil){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
var _24=objj_msgSend(_24,"componentsSeparatedByString:",",");
var i;
for(i=0;i<objj_msgSend(_24,"count");++i){
objj_msgSend(_21,"addToken:",objj_msgSend(_24,"objectAtIndex:",i));
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_21);
}
}
}else{
if(objj_msgSend(_23,"keyCode")==8){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
}else{
var pos=objj_msgSend(_21,"_indexForAnchorIndex:",_anchorIndex);
if(pos.offset==0){
if(pos.index-1>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex-1));
}
}else{
var _25=objj_msgSend(_21,"_currentTokenTextField");
objj_msgSend(_25,"removeCharAtIndex:",pos.offset);
if(objj_msgSend(objj_msgSend(_25,"stringValue"),"length")==0){
objj_msgSend(_tokenViews,"removeObject:",_25);
objj_msgSend(_25,"removeFromSuperview");
_25=nil;
}
_anchorIndex-=1;
objj_msgSend(_21,"_processMaxAnchorIndex");
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"_updateAutoCompletion");
}
}
}else{
if(objj_msgSend(_23,"keyCode")==46){
if(objj_msgSend(_selectionIndexes,"count")>0){
objj_msgSend(_21,"_removeTokens:",_selectionIndexes);
}else{
var pos=objj_msgSend(_21,"_indexForAnchorIndex:",_anchorIndex);
var _25=objj_msgSend(_21,"_currentTokenTextField");
if(pos.offset==objj_msgSend(objj_msgSend(_25,"stringValue"),"length")){
if(_anchorIndex<=_maxAnchorIndex){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}else{
objj_msgSend(_25,"removeCharAtIndex:",pos.offset+1);
objj_msgSend(_21,"_processMaxAnchorIndex");
}
if(objj_msgSend(objj_msgSend(_25,"stringValue"),"length")==0){
objj_msgSend(_tokenViews,"removeObject:",_25);
objj_msgSend(_25,"removeFromSuperview");
_25=nil;
}
objj_msgSend(_21,"setNeedsLayout");
}
}else{
if(objj_msgSend(objj_msgSend(_23,"characters"),"compare:",",")==CPOrderedSame||objj_msgSend(_23,"keyCode")==13){
if(objj_msgSend(_23,"keyCode")==13&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCompletionForToken:"))){
var _26=objj_msgSend(_delegate,"tokenTextViewCompletionForToken:",_21);
if(_26==nil){
objj_msgSend(_21,"_addCurrentToken:",nil);
}else{
objj_msgSend(_21,"_addCurrentToken:",_26);
}
}else{
objj_msgSend(_21,"_addCurrentToken:",nil);
}
objj_msgSend(_21,"_updateAutoCompletion");
}else{
if(objj_msgSend(_23,"keyCode")==CPRightArrowKeyCode){
if(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask){
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_maxAnchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_anchorIndex,_maxAnchorIndex-_anchorIndex)));
}
}
_anchorIndex=_maxAnchorIndex;
objj_msgSend(_21,"setNeedsLayout");
}else{
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_anchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
if(_anchorIndex>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}
if(_anchorIndex<_maxAnchorIndex){
_anchorIndex+=1;
}
}else{
if(objj_msgSend(_selectionIndexes,"count")<=0){
if(_anchorIndex<_maxAnchorIndex){
_anchorIndex+=1;
}
}else{
_anchorIndex=objj_msgSend(_selectionIndexes,"lastIndex")+1;
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
objj_msgSend(_21,"setNeedsLayout");
}
}
}else{
if(objj_msgSend(_23,"keyCode")==CPLeftArrowKeyCode){
if(objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask){
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",0);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_anchorIndex)));
}
}
_anchorIndex=0;
objj_msgSend(_21,"setNeedsLayout");
}else{
if(objj_msgSend(_23,"modifierFlags")&CPShiftKeyMask){
if(_anchorIndex>0){
_anchorIndex-=1;
}
if(objj_msgSend(_selectionIndexes,"count")>0){
var _27=objj_msgSend(_selectionIndexes,"copy");
objj_msgSend(_27,"addIndex:",_anchorIndex);
objj_msgSend(_21,"setSelectionIndexes:",_27);
}else{
if(_anchorIndex>=0){
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_anchorIndex));
}
}
}else{
if(objj_msgSend(_selectionIndexes,"count")<=0){
if(_anchorIndex>0){
_anchorIndex-=1;
}
}else{
_anchorIndex=objj_msgSend(_selectionIndexes,"firstIndex");
objj_msgSend(_21,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
objj_msgSend(_21,"setNeedsLayout");
}
}
}else{
if((objj_msgSend(_23,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_23,"modifierFlags")&CPControlKeyMask)&&objj_msgSend(_23,"keyCode")==65){
objj_msgSend(_21,"selectAll");
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextView:keyDown:"))){
objj_msgSend(_delegate,"tokenTextView:keyDown:",_21,_23);
}
objj_msgSend(objj_msgSend(objj_msgSend(_21,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
window.setTimeout(function(){
if(_DOMInputElement.value!=""){
objj_msgSend(_21,"_charDown:",_DOMInputElement.value);
}
_DOMInputElement.value="";
},0);
}
}
}
}
}
}
}
}
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("NATokenTextView").super_class},"keyDown:",_23);
}
}),new objj_method(sel_getUid("selectAll"),function(_28,_29){
with(_28){
objj_msgSend(_28,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_maxAnchorIndex)));
}
}),new objj_method(sel_getUid("_mergeTokenTextFields"),function(_2a,_2b){
with(_2a){
var i=0,_2c,_2d=nil;
var _2e=[];
while(i<objj_msgSend(_tokenViews,"count")){
_2c=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
if(_2d!=nil){
objj_msgSend(_2d,"setStringValue:",objj_msgSend(_2d,"stringValue")+objj_msgSend(_2c,"stringValue"));
objj_msgSend(_2e,"addObject:",_2c);
}
_2d=_2c;
}else{
_2d=nil;
}
i+=1;
}
for(i=0;i<objj_msgSend(_2e,"count");++i){
var _2c=objj_msgSend(_2e,"objectAtIndex:",i);
objj_msgSend(_tokenViews,"removeObject:",_2c);
objj_msgSend(_2c,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("_stringForTokens:"),function(_2f,_30,_31){
with(_2f){
var _32=CPMakeRange(objj_msgSend(_31,"firstIndex"),objj_msgSend(_31,"lastIndex")-objj_msgSend(_31,"firstIndex")+1);
var i,_33,_34=0,_35=0,_36="";
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_33=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_35=_34;
if(objj_msgSend(_33,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_34+=objj_msgSend(objj_msgSend(_33,"stringValue"),"length");
}else{
_34+=1;
}
var _37=CPMakeRange(_35,_34-_35);
var _38=CPIntersectionRange(_32,_37);
if(_38.length>0){
if(objj_msgSend(_36,"compare:","")!=CPOrderedSame){
_36+=",";
}
if(objj_msgSend(_33,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
_36+=objj_msgSend(_33,"stringValue");
}else{
_36+=objj_msgSend(objj_msgSend(_33,"stringValue"),"substringWithRange:",CPMakeRange(_38.location-_34,_38.length));
}
}
}
return _36;
}
}),new objj_method(sel_getUid("_removeTokens:"),function(_39,_3a,_3b){
with(_39){
if(objj_msgSend(_3b,"count")<=0){
return;
}
var _3c=CPMakeRange(objj_msgSend(_3b,"firstIndex"),objj_msgSend(_3b,"lastIndex")-objj_msgSend(_3b,"firstIndex")+1);
var _3d=[],i,_3e,_3f=0,_40=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_3e=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_40=_3f;
if(objj_msgSend(_3e,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_3f+=objj_msgSend(objj_msgSend(_3e,"stringValue"),"length");
}else{
_3f+=1;
}
var _41=CPMakeRange(_40,_3f-_40);
var _42=CPIntersectionRange(_3c,_41);
if(_42.length>0){
if(objj_msgSend(_3e,"isKindOfClass:",objj_msgSend(NAToken,"class"))){
objj_msgSend(_3d,"addObject:",_3e);
}else{
_42.location-=_40;
objj_msgSend(_3e,"removeFrom:to:",_42.location+1,_42.location+_42.length);
if(objj_msgSend(objj_msgSend(_3e,"stringValue"),"length")==0){
objj_msgSend(_3d,"addObject:",_3e);
}
}
}
}
for(i=0;i<objj_msgSend(_3d,"count");++i){
var _3e=objj_msgSend(_3d,"objectAtIndex:",i);
objj_msgSend(_tokenViews,"removeObject:",_3e);
objj_msgSend(_3e,"removeFromSuperview");
}
_anchorIndex=objj_msgSend(_3b,"firstIndex");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_39);
}
objj_msgSend(_39,"_mergeTokenTextFields");
objj_msgSend(_39,"_processMaxAnchorIndex");
objj_msgSend(_39,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}),new objj_method(sel_getUid("_addCurrentToken:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"_currentTokenTextField");
var _47=objj_msgSend(objj_msgSend(_46,"stringValue"),"trim");
if(objj_msgSend(_47,"length")<=0){
objj_msgSend(_tokenViews,"removeObject:",_46);
objj_msgSend(_46,"removeFromSuperview");
_46=nil;
return;
}
if(_45!=nil){
_47=_45;
}
var pos=objj_msgSend(_43,"_indexForAnchorIndex:",_anchorIndex);
var _48=objj_msgSend(_tokenViews,"indexOfObject:",_46);
objj_msgSend(_tokenViews,"removeObject:",_46);
objj_msgSend(_46,"removeFromSuperview");
var _49=objj_msgSend(objj_msgSend(NAToken,"alloc"),"initWithLabel:",_47);
objj_msgSend(_49,"setField:",_43);
objj_msgSend(_containerView,"addSubview:",_49);
objj_msgSend(_tokenViews,"insertObject:atIndex:",_49,_48);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewDidChangeTokens:"))){
objj_msgSend(_delegate,"tokenTextViewDidChangeTokens:",_43);
}
_anchorIndex+=-pos.offset+1;
objj_msgSend(_43,"_processMaxAnchorIndex");
objj_msgSend(_43,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_currentTokenTextField"),function(_4a,_4b){
with(_4a){
var pos=objj_msgSend(_4a,"_indexForAnchorIndex:",_anchorIndex);
if(pos.index<objj_msgSend(_tokenViews,"count")){
var _4c=objj_msgSend(_tokenViews,"objectAtIndex:",pos.index);
if(objj_msgSend(_4c,"isKindOfClass:",NATokenTextField)){
return _4c;
}
}
var _4d=objj_msgSend(_4a,"_createTokenTextField");
objj_msgSend(_tokenViews,"insertObject:atIndex:",_4d,pos.index);
return _4d;
}
}),new objj_method(sel_getUid("_indexForAnchorIndex:"),function(_4e,_4f,_50){
with(_4e){
var i,_51=0,_52=0,_53,_54=NO,_55=0;
if(_50==0){
return {index:0,offset:0};
}
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_54=(i==objj_msgSend(_tokenViews,"count")-1);
_53=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_52=_51;
if(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_51+=objj_msgSend(objj_msgSend(_53,"stringValue"),"length");
_55=_50-_52;
}else{
_51+=1;
_55=0;
}
if(_54){
if(!objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
continue;
}
}else{
if(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(NAToken,"class"))&&objj_msgSend(objj_msgSend(_tokenViews,"objectAtIndex:",i+1),"isKindOfClass:",objj_msgSend(NAToken,"class"))){
if(_50<=_51){
return {index:i+1,offset:_55};
}
}else{
if(objj_msgSend(objj_msgSend(_tokenViews,"objectAtIndex:",i+1),"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
continue;
}
}
}
if(_50<=_51){
return {index:i,offset:_55};
}
}
return {index:objj_msgSend(_tokenViews,"count"),offset:_55};
}
}),new objj_method(sel_getUid("_indexOfToken:"),function(_56,_57,_58){
with(_56){
var i,_59,_5a=0,_5b=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_59=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(_59==_58){
return _5a;
}
if(objj_msgSend(_59,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_5a+=objj_msgSend(objj_msgSend(_59,"stringValue"),"length");
}else{
_5a+=1;
}
}
return _5a;
}
}),new objj_method(sel_getUid("_tokenMouseDown:object:"),function(_5c,_5d,_5e,_5f){
with(_5c){
objj_msgSend(objj_msgSend(_5c,"window"),"makeFirstResponder:",_5c);
objj_msgSend(_5c,"_focusInput");
if(objj_msgSend(_5e,"modifierFlags")&CPCommandKeyMask||objj_msgSend(_5e,"modifierFlags")&CPControlKeyMask||objj_msgSend(_5e,"modifierFlags")&CPShiftKeyMask){
var _60=objj_msgSend(_selectionIndexes,"copy"),_61=objj_msgSend(_5c,"_indexOfToken:",_5f);
objj_msgSend(_60,"addIndex:",_61);
objj_msgSend(_5c,"setSelectionIndexes:",_60);
}else{
objj_msgSend(_5c,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_5c,"_indexOfToken:",_5f)));
}
}
}),new objj_method(sel_getUid("_processMaxAnchorIndex"),function(_62,_63){
with(_62){
_maxAnchorIndex=0;
var i,_64;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_64=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_64,"isKindOfClass:",NATokenTextField)){
_maxAnchorIndex+=objj_msgSend(objj_msgSend(_64,"stringValue"),"length");
}else{
_maxAnchorIndex+=1;
}
}
}
}),new objj_method(sel_getUid("_anchorIndexWithPoint:"),function(_65,_66,_67){
with(_65){
var i,_68,_69=0,_6a=0;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_68=objj_msgSend(_tokenViews,"objectAtIndex:",i);
_6a=_69;
if(objj_msgSend(_68,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_69+=objj_msgSend(objj_msgSend(_68,"stringValue"),"length");
}else{
_69+=1;
}
if(_67.y>=objj_msgSend(_68,"frame").origin.y&&_67.y<=objj_msgSend(_68,"frame").origin.y+22&&_67.x>=objj_msgSend(_68,"frame").origin.x-6&&_67.x<=objj_msgSend(_68,"frame").origin.x+6){
return _6a;
}
}
return _69;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6b,_6c,_6d){
with(_6b){
if(!editable){
return;
}
objj_msgSend(objj_msgSend(_6b,"window"),"makeFirstResponder:",_6b);
objj_msgSend(_6b,"_focusInput");
objj_msgSend(_6b,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
_anchorIndex=objj_msgSend(_6b,"_anchorIndexWithPoint:",objj_msgSend(_6b,"convertPoint:fromView:",objj_msgSend(_6d,"locationInWindow"),nil));
objj_msgSend(_6b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_6e,_6f){
with(_6e){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewBecomeFirstResponder:"))){
objj_msgSend(_delegate,"tokenTextViewBecomeFirstResponder:",_6e);
}
objj_msgSend(_6e,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_6e,"setNeedsLayout");
objj_msgSend(_6e,"_focusInput");
return YES;
}
}),new objj_method(sel_getUid("_focusInput"),function(_70,_71){
with(_70){
if(!editable){
return;
}
window.setTimeout(function(){
_DOMInputElement.focus();
},0);
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_72,_73){
with(_72){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewResignFirstResponder:"))){
objj_msgSend(_delegate,"tokenTextViewResignFirstResponder:",_72);
}
objj_msgSend(_72,"_addCurrentToken:",nil);
objj_msgSend(_72,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_72,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("_widthForText:"),function(_74,_75,str){
with(_74){
var _76=0;
if(objj_msgSend(str,"length")>0){
objj_msgSend(_labelToHaveWithOfText,"setStringValue:",str);
objj_msgSend(_labelToHaveWithOfText,"sizeToFit");
_76=objj_msgSend(_labelToHaveWithOfText,"frame").size.width;
}
return _76;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_77,_78){
with(_77){
if(bezeled){
objj_msgSend(_77,"setBackgroundColor:",objj_msgSend(_77,"currentValueForThemeAttribute:","bezel-color"));
}else{
objj_msgSend(_77,"setBackgroundColor:",nil);
}
objj_msgSend(_anchor,"setHidden:",!(objj_msgSend(_selectionIndexes,"count")<=0&&objj_msgSend(_77,"hasThemeState:",CPThemeStateEditing)));
var _79;
if(objj_msgSend(_selectionIndexes,"count")<=0){
_79=CPMakeRange(0,0);
}else{
_79=CPMakeRange(objj_msgSend(_selectionIndexes,"firstIndex")+1,objj_msgSend(_selectionIndexes,"lastIndex")-objj_msgSend(_selectionIndexes,"firstIndex")+1);
}
var i,_7a=8,_7b=4,_7c=objj_msgSend(_77,"frame").size.width-_7a*2-26,x=_7a,y=_7b,_7d=nil,_7e=16,_7f=0,_80=nil,_81=nil,_82=NO;
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
var _83=_7f;
_7d=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
_7f+=objj_msgSend(objj_msgSend(_7d,"stringValue"),"length");
}else{
_7f+=1;
}
if(x+objj_msgSend(_7d,"frame").size.width>_7c+_7a){
x=_7a;
y+=_7e+4;
}
objj_msgSend(_7d,"setFrameOrigin:",CGPointMake(x,y));
if(_79.length>0){
if(_80==nil&&_79.location>=_83&&_79.location<=_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_79.location-_83-1]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
if(i==0&&_84==0){
_84-=1;
}
_80=CGPointMake(x+_84,y);
}
if(_80&&_81==nil&&_79.location+_79.length<=_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_79.location+_79.length-_83-1]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
_81=CGPointMake(x+_84,y);
}
}
if(_anchorIndex>=_83&&_anchorIndex<_7f){
var _84=0;
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(NATokenTextField,"class"))){
var str=objj_msgSend(objj_msgSend(_7d,"stringValue"),"substringToIndex:",[_anchorIndex-_83]);
_84=objj_msgSend(_77,"_widthForText:",str);
if(_84>0){
_84-=2;
}
}
var _85=x-2+_84,_86=y+2;
objj_msgSend(_anchor,"setFrameOrigin:",CGPointMake(_85,_86));
}
if(_7f!=_83){
x+=objj_msgSend(_7d,"frame").size.width+3;
}
}
if(_80&&_81==nil){
_81=CGPointMake(x,y);
}
if(_anchorIndex>=_7f){
var _85=x-1,_86=y+2;
objj_msgSend(_anchor,"setFrameOrigin:",CGPointMake(_85,_86));
}
if(_80&&_81){
_80.x-=2;
var _7c=objj_msgSend(_77,"frame").size.width;
var h=20;
var w=_7c-_80.x-2;
_80.y-=2;
_81.y-=2;
if(_81.y==_80.y){
w=_81.x-_80.x-2;
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMake(_80.x,_80.y,w,h));
}else{
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMake(_80.x,_80.y,w,h));
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMake(2,_81.y,_81.x-4,h));
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMake(2,objj_msgSend(_selectionBackground1,"frame").origin.y+h,_7c-4,objj_msgSend(_selectionBackground3,"frame").origin.y-objj_msgSend(_selectionBackground1,"frame").origin.y-h));
}
}else{
objj_msgSend(_selectionBackground1,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground2,"setFrame:",CGRectMakeZero());
objj_msgSend(_selectionBackground3,"setFrame:",CGRectMakeZero());
}
y+=_7e+_7b;
if(y<_minHeight){
y=_minHeight;
}
actualH=objj_msgSend(_77,"frame").size.height;
objj_msgSend(_77,"setFrameSize:",CGSizeMake(objj_msgSend(_77,"frame").size.width,MIN(_maxHeight,y)));
objj_msgSend(_containerView,"setFrameSize:",CGSizeMake(objj_msgSend(_77,"frame").size.width-20,y));
objj_msgSend(objj_msgSend(_theScrollView,"contentView"),"scrollToPoint:",CGPointMake(0,y));
objj_msgSend(_theScrollView,"reflectScrolledClipView:",objj_msgSend(_theScrollView,"contentView"));
if(actualH!=y&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewFrameSizeDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewFrameSizeDidChange:",_77);
}
var _87=objj_msgSend(objj_msgSend(_77,"_currentTokenTextField"),"frame").origin;
if(_tokenOrigin!=_87){
_tokenOrigin=_87;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tokenTextViewCurrentTokenOriginDidChange:"))){
objj_msgSend(_delegate,"tokenTextViewCurrentTokenOriginDidChange:",_77);
}
}
}
}),new objj_method(sel_getUid("clear"),function(_88,_89){
with(_88){
_maxAnchorIndex=0;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_anchorIndex=0;
while(objj_msgSend(_tokenViews,"count")>0){
var _8a=objj_msgSend(_tokenViews,"objectAtIndex:",0);
objj_msgSend(_8a,"removeFromSuperview");
objj_msgSend(_tokenViews,"removeObjectAtIndex:",0);
}
objj_msgSend(_88,"setNeedsLayout");
}
}),new objj_method(sel_getUid("addToken:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(objj_msgSend(NAToken,"alloc"),"initWithLabel:",_8d);
objj_msgSend(_8e,"setField:",_8b);
objj_msgSend(_containerView,"addSubview:",_8e);
objj_msgSend(_tokenViews,"insertObject:atIndex:",_8e,_anchorIndex);
_anchorIndex+=1;
objj_msgSend(_8b,"_processMaxAnchorIndex");
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTokens:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"clear");
var i;
for(i=0;i<objj_msgSend(_91,"count");++i){
objj_msgSend(_8f,"addToken:",objj_msgSend(_91,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("tokens"),function(_92,_93){
with(_92){
var i,_94,_95=[];
for(i=0;i<objj_msgSend(_tokenViews,"count");++i){
_94=objj_msgSend(_tokenViews,"objectAtIndex:",i);
if(objj_msgSend(_94,"isKindOfClass:",NAToken)){
objj_msgSend(_95,"addObject:",objj_msgSend(_94,"stringValue"));
}
}
return _95;
}
}),new objj_method(sel_getUid("currentTokenStringValue"),function(_96,_97){
with(_96){
return objj_msgSend(objj_msgSend(_96,"_currentTokenTextField"),"stringValue");
}
}),new objj_method(sel_getUid("currentTokenOrigin"),function(_98,_99){
with(_98){
return _tokenOrigin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9a,_9b,_9c){
with(_9a){
_delegate=_9c;
}
}),new objj_method(sel_getUid("delegate"),function(_9d,_9e){
with(_9d){
return _delegate;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_9f,_a0){
with(_9f){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_a1,_a2){
with(_a1){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CGInsetMakeZero(),CGInsetMake(2,2,2,2),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12)],["bezel-inset","content-inset","bezel-color","text-color","font"]);
}
})]);
var _1=objj_allocateClassPair(CPView,"NAToken"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label"),new objj_ivar("_isSelected"),new objj_ivar("_normalImage"),new objj_ivar("_selectedImage"),new objj_ivar("_field")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setField:"),function(_a3,_a4,_a5){
with(_a3){
_field=_a5;
}
}),new objj_method(sel_getUid("initWithLabel:"),function(_a6,_a7,_a8){
with(_a6){
_a6=objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("NAToken").super_class},"initWithFrame:",CGRectMakeZero());
if(_a6){
_isSelected=NO;
_DOMElement.style.cursor="default";
_normalImage=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_l.png"),CGSizeMake(9,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_c.png"),CGSizeMake(1,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/tag_r.png"),CGSizeMake(8,16))],NO);
objj_msgSend(_a6,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_normalImage));
_label=objj_msgSend(CPTextField,"labelWithTitle:",_a8);
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGInsetMake(2,3,2,2),"content-inset");
objj_msgSend(_a6,"addSubview:",_label);
var _a9=5;
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrameOrigin:",CGPointMake(_a9,0));
objj_msgSend(_a6,"setFrameSize:",CGSizeMake(objj_msgSend(_label,"frame").size.width+_a9*2,16));
}
return _a6;
}
}),new objj_method(sel_getUid("stringValue"),function(_aa,_ab){
with(_aa){
return objj_msgSend(_label,"stringValue");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ac,_ad,_ae){
with(_ac){
if(objj_msgSend(_field,"editable")){
objj_msgSend(_field,"_tokenMouseDown:object:",_ae,_ac);
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_af,_b0,_b1){
with(_af){
_isSelected=_b1;
objj_msgSend(_af,"setNeedsLayout");
}
}),new objj_method(sel_getUid("isSelected"),function(_b2,_b3){
with(_b2){
return _isSelected;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_b4,_b5){
with(_b4){
if(objj_msgSend(_b4,"isSelected")){
if(!_selectedImage){
_selectedImage=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_l.png"),CGSizeMake(9,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_c.png"),CGSizeMake(1,16)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tags/selected_tag_r.png"),CGSizeMake(8,16))],NO);
}
objj_msgSend(_b4,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_selectedImage));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","ffffff"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"clearColor"),"text-shadow-color");
}else{
objj_msgSend(_b4,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_normalImage));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
}
}
})]);
var _1=objj_allocateClassPair(CPView,"NATokenTextField"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_b6,_b7){
with(_b6){
_b6=objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("NATokenTextField").super_class},"initWithFrame:",CGRectMakeZero());
if(_b6){
_label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","000000"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGInsetMake(2,0,2,0),"content-inset");
objj_msgSend(_b6,"addSubview:",_label);
}
return _b6;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_b8,_b9,_ba){
with(_b8){
objj_msgSend(_label,"setStringValue:",_ba);
objj_msgSend(_b8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("stringValue"),function(_bb,_bc){
with(_bb){
return objj_msgSend(_label,"stringValue");
}
}),new objj_method(sel_getUid("addStringToStringValue:atIndex:"),function(_bd,_be,_bf,_c0){
with(_bd){
var str=objj_msgSend(objj_msgSend(_bd,"stringValue"),"substringToIndex:",_c0)+_bf+objj_msgSend(objj_msgSend(_bd,"stringValue"),"substringFromIndex:",_c0);
objj_msgSend(_bd,"setStringValue:",str);
}
}),new objj_method(sel_getUid("removeCharAtIndex:"),function(_c1,_c2,_c3){
with(_c1){
var str=objj_msgSend(objj_msgSend(_c1,"stringValue"),"substringToIndex:",_c3-1)+objj_msgSend(objj_msgSend(_c1,"stringValue"),"substringFromIndex:",_c3);
objj_msgSend(_c1,"setStringValue:",str);
}
}),new objj_method(sel_getUid("removeFrom:to:"),function(_c4,_c5,_c6,to){
with(_c4){
var str="";
if(_c6>0){
str+=objj_msgSend(objj_msgSend(_c4,"stringValue"),"substringToIndex:",_c6-1);
}
str+=objj_msgSend(objj_msgSend(_c4,"stringValue"),"substringFromIndex:",to);
objj_msgSend(_c4,"setStringValue:",str);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_c7,_c8){
with(_c7){
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_c7,"setFrameSize:",objj_msgSend(_label,"frame").size);
}
})]);
var _1=objj_getClass("CPString");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("trim"),function(_c9,_ca){
with(_c9){
var _cb=objj_msgSend(_c9,"copy");
while(objj_msgSend(_cb,"hasPrefix:"," ")||objj_msgSend(_cb,"hasPrefix:","\n")||objj_msgSend(_cb,"hasPrefix:","\r")||objj_msgSend(_cb,"hasPrefix:","\t")){
_cb=objj_msgSend(_cb,"substringFromIndex:",1);
}
while(objj_msgSend(_cb,"hasSuffix:"," ")||objj_msgSend(_cb,"hasSuffix:","\n")||objj_msgSend(_cb,"hasSuffix:","\r")||objj_msgSend(_cb,"hasSuffix:","\t")){
if(objj_msgSend(_cb,"compare:","")==CPOrderedSame){
return _cb;
}
_cb=objj_msgSend(_cb,"substringToIndex:",objj_msgSend(_cb,"length")-1);
}
return _cb;
}
})]);
var _1=objj_allocateClassPair(CPWindow,"NAMenu"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_items"),new objj_ivar("_content"),new objj_ivar("_backgroundImage"),new objj_ivar("_selectedIndex")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_cc,_cd){
with(_cc){
_cc=objj_msgSendSuper({receiver:_cc,super_class:objj_getClass("NAMenu").super_class},"initWithContentRect:styleMask:",CGRectMake(20,20,100,100),CPBorderlessWindowMask);
if(_cc){
if(!_backgroundImage){
var _ce=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuWindow,"class"));
_backgroundImage=objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]);
}
backgroundColor=objj_msgSend(CPColor,"colorWithPatternImage:",_backgroundImage);
objj_msgSend(_windowView,"setBackgroundColor:",backgroundColor);
objj_msgSend(_contentView,"setFrame:",CGRectMake(5,4,objj_msgSend(_cc,"frame").size.width-10,objj_msgSend(_cc,"frame").size.height-10));
_selectedIndex=0;
}
return _cc;
}
}),new objj_method(sel_getUid("selectedItem"),function(_cf,_d0){
with(_cf){
if(_selectedIndex>=0&&_selectedIndex<objj_msgSend(_content,"count")){
return objj_msgSend(_content,"objectAtIndex:",_selectedIndex);
}
return nil;
}
}),new objj_method(sel_getUid("previous"),function(_d1,_d2){
with(_d1){
_selectedIndex-=1;
if(_selectedIndex<0){
_selectedIndex=objj_msgSend(_content,"count")-1;
}
objj_msgSend(_d1,"layoutSubviews");
}
}),new objj_method(sel_getUid("next"),function(_d3,_d4){
with(_d3){
_selectedIndex+=1;
if(_selectedIndex>=objj_msgSend(_content,"count")){
_selectedIndex=0;
}
objj_msgSend(_d3,"layoutSubviews");
}
}),new objj_method(sel_getUid("setContent:"),function(_d5,_d6,_d7){
with(_d5){
_content=_d7;
objj_msgSend(_d5,"reloadContent");
}
}),new objj_method(sel_getUid("reloadContent"),function(_d8,_d9){
with(_d8){
var i,_da;
if(!_items){
_items=[];
}
while(objj_msgSend(_content,"count")>objj_msgSend(_items,"count")){
objj_msgSend(_items,"addObject:",objj_msgSend(objj_msgSend(NAMenuItem,"alloc"),"init"));
}
for(i=0;i<objj_msgSend(_items,"count");++i){
_da=objj_msgSend(_items,"objectAtIndex:",i);
if(i<objj_msgSend(_content,"count")){
objj_msgSend(_da,"setRepresentedObject:",objj_msgSend(_content,"objectAtIndex:",i));
objj_msgSend(objj_msgSend(_d8,"contentView"),"addSubview:",_da);
}else{
objj_msgSend(_da,"removeFromSuperview");
}
}
if(_selectedIndex>=objj_msgSend(_content,"count")){
_selectedIndex=objj_msgSend(_content,"count")-1;
}
objj_msgSend(_d8,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_db,_dc){
with(_db){
var i,_dd,h=0,w=10;
for(i=0;i<objj_msgSend(_content,"count");++i){
if(i>=objj_msgSend(_items,"count")){
break;
}
var _de=objj_msgSend(objj_msgSend(_items,"objectAtIndex:",i),"minWidth");
if(_de>w){
w=_de;
}
}
for(i=0;i<objj_msgSend(_content,"count");++i){
if(i>=objj_msgSend(_items,"count")){
break;
}
_dd=objj_msgSend(_items,"objectAtIndex:",i);
objj_msgSend(_dd,"setFrame:",CGRectMake(0,h,w,objj_msgSend(NAMenuItem,"height")));
objj_msgSend(_dd,"setFirst:",(i==0));
objj_msgSend(_dd,"setLast:",(i==objj_msgSend(_items,"count")-1));
objj_msgSend(_dd,"setSelected:",(i==_selectedIndex));
h+=objj_msgSend(NAMenuItem,"height");
}
objj_msgSend(_db,"setFrameSize:",CGSizeMake(w,h));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_df,_e0,_e1){
with(_df){
_e1.width+=10;
_e1.height+=10;
objj_msgSendSuper({receiver:_df,super_class:objj_getClass("NAMenu").super_class},"setFrameSize:",_e1);
objj_msgSend(_df,"_checkBordersAndSetFrameOrigin:",objj_msgSend(_df,"frame").origin);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_e2,_e3,_e4){
with(_e2){
_e4.x-=5;
_e4.y-=4;
objj_msgSend(_e2,"_checkBordersAndSetFrameOrigin:",_e4);
}
}),new objj_method(sel_getUid("_checkBordersAndSetFrameOrigin:"),function(_e5,_e6,_e7){
with(_e5){
var _e8=objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"mainWindow"),"frame").size.width;
var _e9=_e7.x+objj_msgSend(_e5,"frame").size.width;
if(_e9>_e8){
_e7.x=_e8-objj_msgSend(_e5,"frame").size.width;
}
objj_msgSendSuper({receiver:_e5,super_class:objj_getClass("NAMenu").super_class},"setFrameOrigin:",_e7);
}
})]);
var _ea=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_l.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_t.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_l.png"),CGSizeMake(1,21))],NO),_eb=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_tl.png"),CGSizeMake(4,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_t.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_tr.png"),CGSizeMake(4,21))],NO),_ec=objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_bl.png"),CGSizeMake(4,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_b.png"),CGSizeMake(1,21)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","menu/selected_br.png"),CGSizeMake(4,21))],NO);
var _1=objj_allocateClassPair(CPView,"NAMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_label"),new objj_ivar("_isLast"),new objj_ivar("_isFirst"),new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("minWidth"),function(_ed,_ee){
with(_ed){
if(!_label){
return 0;
}
objj_msgSend(_label,"sizeToFit");
return objj_msgSend(_label,"frame").size.width+6;
}
}),new objj_method(sel_getUid("setFirst:"),function(_ef,_f0,_f1){
with(_ef){
if(_f1==_isFirst){
return;
}
_isFirst=_f1;
objj_msgSend(_ef,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setLast:"),function(_f2,_f3,_f4){
with(_f2){
if(_f4==_isLast){
return;
}
_isLast=_f4;
objj_msgSend(_f2,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setSelected:"),function(_f5,_f6,_f7){
with(_f5){
if(_f7==_isSelected){
return;
}
_isSelected=_f7;
objj_msgSend(_f5,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_f8,_f9,_fa){
with(_f8){
if(!_label){
_label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_label,"setFrame:",CGRectMake(3,2,0,0));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",12),"font");
objj_msgSend(_f8,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",_fa["name"]);
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_f8,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_fb,_fc){
with(_fb){
if(!_isSelected){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","3d3d3d"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.94),"text-shadow-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGSizeMake(0,1),"text-shadow-offset");
}else{
if(_isFirst){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_eb));
}else{
if(_isLast){
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_ec));
}else{
objj_msgSend(_fb,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_ea));
}
}
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithHexString:","FFFFFF"),"text-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0,0.2),"text-shadow-color");
objj_msgSend(_label,"setValue:forThemeAttribute:",CGSizeMake(0,-1),"text-shadow-offset");
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("height"),function(_fd,_fe){
with(_fd){
return 21;
}
})]);

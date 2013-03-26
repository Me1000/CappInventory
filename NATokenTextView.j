@import <Foundation/CPObject.j>

@implementation NATokenTextView : CPView {
	CPTextField _labelToHaveWithOfText;
	CPArray _tokenViews;
	CPIndexSet _selectedIndexes;
	CPView _anchor;
    CPScrollView _theScrollView;
    CPView       _containerView;
	int _anchorIndex;
	int _maxAnchorIndex;
	int _minHeight;
    int _maxHeight;
	id _delegate;
	id _DOMInputElement;
	CPPoint _tokenOrigin;
	
	// selection background
	CPView _selectionBackground1;
	CPView _selectionBackground2;
	CPView _selectionBackground3;

    BOOL    editable @accessors;
    BOOL    bezeled; 
}

+ (CPString)themeClass
{
    return "textfield";
}

+ (id)themeAttributes
{
    return [CPDictionary dictionaryWithObjects:[CGInsetMakeZero(), CGInsetMake(2.0, 2.0, 2.0, 2.0), [CPColor whiteColor], [CPColor blackColor], [CPFont systemFontOfSize:12.0]]
                                       forKeys:[@"bezel-inset", @"content-inset", @"bezel-color", @"text-color", @"font"]];
}

- (void)setBezeled:(BOOL)aFlag
{
    bezeled = aFlag;
    [self setNeedsLayout];
}

- (id)initWithFrame:(CGRect)aFrame {
    self = [super initWithFrame:aFrame];
    if (self) {
        editable = YES;
        bezeled = YES;
		_selectionIndexes = [CPIndexSet indexSet];
		_tokenViews = [];
		_tokenOrigin = nil;
        _maxHeight = 1000;

        _theScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0,0,aFrame.size.width, aFrame.size.height)];
        [_theScrollView setAutohidesScrollers:YES];
        [_theScrollView setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];
        [self addSubview:_theScrollView];
        _containerView = [[CPView alloc] initWithFrame:CGRectMake(0,0,1,15)];
        [_theScrollView setDocumentView:_containerView];
	
		_containerView._DOMElement.style.cursor = "text";
	
		_DOMInputElement = document.createElement("input");
	    _DOMInputElement.style.position = "absolute";
	    _DOMInputElement.style.zIndex = "-1000";
	    _DOMInputElement.style.opacity = "0";
	    _DOMInputElement.style.filter = "alpha(opacity=0)";
		_DOMInputElement.onfocus = function() {
			[self becomeFirstResponder];
		}
		_DOMInputElement.onblur = function() {
			[self resignFirstResponder];
		}
	   _containerView._DOMElement.appendChild(_DOMInputElement);
	
		_minHeight = aFrame.size.height;
		[self setThemeState:CPThemeStateBezeled];
	
		_labelToHaveWithOfText = [CPTextField labelWithTitle:@""];
		[_labelToHaveWithOfText setHidden:YES];
		[_labelToHaveWithOfText setValue:[CPColor colorWithHexString:"000000"] forThemeAttribute:@"text-color"];
		[_labelToHaveWithOfText setValue:[CPFont systemFontOfSize:12.0] forThemeAttribute:@"font"];
		[_containerView addSubview:_labelToHaveWithOfText];
		
		_selectionBackground1 = [[CPView alloc] initWithFrame:CGRectMakeZero()];
		[_selectionBackground1 setBackgroundColor:[CPColor colorWithHexString:@"d3eafa"]];
		[_containerView addSubview:_selectionBackground1];
		
		_selectionBackground2 = [[CPView alloc] initWithFrame:CGRectMakeZero()];
		[_selectionBackground2 setBackgroundColor:[CPColor colorWithHexString:@"d3eafa"]];
		[_containerView addSubview:_selectionBackground2];
		
		_selectionBackground3 = [[CPView alloc] initWithFrame:CGRectMakeZero()];
		[_selectionBackground3 setBackgroundColor:[CPColor colorWithHexString:@"d3eafa"]];
		[_containerView addSubview:_selectionBackground3];
		
		_anchorIndex = 0;
		_maxAnchorIndex = 0;
		_anchor = [[CPView alloc] initWithFrame:CGRectMake(0,0,1,15)];
		[_anchor setBackgroundColor:[CPColor blackColor]];
		[_containerView addSubview:_anchor];


    }
    return self;
}

- (NATokenTextField)_createTokenTextField {
	var tokenTextField = [[NATokenTextField alloc] init];
	[_containerView addSubview:tokenTextField];
	return tokenTextField;
}

- (void)setSelectionIndexes:(CPIndexSet)anIndexSet {
	if([anIndexSet isEqualToIndexSet:_selectionIndexes])
		return;
		
	var range = { from : [anIndexSet firstIndex], to : [anIndexSet lastIndex] };
	var i, token, total = 0;
	for(i = 0; i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
		if([token isKindOfClass:[NAToken class]]) {
			if(total >= range.from && total <= range.to) {
				[token setSelected:YES];
			}
			else {
				[token setSelected:NO];
			}
		}
		
		if([token isKindOfClass:[NATokenTextField class]])
			total += [[token stringValue] length];
		else
			total += 1;
	}
    
	_selectionIndexes = anIndexSet;
    
    if ([_delegate respondsToSelector:@selector(tokenTextViewDidChangeSelection:)])
		[_delegate tokenTextViewDidChangeSelection:self];

	[self setNeedsLayout];
}

- (BOOL)acceptsFirstResponder {
    return editable;
}

- (void)_updateAutoCompletion {
	if([self _currentTokenTextField] == nil)
		return;
	if ([_delegate respondsToSelector:@selector(tokenTextViewCurrentTokenDidChange:)])
		[_delegate tokenTextViewCurrentTokenDidChange:self];
}

- (void)_charDown:(CPString)string {
	if([_selectionIndexes count] > 0) {
		// remove selected tokens
		[self _removeTokens:_selectionIndexes];
	}

	var pos = [self _indexForAnchorIndex:_anchorIndex];
	[[self _currentTokenTextField] addStringToStringValue:string atIndex:pos.offset];
	_anchorIndex += [string length];
	[self _processMaxAnchorIndex];
	[self setNeedsLayout];
	[self _updateAutoCompletion];
}

- (void)keyUp:(CPEvent)anEvent {
	if([anEvent keyCode] == 86 && ([anEvent modifierFlags] & CPCommandKeyMask || [anEvent modifierFlags] & CPControlKeyMask)) {
		return;
	}

    [super keyUp:anEvent];
}

- (void)keyDown:(CPEvent)anEvent {
	if([anEvent keyCode] == 67 && ([anEvent modifierFlags] & CPCommandKeyMask || [anEvent modifierFlags] & CPControlKeyMask)) {
		// copy
		
		[[CPPasteboard generalPasteboard] declareTypes:[CPStringPboardType] owner:nil];
		[[CPPasteboard generalPasteboard] setString:[self _stringForTokens:_selectionIndexes] forType:CPStringPboardType];
	}
	else if([anEvent keyCode] == 86 && ([anEvent modifierFlags] & CPCommandKeyMask || [anEvent modifierFlags] & CPControlKeyMask)) {
		// paste
		var tokens = [[CPPasteboard generalPasteboard] stringForType:CPStringPboardType];
		window.setTimeout(function() {
			_DOMInputElement.value = "";
		},0.0);
		
		if(tokens != nil) {
			[self _removeTokens:_selectionIndexes];
			
			var tokens = [tokens componentsSeparatedByString:@","];
			var i;
			for(i = 0; i < [tokens count]; ++i) {
				[self addToken:[tokens objectAtIndex:i]];
			}
			if ([_delegate respondsToSelector:@selector(tokenTextViewDidChangeTokens:)])
				[_delegate tokenTextViewDidChangeTokens:self];
		}
	}
	else if([anEvent keyCode] == 8) {
		// backspace
		if([_selectionIndexes count] > 0) {
			// remove selected tokens
			[self _removeTokens:_selectionIndexes];
		}
		else {
			var pos = [self _indexForAnchorIndex:_anchorIndex];
			if(pos.offset == 0) {
				// select the previous token
				if(pos.index - 1 >= 0)
					[self setSelectionIndexes:[CPIndexSet indexSetWithIndex:_anchorIndex - 1]];
			}
			else {
				var currentTokenTextField = [self _currentTokenTextField];
				[currentTokenTextField removeCharAtIndex:pos.offset];
				if([[currentTokenTextField stringValue] length] == 0) {
					[_tokenViews removeObject:currentTokenTextField];
					[currentTokenTextField removeFromSuperview];
					currentTokenTextField = nil;
				}
				_anchorIndex -= 1;
				[self _processMaxAnchorIndex];
				[self setNeedsLayout];
				[self _updateAutoCompletion];
			}
		}
	}
	else if([anEvent keyCode] == 46) {
		// delete
		if([_selectionIndexes count] > 0) {
			// remove selected tokens
			[self _removeTokens:_selectionIndexes];
		}
		else {
			var pos = [self _indexForAnchorIndex:_anchorIndex];
			var currentTokenTextField = [self _currentTokenTextField];
			if(pos.offset == [[currentTokenTextField stringValue] length]) {
				// select the next token
				if(_anchorIndex <= _maxAnchorIndex)
					[self setSelectionIndexes:[CPIndexSet indexSetWithIndex:_anchorIndex]];
			}
			else {
				[currentTokenTextField removeCharAtIndex:pos.offset + 1];
				[self _processMaxAnchorIndex];
			}
			
			if([[currentTokenTextField stringValue] length] == 0) {
				[_tokenViews removeObject:currentTokenTextField];
				[currentTokenTextField removeFromSuperview];
				currentTokenTextField = nil;
			}
			[self setNeedsLayout];
		}
	}
	else if([[anEvent characters] compare:@","] == CPOrderedSame
					|| [anEvent keyCode] == 13) {
		if([anEvent keyCode] == 13 && [_delegate respondsToSelector:@selector(tokenTextViewCompletionForToken:)]) {
			var result = [_delegate tokenTextViewCompletionForToken:self];
			if(result == nil)
				[self _addCurrentToken:nil];
			else 
				[self _addCurrentToken:result];
		}
		else
			[self _addCurrentToken:nil];
		[self _updateAutoCompletion];
	}
	else if([anEvent keyCode] == CPRightArrowKeyCode) {
		if([anEvent modifierFlags] & CPCommandKeyMask) {
			if([anEvent modifierFlags] & CPShiftKeyMask) {
				if([_selectionIndexes count] > 0) {
					var indexSet = [_selectionIndexes copy];
					[indexSet addIndex:_maxAnchorIndex];
					[self setSelectionIndexes:indexSet];
				}
				else
					[self setSelectionIndexes:[CPIndexSet indexSetWithIndexesInRange:CPMakeRange(_anchorIndex,_maxAnchorIndex - _anchorIndex)]];
			}
			_anchorIndex = _maxAnchorIndex;
			[self setNeedsLayout]; 
			// anchor at the ending
		}
		else if([anEvent modifierFlags] & CPShiftKeyMask) {
			if([_selectionIndexes count] > 0) {
				var indexSet = [_selectionIndexes copy];
				[indexSet addIndex:_anchorIndex];
				[self setSelectionIndexes:indexSet];
			}
			else if(_anchorIndex >= 0)
				[self setSelectionIndexes:[CPIndexSet indexSetWithIndex:_anchorIndex]];
				
			if(_anchorIndex < _maxAnchorIndex)
				_anchorIndex += 1;
		}
		else {
			if([_selectionIndexes count] <= 0) {
				if(_anchorIndex < _maxAnchorIndex)
					_anchorIndex += 1;
			}
			else {
				_anchorIndex = [_selectionIndexes lastIndex] + 1;
				[self setSelectionIndexes:[CPIndexSet indexSet]];			
			}
			[self setNeedsLayout];
		}
	}
	else if([anEvent keyCode] == CPLeftArrowKeyCode) {
		if([anEvent modifierFlags] & CPCommandKeyMask) {
			if([anEvent modifierFlags] & CPShiftKeyMask) {
				if([_selectionIndexes count] > 0) {
					var indexSet = [_selectionIndexes copy];
					[indexSet addIndex:0];
					[self setSelectionIndexes:indexSet];
				}
				else
					[self setSelectionIndexes:[CPIndexSet indexSetWithIndexesInRange:CPMakeRange(0,_anchorIndex)]];
			}
			_anchorIndex = 0;
			[self setNeedsLayout]; 
			// anchor at the beginning
		}
		else if([anEvent modifierFlags] & CPShiftKeyMask) {
			if(_anchorIndex > 0)
				_anchorIndex -= 1;
				
			if([_selectionIndexes count] > 0) {
				var indexSet = [_selectionIndexes copy];
				[indexSet addIndex:_anchorIndex];
				[self setSelectionIndexes:indexSet];
			}
			else if(_anchorIndex >= 0)
				[self setSelectionIndexes:[CPIndexSet indexSetWithIndex:_anchorIndex]];
		}
		else {
			if([_selectionIndexes count] <= 0) {
				if(_anchorIndex > 0)
					_anchorIndex -= 1;
			}
			else {
				_anchorIndex = [_selectionIndexes firstIndex];
				[self setSelectionIndexes:[CPIndexSet indexSet]];			
			}
			[self setNeedsLayout];
		}
	}
	else if(([anEvent modifierFlags] & CPCommandKeyMask || [anEvent modifierFlags] & CPControlKeyMask)
	&& [anEvent keyCode] == 65) {
		[self selectAll];
	}
	else {
		if ([_delegate respondsToSelector:@selector(tokenTextView:keyDown:)])
			[_delegate tokenTextView:self keyDown:anEvent];
		
		[[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
		
		window.setTimeout(function() {
			if(_DOMInputElement.value != "") {
				[self _charDown:_DOMInputElement.value];
			}
			_DOMInputElement.value = "";
			
		},0.0);
	}

    [super keyDown:anEvent];
}

- (void)selectAll {
	[self setSelectionIndexes:[CPIndexSet indexSetWithIndexesInRange:CPMakeRange(0,_maxAnchorIndex)]];
}

- (void)_mergeTokenTextFields {
	var i = 0, token, cachedToken = nil;
	var toRemove = [];
	while(i < [_tokenViews count]) {
		token = [_tokenViews objectAtIndex:i];
		if([token isKindOfClass:[NATokenTextField class]]) {
			if(cachedToken != nil) {
				[cachedToken setStringValue:[cachedToken stringValue] + [token stringValue]];
				[toRemove addObject:token];
			}
			cachedToken = token;
		}
		else
			cachedToken = nil;
		
		i += 1;
	}
	
	for(i = 0; i < [toRemove count]; ++i) {
		var token = [toRemove objectAtIndex:i];
		[_tokenViews removeObject:token];
		[token removeFromSuperview];	
	}
}

- (void)_stringForTokens:(CPIndexSet)anIndexSet {
	var range = CPMakeRange([anIndexSet firstIndex],[anIndexSet lastIndex] - [anIndexSet firstIndex] + 1);
	var i, token, total = 0, oldTotal = 0, string = @"";
	for(i = 0;  i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
		
		oldTotal = total;
		if([token isKindOfClass:[NATokenTextField class]])
			total += [[token stringValue] length];
		else
			total += 1;
		
		var aRange = CPMakeRange(oldTotal,total - oldTotal);
		var intersectRange = CPIntersectionRange(range,aRange);
		if(intersectRange.length > 0) {
			if([string compare:@""] != CPOrderedSame)
				string += @",";
				
			if([token isKindOfClass:[NAToken class]])
				string += [token stringValue];
			else
				string += [[token stringValue] substringWithRange:CPMakeRange(intersectRange.location - total,intersectRange.length)];
		}
	}

	return string;
}

- (void)_removeTokens:(CPIndexSet)anIndexSet {
	if([anIndexSet count] <= 0)
		return;
	var range = CPMakeRange([anIndexSet firstIndex],[anIndexSet lastIndex] - [anIndexSet firstIndex] + 1);
	var toRemove = [], i, token, total = 0, oldTotal = 0;
	for(i = 0;  i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
		
		oldTotal = total;
		if([token isKindOfClass:[NATokenTextField class]])
			total += [[token stringValue] length];
		else
			total += 1;
		
		var aRange = CPMakeRange(oldTotal,total - oldTotal);
		var intersectRange = CPIntersectionRange(range,aRange);
		if(intersectRange.length > 0) {
			if([token isKindOfClass:[NAToken class]]) {
				[toRemove addObject:token];
			}
			else {
				// remove the selected characters from textfield
				intersectRange.location -= oldTotal;
				[token removeFrom:intersectRange.location + 1 to:intersectRange.location + intersectRange.length];
				if([[token stringValue] length] == 0) {
					[toRemove addObject:token];
				}
			}
		}
	}

	for(i = 0; i < [toRemove count]; ++i) {
		var token = [toRemove objectAtIndex:i];
		[_tokenViews removeObject:token];
		[token removeFromSuperview];	
	}
	
	_anchorIndex = [anIndexSet firstIndex];
	
	if ([_delegate respondsToSelector:@selector(tokenTextViewDidChangeTokens:)])
		[_delegate tokenTextViewDidChangeTokens:self];
	
	[self _mergeTokenTextFields];
	[self _processMaxAnchorIndex];
	[self setSelectionIndexes:[CPIndexSet indexSet]];
}

- (void)_addCurrentToken:(CPString)replaceWith {
	var currentTokenTextField = [self _currentTokenTextField];
	var currentToken = [[currentTokenTextField stringValue] trim];
	if([currentToken length] <= 0) {
		// destroy immediately
		[_tokenViews removeObject:currentTokenTextField];
		[currentTokenTextField removeFromSuperview];
		currentTokenTextField = nil;
		return;
	}
	
	if(replaceWith != nil)
		currentToken = replaceWith;
	
	var pos = [self _indexForAnchorIndex:_anchorIndex];
	
	var index = [_tokenViews indexOfObject:currentTokenTextField];
	[_tokenViews removeObject:currentTokenTextField];
	[currentTokenTextField removeFromSuperview];
		
	var token = [[NAToken alloc] initWithLabel:currentToken];
    [token setField:self];
	[_containerView addSubview:token];
	[_tokenViews insertObject:token atIndex:index];
	
	if ([_delegate respondsToSelector:@selector(tokenTextViewDidChangeTokens:)])
		[_delegate tokenTextViewDidChangeTokens:self];
	
	_anchorIndex += - pos.offset + 1;
	
	[self _processMaxAnchorIndex];
	[self setNeedsLayout];
}

- (void)_currentTokenTextField {
	var pos = [self _indexForAnchorIndex:_anchorIndex];
	if(pos.index < [_tokenViews count]) {
		var token = [_tokenViews objectAtIndex:pos.index];
		if([token isKindOfClass:NATokenTextField]) {
			return token;
		}
	}	
	
	// NATokenTextField not found, create one
	var tokenTextField = [self _createTokenTextField];
	[_tokenViews insertObject:tokenTextField atIndex:pos.index];
	return tokenTextField;
}

- (JSObject)_indexForAnchorIndex:(int)anIndex {
	var i, total = 0, oldTotal = 0, token, last = NO, offset = 0;
	if(anIndex == 0)
		return { index: 0, offset : 0 };
	for(i = 0; i < [_tokenViews count]; ++i) {
		last = (i == [_tokenViews count] - 1);
		token = [_tokenViews objectAtIndex:i];
		oldTotal = total;
		if([token isKindOfClass:[NATokenTextField class]]) {
			total += [[token stringValue] length];
			offset = anIndex - oldTotal;
		}
		else {
			total += 1;
			offset = 0;
		}
		
		if(last) {
			if(![token isKindOfClass:[NATokenTextField class]])
				continue;
		}
		else {
			if([token isKindOfClass:[NAToken class]] &&
					[[_tokenViews objectAtIndex:i+1] isKindOfClass:[NAToken class]]) {
				if(anIndex <= total)
					return { index: i + 1, offset: offset };
			}
			else if([[_tokenViews objectAtIndex:i+1] isKindOfClass:[NATokenTextField class]])
				continue;
		}

		if(anIndex <= total)
			return { index: i, offset: offset };
	}
	return { index: [_tokenViews count], offset: offset };
}

- (void)_indexOfToken:(id)object {
	var i, token, total = 0, oldTotal = 0;
	for(i = 0; i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];

		if(token == object)
			return total;

		if([token isKindOfClass:[NATokenTextField class]])
			total += [[token stringValue] length];
		else
			total += 1;
	}
	return total;
}

- (void)_tokenMouseDown:(CPEvent)anEvent object:(id)object {
	[[self window] makeFirstResponder:self];
	[self _focusInput];
	
	if([anEvent modifierFlags] & CPCommandKeyMask || [anEvent modifierFlags] & CPControlKeyMask || [anEvent modifierFlags] & CPShiftKeyMask) {
		var indexesSet = [_selectionIndexes copy],
			index = [self _indexOfToken:object];
		[indexesSet addIndex:index];
		[self setSelectionIndexes:indexesSet];
	}
	else {
		[self setSelectionIndexes:[CPIndexSet indexSetWithIndex:[self _indexOfToken:object]]];
	}
}

- (void)_processMaxAnchorIndex {
	_maxAnchorIndex = 0;
	var i, token;
	for(i = 0; i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
		if([token isKindOfClass:NATokenTextField])
			_maxAnchorIndex += [[token stringValue] length];
		else
			_maxAnchorIndex += 1;
	}
	/*if(_anchorIndex > _maxAnchorIndex)
		_anchorIndex = _maxAnchorIndex;*/
}

- (int)_anchorIndexWithPoint:(CPPoint)point {
	var i, token, total = 0, oldTotal = 0;
	for(i = 0; i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
			
		oldTotal = total;
		if([token isKindOfClass:[NATokenTextField class]])
			total += [[token stringValue] length];
		else
			total += 1;
			
		if(point.y >= [token frame].origin.y && point.y <= [token frame].origin.y + 22
			&& point.x >= [token frame].origin.x - 6 && point.x <= [token frame].origin.x + 6) {
			return oldTotal;
		}
	}
	return total;
}

- (void)mouseDown:(CPEvent)anEvent {
    if (!editable)
        return;

	[[self window] makeFirstResponder:self];
	[self _focusInput];
		
	[self setSelectionIndexes:[CPIndexSet indexSet]];
	
	// find the anchor index
	_anchorIndex = [self _anchorIndexWithPoint:[self convertPoint:[anEvent locationInWindow] fromView:nil]];
	[self setNeedsLayout];
}

- (BOOL)becomeFirstResponder {
	if ([_delegate respondsToSelector:@selector(tokenTextViewBecomeFirstResponder:)])
		[_delegate tokenTextViewBecomeFirstResponder:self];
	[self setThemeState:CPThemeStateEditing];
	[self setNeedsLayout];
	[self _focusInput];
	return YES;
}

- (void)_focusInput {
    if (!editable)
        return;

	window.setTimeout(function() 
    { 
        _DOMInputElement.focus();
    }, 0.0);
}

- (BOOL)resignFirstResponder {
	if ([_delegate respondsToSelector:@selector(tokenTextViewResignFirstResponder:)])
		[_delegate tokenTextViewResignFirstResponder:self];
	[self _addCurrentToken:nil];
	[self unsetThemeState:CPThemeStateEditing];
	[self setNeedsLayout];
	return YES;
}

- (int)_widthForText:(CPString)str {
	var widthOfText = 0;
	if([str length] > 0) {
		[_labelToHaveWithOfText setStringValue:str];
		[_labelToHaveWithOfText sizeToFit];
		widthOfText = [_labelToHaveWithOfText frame].size.width;
	}
	return widthOfText;
}

- (void)layoutSubviews {
    if (bezeled)
	   [self setBackgroundColor:[self currentValueForThemeAttribute:@"bezel-color"]];
    else
        [self setBackgroundColor:nil];
	
	[_anchor setHidden:!([_selectionIndexes count] <= 0 && [self hasThemeState:CPThemeStateEditing])];
	
	var range;
	if([_selectionIndexes count] <= 0)
		range = CPMakeRange(0,0);
	else
		range = CPMakeRange([_selectionIndexes firstIndex] + 1,[_selectionIndexes lastIndex] - [_selectionIndexes firstIndex] + 1);
	
	var i,
		initX = 8,
		initY = 4,
		width = [self frame].size.width - initX * 2 - 26,
		x = initX,
		y = initY,
		token = nil,
		lineHeight = 16,
		anchorTotal = 0,
		selectionFromPoint = nil,
		selectionEndPoint = nil,
		empty = NO;
	for(i = 0; i < [_tokenViews count]; ++i) {
		var oldAnchorTotal = anchorTotal;
		
		token = [_tokenViews objectAtIndex:i];
		
		if([token isKindOfClass:[NATokenTextField class]])
			anchorTotal += [[token stringValue] length];
		else
			anchorTotal += 1;

		if(x + [token frame].size.width > width + initX) {
			x = initX;
			y += lineHeight + 4;
		}
		[token setFrameOrigin:CGPointMake(x,y)];			
		
		if(range.length > 0) {
			if(selectionFromPoint == nil && range.location >= oldAnchorTotal && range.location <= anchorTotal) {
				var strWidth = 0;
				if([token isKindOfClass:[NATokenTextField class]]) {
					var str = [[token stringValue] substringToIndex:[range.location - oldAnchorTotal - 1]];
					strWidth = [self _widthForText:str];
					if(strWidth > 0)
						strWidth -= 2;
				}		
				if(i == 0 && strWidth == 0)
					strWidth -= 1;
				selectionFromPoint = CGPointMake(x + strWidth,y);
			}
			if(selectionFromPoint && selectionEndPoint == nil && range.location + range.length <= anchorTotal) {
				var strWidth = 0;
				if([token isKindOfClass:[NATokenTextField class]]) {
					var str = [[token stringValue] substringToIndex:[range.location + range.length - oldAnchorTotal - 1]];
					strWidth = [self _widthForText:str];
					if(strWidth > 0)
						strWidth -= 2;
				}
				selectionEndPoint = CGPointMake(x + strWidth,y);
			}
		}
		
		if(_anchorIndex >= oldAnchorTotal && _anchorIndex < anchorTotal) {
			// draw anchor
			var strWidth = 0;
			if([token isKindOfClass:[NATokenTextField class]]) {
				var str = [[token stringValue] substringToIndex:[_anchorIndex - oldAnchorTotal]];
				strWidth = [self _widthForText:str];
				if(strWidth > 0)
					strWidth -= 2;
			}
			var anchorX = x - 2 + strWidth,
				anchorY = y + 2;
			[_anchor setFrameOrigin:CGPointMake(anchorX,anchorY)];
		}
		
		if(anchorTotal != oldAnchorTotal)
			x += [token frame].size.width + 3;
	}
	
	if(selectionFromPoint && selectionEndPoint == nil)
		selectionEndPoint = CGPointMake(x,y);
	
	if(_anchorIndex >= anchorTotal) {
		var anchorX = x - 1,
			anchorY = y + 2;
		[_anchor setFrameOrigin:CGPointMake(anchorX,anchorY)];
	}

	// draw selection background
	if(selectionFromPoint && selectionEndPoint) {
		selectionFromPoint.x -= 2;
		
		var width = [self frame].size.width;
		var h = 20;
		var w = width - selectionFromPoint.x - 2;
		selectionFromPoint.y -= 2;
		selectionEndPoint.y -= 2;
		
		if(selectionEndPoint.y == selectionFromPoint.y) {
			w = selectionEndPoint.x - selectionFromPoint.x - 2;
			[_selectionBackground2 setFrame:CGRectMakeZero()];
			[_selectionBackground3 setFrame:CGRectMakeZero()];
			[_selectionBackground1 setFrame:CGRectMake(selectionFromPoint.x,selectionFromPoint.y,w,h)];
		}
		else {
			[_selectionBackground1 setFrame:CGRectMake(selectionFromPoint.x,selectionFromPoint.y,w,h)];
			[_selectionBackground3 setFrame:CGRectMake(2,selectionEndPoint.y,selectionEndPoint.x - 4,h)];
			[_selectionBackground2 setFrame:CGRectMake(2,[_selectionBackground1 frame].origin.y + h,width - 4,[_selectionBackground3 frame].origin.y - [_selectionBackground1 frame].origin.y - h)];
		}
	}
	else {
		[_selectionBackground1 setFrame:CGRectMakeZero()];
		[_selectionBackground2 setFrame:CGRectMakeZero()];
		[_selectionBackground3 setFrame:CGRectMakeZero()];
	}
	
	y += lineHeight + initY;
	if(y < _minHeight)
		y = _minHeight;
	actualH = [self frame].size.height;
	[self setFrameSize:CGSizeMake([self frame].size.width,MIN(_maxHeight, y))];
    [_containerView setFrameSize:CGSizeMake([self frame].size.width-20 ,y)];
    [[_theScrollView contentView] scrollToPoint: CGPointMake(0,y)];
    [_theScrollView reflectScrolledClipView: [_theScrollView contentView]];
	if (actualH != y && [_delegate respondsToSelector:@selector(tokenTextViewFrameSizeDidChange:)])
		[_delegate tokenTextViewFrameSizeDidChange:self];
	
	var tokenOrigin = [[self _currentTokenTextField] frame].origin;
	if(_tokenOrigin != tokenOrigin) {
		_tokenOrigin = tokenOrigin;
		if ([_delegate respondsToSelector:@selector(tokenTextViewCurrentTokenOriginDidChange:)])
			[_delegate tokenTextViewCurrentTokenOriginDidChange:self];
	}
}

- (void)clear {
	_maxAnchorIndex = 0;
	_selectionIndexes = [CPIndexSet indexSet];
	_anchorIndex = 0;
	while([_tokenViews count] > 0) {
		var token = [_tokenViews objectAtIndex:0];
		[token removeFromSuperview];
		[_tokenViews removeObjectAtIndex:0];
	}
	[self setNeedsLayout];
}

- (void)addToken:(CPString)tokenString {
	var token = [[NAToken alloc] initWithLabel:tokenString];
    [token setField:self];
	[_containerView addSubview:token];
	
	[_tokenViews insertObject:token atIndex:_anchorIndex];
	_anchorIndex += 1;
	
	[self _processMaxAnchorIndex];
	[self setNeedsLayout];
}

- (void)setTokens:(CPArray)tokens {
	[self clear];
	
	var i;
	for(i = 0; i < [tokens count]; ++i) {
		[self addToken:[tokens objectAtIndex:i]];
	}
}

- (CPArray)tokens {
	var i,
		token,
		tokens = [];
	for(i = 0; i < [_tokenViews count]; ++i) {
		token = [_tokenViews objectAtIndex:i];
		if([token isKindOfClass:NAToken])
			[tokens addObject:[token stringValue]];
	}
	return tokens;
}

- (CPString)currentTokenStringValue {
	return [[self _currentTokenTextField] stringValue];
}

- (CPPoint)currentTokenOrigin {
	return _tokenOrigin;
}

- (void)setDelegate:(id)aDelegate
{
    _delegate = aDelegate;
}

- (id)delegate
{
    return _delegate;
}

@end

@implementation NAToken : CPView {
	CPTextField _label;
	BOOL _isSelected;
	CPImage _normalImage;
	CPImage _selectedImage;
    id      _field;
}

- (void)setField:(id)aField
{
    _field = aField;
}

- (id)initWithLabel:(CPString)label {
    self = [super initWithFrame:CGRectMakeZero()];
    if (self) {
		_isSelected = NO;
		
		_DOMElement.style.cursor = "default";
		
		_normalImage = [[CPThreePartImage alloc] initWithImageSlices:[
			[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/tag_l.png"] size:CGSizeMake(9,16)],
			[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/tag_c.png"] size:CGSizeMake(1,16)],
			[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/tag_r.png"] size:CGSizeMake(8,16)]
		] isVertical:NO];
		
		[self setBackgroundColor:[CPColor colorWithPatternImage:_normalImage]];
	
		_label = [CPTextField labelWithTitle:label];
		[_label setValue:[CPColor colorWithHexString:"000000"] forThemeAttribute:@"text-color"];
		[_label setValue:[CPFont systemFontOfSize:12.0] forThemeAttribute:@"font"];
		[_label setValue:CGInsetMake(2.0, 3.0, 2.0, 2.0) forThemeAttribute:@"content-inset"];
		[self addSubview:_label];
		
		var margin = 5;
		[_label sizeToFit];
		[_label setFrameOrigin:CGPointMake(margin,0)];
		[self setFrameSize:CGSizeMake([_label frame].size.width + margin * 2,16)];
    }
    return self;
}

- (CPString)stringValue {
	return [_label stringValue];
}

- (void)mouseDown:(CPEvent)anEvent {
    if ([_field editable])
    	[_field _tokenMouseDown:anEvent object:self];
}

- (void)setSelected:(BOOL)selected {
	_isSelected = selected;
	[self setNeedsLayout];
}

- (void)isSelected {
	return _isSelected;
}

- (void)layoutSubviews {
	if([self isSelected]) {
		if(!_selectedImage) {
			_selectedImage = [[CPThreePartImage alloc] initWithImageSlices:[
				[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/selected_tag_l.png"] size:CGSizeMake(9,16)],
				[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/selected_tag_c.png"] size:CGSizeMake(1,16)],
				[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"tags/selected_tag_r.png"] size:CGSizeMake(8,16)]
			] isVertical:NO];
		}
		
		[self setBackgroundColor:[CPColor colorWithPatternImage:_selectedImage]];
		[_label setValue:[CPColor colorWithHexString:"ffffff"] forThemeAttribute:@"text-color"];
		[_label setValue:[CPColor clearColor] forThemeAttribute:@"text-shadow-color"];
	}
	else {
		[self setBackgroundColor:[CPColor colorWithPatternImage:_normalImage]];
		[_label setValue:[CPColor colorWithHexString:"000000"] forThemeAttribute:@"text-color"];
	}
}

@end


@implementation NATokenTextField : CPView {
	CPTextField _label;
}

- (id)init {
    self = [super initWithFrame:CGRectMakeZero()];
    if (self) {
		_label = [CPTextField labelWithTitle:@""];
		[_label setValue:[CPColor colorWithHexString:"000000"] forThemeAttribute:@"text-color"];
		[_label setValue:[CPFont systemFontOfSize:12.0] forThemeAttribute:@"font"];
		[_label setValue:CGInsetMake(2.0, 0.0, 2.0, 0.0) forThemeAttribute:@"content-inset"];
		[self addSubview:_label];
    }
    return self;
}

- (void)setStringValue:(CPString)value {
	[_label setStringValue:value];
	[self setNeedsLayout];
}
- (CPString)stringValue {
	return [_label stringValue];
}
- (void)addStringToStringValue:(CPString)string atIndex:(int)index {
	var str = [[self stringValue] substringToIndex:index] + string + [[self stringValue] substringFromIndex:index];
	[self setStringValue:str];
}
- (void)removeCharAtIndex:(int)index {
	var str = [[self stringValue] substringToIndex:index - 1] + [[self stringValue] substringFromIndex:index];
	[self setStringValue:str];
}

- (void)removeFrom:(int)from to:(int)to {
	var str = @"";
	if(from > 0)
		str += [[self stringValue] substringToIndex:from - 1];
	str += [[self stringValue] substringFromIndex:to];
	[self setStringValue:str];
}

- (void)layoutSubviews {
	[_label sizeToFit];
	[self setFrameSize:[_label frame].size];
}

@end

@implementation CPString(Trim)

- (CPString)trim {
	var copy = [self copy];
	while([copy hasPrefix:@" "] || [copy hasPrefix:@"\n"] || [copy hasPrefix:@"\r"] || [copy hasPrefix:@"\t"])
		copy = [copy substringFromIndex:1];
	while([copy hasSuffix:@" "] || [copy hasSuffix:@"\n"] || [copy hasSuffix:@"\r"] || [copy hasSuffix:@"\t"]) {
		if([copy compare:@""] == CPOrderedSame)
			return copy;
		copy = [copy substringToIndex:[copy length] - 1];
	}
	return copy;
}

@end

@implementation NAMenu : CPWindow
{
	CPArray _items;
	CPArray _content;
	CPImage _backgroundImage;
	int _selectedIndex;
}

- (id)init {
	self = [super initWithContentRect:CGRectMake(20,20,100,100) styleMask:CPBorderlessWindowMask];
	if(self) {
		if(!_backgroundImage) {
            var bundle = [CPBundle bundleForClass:[_CPMenuWindow class]];
            _backgroundImage = [[CPNinePartImage alloc] initWithImageSlices:
                [
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindowRounded0.png"] size:CGSizeMake(4.0, 4.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindow1.png"] size:CGSizeMake(1.0, 4.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindowRounded2.png"] size:CGSizeMake(4.0, 4.0)],
                    
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindow3.png"] size:CGSizeMake(4.0, 1.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindow4.png"] size:CGSizeMake(1.0, 1.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindow5.png"] size:CGSizeMake(4.0, 1.0)],
                    
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindowRounded6.png"] size:CGSizeMake(4.0, 4.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindow7.png"] size:CGSizeMake(1.0, 4.0)],
                    [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"_CPMenuWindow/_CPMenuWindowRounded8.png"] size:CGSizeMake(4.0, 4.0)]
                ]];	
		}
		backgroundColor = [CPColor colorWithPatternImage:_backgroundImage];
		[_windowView setBackgroundColor:backgroundColor];
		[_contentView setFrame:CGRectMake(5,4,[self frame].size.width - 10,[self frame].size.height - 10)];
		
		_selectedIndex = 0;
	}
	return self;
}

- (JSObject)selectedItem {
	if(_selectedIndex >= 0 && _selectedIndex < [_content count])
		return [_content objectAtIndex:_selectedIndex];
	return nil;
}

- (void)previous {
	_selectedIndex -= 1;
	if(_selectedIndex < 0)
		_selectedIndex = [_content count] - 1;
	[self layoutSubviews];
}

- (void)next {
	_selectedIndex += 1;
	if(_selectedIndex >= [_content count])
		_selectedIndex = 0;
	[self layoutSubviews];
}

- (void)setContent:(CPArray)content {
	_content = content;
	[self reloadContent];
}

- (void)reloadContent {
	var i,
		item;
		
	if(!_items)
		_items = [];

	while([_content count] > [_items count]) {
		[_items addObject:[[NAMenuItem alloc] init]];
	}
	
	for(i = 0; i < [_items count]; ++i) {
		item = [_items objectAtIndex:i];
		if(i < [_content count]) {
			[item setRepresentedObject:[_content objectAtIndex:i]];
			[[self contentView] addSubview:item];
		}
		else {
			[item removeFromSuperview];
		}
	}
	
	if(_selectedIndex >= [_content count])
		_selectedIndex = [_content count] - 1;
	
	[self layoutSubviews];
}

- (void)layoutSubviews {
	var i,
		item,
		h = 0,
		w = 10;
	for(i = 0; i < [_content count]; ++i) {
		if(i >= [_items count])
			break;
		var tmpW = [[_items objectAtIndex:i] minWidth];
		if(tmpW > w)
			w = tmpW;
	}
	for(i = 0; i < [_content count]; ++i) {
		if(i >= [_items count])
			break;
		item = [_items objectAtIndex:i];
		[item setFrame:CGRectMake(0,h,w,[NAMenuItem height])];
		[item setFirst:(i == 0)];
		[item setLast:(i == [_items count] - 1)];
		[item setSelected:(i == _selectedIndex)];
		h += [NAMenuItem height];
	}
	
	[self setFrameSize:CGSizeMake(w,h)];
}

- (void)setFrameSize:(CGSize)size {
	size.width += 10;
	size.height += 10;
	[super setFrameSize:size];
	[self _checkBordersAndSetFrameOrigin:[self frame].origin];
}


- (void)setFrameOrigin:(CPPoint)origin {
	origin.x -= 5;
	origin.y -= 4;
	[self _checkBordersAndSetFrameOrigin:origin];
}

- (void)_checkBordersAndSetFrameOrigin:(CPPoint)origin {
	var windowWidth = [[[CPApplication sharedApplication] mainWindow] frame].size.width;
	var rightBorder = origin.x + [self frame].size.width;
	if(rightBorder > windowWidth)
		origin.x = windowWidth - [self frame].size.width;
	[super setFrameOrigin:origin];
}

@end

var NAMenuItemSelected = [[CPThreePartImage alloc] initWithImageSlices:[
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_l.png"] size:CGSizeMake(1,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_t.png"] size:CGSizeMake(1,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_l.png"] size:CGSizeMake(1,21)]
	] isVertical:NO],
	NAMenuItemSelectedFirst = [[CPThreePartImage alloc] initWithImageSlices:[
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_tl.png"] size:CGSizeMake(4,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_t.png"] size:CGSizeMake(1,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_tr.png"] size:CGSizeMake(4,21)]
	] isVertical:NO],
	NAMenuItemSelectedLast = [[CPThreePartImage alloc] initWithImageSlices:[
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_bl.png"] size:CGSizeMake(4,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_b.png"] size:CGSizeMake(1,21)],
		[[CPImage alloc] initByReferencingFile:[[CPBundle mainBundle] pathForResource:@"menu/selected_br.png"] size:CGSizeMake(4,21)]
	] isVertical:NO];

@implementation NAMenuItem : CPView
{
	JSObject _object;
	CPTextField _label;
	BOOL _isLast;
	BOOL _isFirst;
	BOOL _isSelected;
}

+ (int)height {
	return 21;
}

- (int)minWidth {
	if(!_label)
		return 0;
	[_label sizeToFit];
	return [_label frame].size.width + 6; 
}

- (void)setFirst:(BOOL)isFirst {
	if(isFirst == _isFirst) return;
	_isFirst = isFirst;
	[self setNeedsLayout];
}
- (void)setLast:(BOOL)isLast {
	if(isLast == _isLast) return;
	_isLast = isLast;
	[self setNeedsLayout];
}
- (void)setSelected:(BOOL)isSelected {
	if(isSelected == _isSelected) return;
	_isSelected = isSelected;
	[self setNeedsLayout];
}

// object = { name, callbackObject, selector }
- (void)setRepresentedObject:(JSObject)object {
	if(!_label) {
		_label = [CPTextField labelWithTitle:@""];
		[_label setFrame:CGRectMake(3,2,0,0)];
		[_label setValue:[CPFont systemFontOfSize:12.0] forThemeAttribute:@"font"];
		[self addSubview:_label];
	}
	
	[_label setStringValue:object["name"]];
	[_label sizeToFit];
	[self setNeedsLayout];
}

- (void)layoutSubviews {
	if(!_isSelected) {
		[self setBackgroundColor:[CPColor clearColor]];
		[_label setValue:[CPColor colorWithHexString:"3d3d3d"] forThemeAttribute:@"text-color"];
		[_label setValue:[CPColor colorWithCalibratedWhite:1.0 alpha:0.94] forThemeAttribute:@"text-shadow-color"];
	    [_label setValue:CGSizeMake(0.0, 1.0) forThemeAttribute:@"text-shadow-offset"];
	}
	else {
		if(_isFirst)
			[self setBackgroundColor:[CPColor colorWithPatternImage:NAMenuItemSelectedFirst]];
		else if(_isLast)
			[self setBackgroundColor:[CPColor colorWithPatternImage:NAMenuItemSelectedLast]];
		else
			[self setBackgroundColor:[CPColor colorWithPatternImage:NAMenuItemSelected]];
		[_label setValue:[CPColor colorWithHexString:"FFFFFF"] forThemeAttribute:@"text-color"];
		[_label setValue:[CPColor colorWithCalibratedWhite:0.0 alpha:0.20] forThemeAttribute:@"text-shadow-color"];
	    [_label setValue:CGSizeMake(0.0, -1.0) forThemeAttribute:@"text-shadow-offset"];

	}
}

@end
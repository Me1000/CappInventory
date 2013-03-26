@implementation ArbitraryHTMLView : CPView
{
    DOMElement      _theDiv @accessors;
    CPView          _frameView @accessors;
    CPSCrollView    _scrollView;
}

- (id)initWithFrame:(CGRect)aFrame
{
     [super initWithFrame:aFrame];
     _theDiv = document.createElement("div");
     _theDiv.name = "div" + Math.floor(Math.random()*10000);
     //_theDiv.style.width = "100%";
     //_theDiv.style.height = "100%";
     _theDiv.style.borderWidth = "0px";
     _theDiv.style.margin = "0px";
     _theDiv.style.padding = "0px";
     _theDiv.style.position = "relative";
     
     //for some reason the div has a 10px margin at the top
     //resetting the margin and paddings of the containing div doesn't work either
     //move it up 11px to get rid of the margin and 1px line at the top.
     _theDiv.style.top = "-11px";
     
     
     _frameView = [[CPView alloc] initWithFrame:CGRectMake(0,0)];
     
     _scrollView = [[CPScrollView alloc] initWithFrame:[self bounds]];
     [_scrollView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
     [_scrollView setAutohidesScrollers:YES];
     [_scrollView setDocumentView:_frameView];
     [self addSubview:_scrollView];
     
     
     _frameView._DOMElement.appendChild(_theDiv);
     
     return self;
}

- (void)setContent:(CPString)aString
{
    theDiv.innerHTML = aString;
}

- (DOMElement)theDiv
{
    return _theDiv;
}

- (void)_resizeFrame
{
    var width   = [self frame].size.width - [CPScroller scrollerWidth];
    
    [_frameView setFrameSize:CGSizeMake(width, _theDiv.offsetHeight + 10)];
    //console.log(_theDiv);
    //console.log(_frameView._DOMElement);
}

 - (void)setFrameSize:(CPSize)aSize
 {
    [super setFrameSize:aSize];
    [self _resizeFrame];
 }

@end
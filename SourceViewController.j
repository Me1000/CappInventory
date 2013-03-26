var MyEfedUpDragData;

@implementation SourceViewController : CPObject
{
    CPView containerView @accessors;
    CPButtonBar buttonBar;
    CPOutlineView sourceList @accessors;
    CPScrollView  scrollView;

    CPButton    minusButton;

    BOOL        detailsPanelIsUp;
    CPView      detailsPanel;
}

- (id)initWithContainerView:(CPView)aView
{
    self = [super init];

    if (self)
    {
        detailsPanelIsUp = NO;
        containerView = aView;
        // add a button bar
        var frame = [aView bounds];
        buttonBar = [SourceViewController myThemedButtonBar];//[[CPButtonBar alloc] initWithFrame:CGRectMake(0, frame.size.height - 26, frame.size.width, 26)];
        [buttonBar setFrame:CGRectMake(0, frame.size.height - 24, frame.size.width, 24)]
        //buttonBar = [[CPButtonBar alloc] initWithFrame:CGRectMake(0, 0, 500, 26)];
        [buttonBar setAutoresizingMask:CPViewWidthSizable|CPViewMinYMargin];

        var plusButton = [SourceViewController plusButton];
        minusButton = [SourceViewController minusButton];

        [minusButton setTarget:self];
        [minusButton setAction:@selector(removeLocation:)];

        [plusButton setTarget:[CPApp delegate]];
        [plusButton setAction:@selector(addNewLocation:)];

        var detailsButton = [[CPButton alloc] initWithFrame:CGRectMake(0, 0, 32, 22)],
            image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"ButtonBar/details-button-up.png"] size:CGSizeMake(11, 12)];

        [detailsButton setBordered:NO];
        [detailsButton setImage:image];
        [detailsButton setImagePosition:CPImageOnly];
        [detailsButton setTarget:self];
        [detailsButton setAction:@selector(toggleDetailsPanel:)];

        [buttonBar setButtons:[plusButton, detailsButton, minusButton]];
        [aView addSubview:buttonBar];

        [[aView superview] setButtonBar:buttonBar forDividerAtIndex:0];
        // add a scrollview
        scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 24)];

        sourceList = [[RLSourceList alloc] initWithFrame:CGRectMakeZero()];//[[CPTableView alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth([view bounds]), CGRectGetHeight([view bounds]) - 32)];

        [sourceList setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        [sourceList setDelegate:self];
        [sourceList setDataSource:self];
        [sourceList setSelectionHighlightStyle:CPTableViewSelectionHighlightStyleSourceList];
        [sourceList registerForDraggedTypes:[@"LocationDragType", @"ItemDragType"]];
        [sourceList setTarget:[[CPApp delegate] locationController]];
        [sourceList setDoubleAction:@selector(edit:)];


        // dark blue
        [sourceList setSelectionGradientColors:[CPDictionary dictionaryWithObjects:[CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [109.0/255.0, 126.0/255.0, 152.180/255.0, 1.0, 87.0/255.0, 104.0/255.0, 124.0/255.0, 1.0], [0,1], 2), [CPColor colorWithCalibratedRed:(152.0/255.0) green:(165.0/255.0) blue:(182.0/255.0) alpha:1.0], [CPColor colorWithCalibratedRed:(87.0/255.0) green:(127.0/255.0) blue:(151.0/255.0) alpha:1.0]] forKeys:[CPSourceListGradient, CPSourceListTopLineColor, CPSourceListBottomLineColor]]]

        var column = [[CPTableColumn alloc] initWithIdentifier:"sourcelist"],
            columnHeader = [column headerView];
        [columnHeader setStringValue:"LOCATIONS"];

        
        [column setDataView:[[SourceListDataView alloc] initWithFrame:CGRectMakeZero()]];
        [column setWidth:300];
        [column setMinWidth:50.0];
        [column setMaxWidth:250];
        //[column setEditable:YES];
        
        [sourceList addTableColumn:column];
        [sourceList setOutlineTableColumn:column];
        [sourceList setColumnAutoresizingStyle:CPTableViewFirstColumnOnlyAutoresizingStyle];
        [sourceList setRowHeight:40.0];
        
        var bgColor = [CPColor colorWithHexString:@"ededed"];
        [sourceList setBackgroundColor:bgColor];
        // modify the header:

        // FIX ME: I broke the drawing of the corner view somehow but if it comes back later 
        // uncomment the following line and it'll magically disapear again. ;)
        //[[sourceList headerView] setDrawsColumnLines:NO];
        [[sourceList headerView] setValue:bgColor forThemeAttribute:"background-color"];
        [columnHeader setValue:[CPNull null] forThemeAttribute:"background-color"];
        [columnHeader setValue:[CPColor colorWithHexString:"666666"] forThemeAttribute:"text-color"];
        [columnHeader setValue:CGInsetMake(6,7,2,10) forThemeAttribute:"text-inset"];
        [[sourceList cornerView] setValue:bgColor forThemeAttribute:"background-color"];
        
        [scrollView setDocumentView:sourceList];
        [scrollView setHasHorizontalScroller:NO];
        [scrollView setAutohidesScrollers:YES];
        [scrollView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        [scrollView setHorizontalLineScroll:0];
        [aView addSubview:scrollView];
        
        //[sourceList sizeLastColumnToFit];
        
    }

    return self;
}

- (void)removeLocation:(id)sender
{
    var index = [[sourceList selectedRowIndexes] firstIndex],
        item = [sourceList itemAtRow:index];

    [[CPApp delegate] confirmRemovalOfLocation:item];

}

- (void)outlineView:(CPOutlineView)aView shouldSelectItem:(id)anItem
{
    return ![[DCFileUploadManager sharedManager] isUploading];
}

- (void)outlineViewSelectionIsChanging:(CPNotification)aNote
{
    // if we're editing anything we need to either save it or not change the selection. kthx
    var controller = [[CPApp delegate] locationController],
        itemView  = [[controller locationView] itemView];
    if ([itemView isEditing]){
        // save it.
        [itemView enterEditMode:NO];
        [controller itemDidEndEditing:[itemView itemForEditingValues]];
    }
}

- (void)outlineViewSelectionDidChange:(CPNotification)aNote
{
    var //sourceList = [aNote object],
        selectedIndex = [[sourceList selectedRowIndexes] firstIndex],
        location = [sourceList itemAtRow:selectedIndex];

    //var repo = [userRepos objectAtIndex:[[[appController sourceList] selectedRowIndexes] firstIndex]];
    /*if([item isKindOfClass:[CPDictionary class]])
    {
        [issuesController setActiveRepo:item];
        [issuesController allIssuesForRepo:[item valueForKey:@"name"] user:[item valueForKey:@"owner"]];
        [issuesController allTagsForRepo:[item valueForKey:@"name"] user:[item valueForKey:@"owner"]];
    }*/

    //var item = [sourceList itemAtRow:0];
    [[[CPApp delegate] locationController] setLocation:location];

    if (!location)
        [minusButton setEnabled:NO];
    else
        [minusButton setEnabled:YES];
}
- (id)outlineView:(CPOutlineView)theOutlineView child:(int)theIndex ofItem:(id)theItem
{
    if (!theItem)
        return [[CPApp delegate] allLocations][theIndex];
    else
        return [theItem subLocations][theIndex];
}

- (BOOL)outlineView:(CPOutlineView)theOutlineView isItemExpandable:(id)theItem
{
    return ([[theItem subLocations] count]);
}

- (int)outlineView:(CPOutlineView)theOutlineView numberOfChildrenOfItem:(id)theItem
{
    if (theItem === nil)
        return [[[CPApp delegate] allLocations] count];
    else
        return [[theItem subLocations] count];
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)theColumn byItem:(id)theItem
{
    var dict = [[CPDictionary alloc] init];
    
    [dict setValue:[LocationItemTypes imageForItemWithTitle:[theItem type]] forKey:"image"];
    [dict setObject:[theItem name] forKey:@"title"];
    [dict setObject:[theItem numberOfItems] forKey:@"items"];

    return dict;
}

- (BOOL)outlineView:(CPOutlineView)anOutlineView writeItems:(CPArray)theItems toPasteboard:(CPPasteBoard)thePasteBoard
{
    [thePasteBoard declareTypes:[@"LocationDragType"] owner:self];
//    [thePasteBoard setData:theItems forType:@"LocationDragType"];
    [thePasteBoard setData:nil forType:@"LocationDragType"];
    MyEfedUpDragData = theItems;

    return YES;
}

- (CPDragOperation)outlineView:(CPOutlineView)anOutlineView validateDrop:(id)theInfo proposedItem:(id)theItem proposedChildIndex:(int)theIndex
{
    var pboard = [theInfo draggingPasteboard];

    if ([[pboard types] containsObject:@"LocationDragType"])
    {
        var currentIndex = (theItem) ? [theItem indexOfSubLocation: MyEfedUpDragData[0]] : [[[CPApp delegate] allLocations] indexOfObject:MyEfedUpDragData[0]];
        if ((theIndex === currentIndex || theIndex === currentIndex + 1) && theItem===  [MyEfedUpDragData[0] superLocation])
            return CPDragOperationNone;
            

        if (theItem === nil)
        {
            //if (theIndex === -1)
              //  theIndex = [[[CPApp delegate] allLocations] count] - 1;

            //console.log(theIndex);

            [anOutlineView setDropItem:nil dropChildIndex:theIndex];
            //[anOutlineView setDropRow:theIndex/*[anOutlineView rowForItem:theIndex]*/ dropOperation:CPTableViewDropAbove];
        }
        
        var pboard = [theInfo draggingPasteboard],
            item = MyEfedUpDragData[0];//[pboard dataForType:@"LocationDragType"][0];
        
        if (item === theItem || [self item:theItem isSubItemOf:item])
            return CPDragOperationNone;
        
        if ([item superLocation] === theItem)
            [anOutlineView setDropItem:theItem dropChildIndex:theIndex];
        else
            [anOutlineView setDropItem:theItem dropChildIndex:theIndex];
        
        return CPDragOperationMove;
    }
    else if([[pboard types] containsObject:@"ItemDragType"])
    {
        if (!theItem || theIndex !== -1)
            return CPDragOperationNone;

        //var itemIndexes = [pboard dataForType:@"ItemDragType"];
        [anOutlineView setDropItem:theItem dropChildIndex:theIndex];
        return CPDragOperationMove;
    }
    
}

- (BOOL)outlineView:(CPOutlineView)outlineView acceptDrop:(id)theInfo item:(id)dropItem childIndex:(int)theIndex
{
    var pboard = [theInfo draggingPasteboard];

    if ([[pboard types] containsObject:@"LocationDragType"])
    {
        //take the item and store it in a var
        var /*locations = [[CPApp delegate] locations],*/
            item = MyEfedUpDragData[0];//[pboard dataForType:@"LocationDragType"][0];    

        /*var superLocation = [item superLocation];

        if (superLocation)
            [superLocation removeSubLocation:item];
        else
            [locations removeObject:item];
    
        if (dropItem === nil)
            [locations insertObject:item atIndex:theIndex];
        else
            [dropItem addSubLocation:item atIndex:theIndex];*/

        var dict = [[CPDictionary alloc] init];
        [dict setObject:item forKey:@"item"];
        [dict setObject:dropItem forKey:@"to"];
        [dict setObject:theIndex forKey:@"index"];
        [self moveLocation:dict];
        MyEfedUpDragData = nil;
        return YES;
    }
    else if([[pboard types] containsObject:@"ItemDragType"])
    {
        var items = [[CPKeyedUnarchiver unarchiveObjectWithData:[pboard dataForType:@"ItemDragType"]] firstIndex],
            aLocation = [sourceList itemAtRow:[[sourceList selectedRowIndexes] firstIndex]];

        items = [aLocation itemAtIndex:items];
        
        if ([[dropItem items] containsObject:items])
            return NO;
        
        [[CPApp delegate] moveItem:items fromLocation:aLocation to:dropItem];

        return YES;
    }
}

- (void)pasteboard:(id)aPasteboard provideDataForType:(id)type
{
    // magic happens, but leave it... otherwise it breaks shit.
}

- (void)moveLocation:(CPDictionary)twoLocations
{
    var item = [twoLocations objectForKey:@"item"],
        to   = [twoLocations objectForKey:@"to"],
        index = ([twoLocations objectForKey:@"index"] || 0),
        from = [item superLocation],
        newIndex = nil;

    // if we move it down from the same superLocation
    if (from === to && ((from && [from indexOfSubLocation:item] < index) || ([[[CPApp delegate] allLocations] indexOfObject:item] < index) ))
            index--;

    // remove it first
    if (from)
    {

        newIndex = [from indexOfSubLocation:item];
        [from removeSubLocation:item];
    }
    else
    {
        newIndex = [[[CPApp delegate] allLocations] indexOfObject:item];
        [[[CPApp delegate] allLocations] removeObject:item];
    }

    // add it somewhere else
    if (to)
        [to addSubLocation:item atIndex:index];
    else
        [[[CPApp delegate] allLocations] insertObject:item atIndex:index];

    // no create an undo dictionary
    [twoLocations setObject:from forKey:@"to"];
    [twoLocations setObject:newIndex forKey:@"index"];
    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(moveLocation:) object:twoLocations];
    
    [sourceList reloadData];
} 

- (BOOL)item:(id)anItem isSubItemOf:(id)superItem
{
    if ([[superItem subLocations] containsObject:anItem])
        return YES;

    for (var i = 0; i < [[superItem subLocations] count]; i++)
    {
        if ([self item:anItem isSubItemOf:[superItem subLocations][i]])
            return YES;
    }

    return NO;
}

- (void)toggleDetailsPanel:(id)sender
{
    var bounds = [containerView bounds];

    if (detailsPanelIsUp)
    {
        [containerView addSubview:buttonBar];
        [sender setImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"ButtonBar/details-button-up.png"] size:CGSizeMake(11, 12)]];

         var endFrame = CGRectMake(0, bounds.size.height - 25, bounds.size.width, 125),
             scrollViewEndFrame = CGRectMake(0,0,bounds.size.width, bounds.size.height - 24);

    }
    else
    {
        [sender setImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"ButtonBar/details-button-down.png"] size:CGSizeMake(11, 12)]];

        if (!detailsPanel)
        {
            // create the details panel

            detailsPanel = [[RLDetailsPane alloc] initWithFrame:CGRectMake(0, bounds.size.height - 25, bounds.size.width, 125)];
            //[detailsPanel setBackgroundColor:[CPColor redColor]];
        }

        [containerView addSubview:detailsPanel];
        [containerView addSubview:buttonBar];

        var endFrame = CGRectMake(0, bounds.size.height - 150, bounds.size.width, 125),
            scrollViewEndFrame = CGRectMake(0,0,bounds.size.width, bounds.size.height - 150);

    }
     var animationDict =  [CPDictionary new],
         animationDict2 = [CPDictionary new];

    [animationDict setValue:detailsPanel forKey:CPViewAnimationTargetKey];
    [animationDict setValue:[detailsPanel frame] forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:endFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:CPAnimationEaseOut forKey:CPViewAnimationEffectKey];

    [animationDict2 setValue:scrollView forKey:CPViewAnimationTargetKey];
    [animationDict2 setValue:[scrollView frame] forKey:CPViewAnimationStartFrameKey];
    [animationDict2 setValue:scrollViewEndFrame forKey:CPViewAnimationEndFrameKey];
    
    var animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict, animationDict2]];

    [animation setDuration:0.2]
    [animation startAnimation];

    detailsPanelIsUp = !detailsPanelIsUp;
}

+ (CPButtonBar)myThemedButtonBar
{
    var buttonbar = [[CPButtonBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 147.0, 23.0)],
        bundle = [CPBundle mainBundle],
        color = [CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bar-bg.png"] size:CGSizeMake(1.0, 23.0)]];

    [buttonbar setHasResizeControl:YES];

    [buttonbar setValue:color forThemeAttribute:@"bezel-color"];

     var buttonBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bezel-left.png"] size:CGSizeMake(2.0, 22.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bar-center-none.png"] size:CGSizeMake(2.0, 22.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bezel-right.png"] size:CGSizeMake(3.0, 22.0)]
            ]
        isVertical:NO]],

        buttonBezelHighlightedColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bezel-left-highlighted.png"] size:CGSizeMake(2.0, 22.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bezel-center-highlighted.png"] size:CGSizeMake(2.0, 22.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/button-bezel-right-highlighted.png"] size:CGSizeMake(2.0, 22.0)]
            ]
        isVertical:NO]];/*

        buttonBezelDisabledColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/buttonBar-button-bezel-disabled-left.png"] size:CGSizeMake(2.0, 24.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/buttonBar-button-bezel-disabled-center.png"] size:CGSizeMake(1.0, 24.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"ButtonBar/buttonBar-button-bezel-disabled-right.png"] size:CGSizeMake(2.0, 24.0)]
            ]
        isVertical:NO]];*/

    [buttonbar setValue:buttonBezelColor forThemeAttribute:@"button-bezel-color"];
    [buttonbar setValue:buttonBezelHighlightedColor forThemeAttribute:@"button-bezel-color" inState:CPThemeStateHighlighted];
    [buttonbar setValue:buttonBezelColor forThemeAttribute:@"button-bezel-color" inState:CPThemeStateDisabled];
    [buttonbar setValue:[CPColor blackColor] forThemeAttribute:@"button-text-color"];


    return buttonbar;
}

+ (id)plusButton
{
    var button = [[CPButton alloc] initWithFrame:CGRectMake(0, 0, 32, 22)],
        image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle bundleForClass:[CPButtonBar class]] pathForResource:@"plus_button.png"] size:CGSizeMake(11, 12)];

    [button setBordered:NO];
    [button setImage:image];
    [button setImagePosition:CPImageOnly];

    return button;
}

+ (id)minusButton
{
    var button = [[CPButton alloc] initWithFrame:CGRectMake(0, 0, 32, 5)],
        image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle bundleForClass:[CPButtonBar class]] pathForResource:@"minus_button.png"] size:CGSizeMake(11, 4)];

    [button setImageDimsWhenDisabled:YES];
    [button setBordered:NO];
    [button setImage:image];
    [button setImagePosition:CPImageOnly];

    return button;
}

@end

@implementation SourceListDataView : CPView
{
    CPImageView imageView;
    CPTextField label;
    CPTextField itemsLabel;
}

- (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];
    if (self)
    {

        //[self setValue:CGInsetMake(2.0, 2.0, 2.0, 2.0) forThemeAttribute:@"content-inset"];
        //[self setValue:CGInsetMake(9.0, 7.0, 5.0, 8.0) forThemeAttribute:@"content-inset"];


        label = [[CPTextField alloc] initWithFrame:CGRectMake(30, 5, aRect.size.width - 20, 27)];
        [label setFont:[CPFont boldSystemFontOfSize:14]];
        [label setLineBreakMode:CPLineBreakByTruncatingTail];
        [label setValue:[CPColor colorWithHexString:@"555555"] forThemeAttribute:@"text-color"];
        //[label setValue:[CPColor whiteColor] forThemeAttribute:@"text-color" inState:CPThemeStateSelected];
        [label setValue:[CPColor colorWithCalibratedWhite:1 alpha:.8] forThemeAttribute:@"text-color" inState:CPThemeStateSelectedDataView];

        [label setValue:CGSizeMake(0,1) forThemeAttribute:@"text-shadow-offset"];
  //      [label setValue:[CPColor clearColor] forThemeAttribute:@"text-shadow-color" inState:CPThemeStateSelectedDataView];
//        [label setValue:[CPColor whiteColor] forThemeAttribute:@"text-shadow-color"];
        [label setAutoresizingMask:CPViewWidthSizable];

        itemsLabel = [[CPTextField alloc] initWithFrame:CGRectMake(30, 23, aRect.size.width - 20, 27)];
        [itemsLabel setFont:[CPFont systemFontOfSize:11]];
        [itemsLabel setLineBreakMode:CPLineBreakByTruncatingTail];
        [itemsLabel setValue:[CPColor colorWithHexString:@"333333"] forThemeAttribute:@"text-color"];
        [itemsLabel setValue:[CPColor colorWithCalibratedWhite:1 alpha:.8] forThemeAttribute:@"text-color" inState:CPThemeStateSelectedDataView];
        [itemsLabel setValue:[CPFont systemFontOfSize:11] forThemeAttribute:@"font" inState:CPThemeStateSelectedDataView];

        [itemsLabel setAutoresizingMask:CPViewWidthSizable];
        
        //[self setBackgroundColor:[CPColor redColor]];
        //[label setBackgroundColor:[CPColor blueColor]];
        //[self setValue:CGInsetMake(2.0, 2.0, 2.0, 2.0) forThemeAttribute:@"content-inset"];
        //[self setValue:[self valueForThemeAttribute:@"content-inset"] forThemeAttribute:@"content-inset"];

        /*[self addSubview:label];*/

        imageView = [[CPImageView alloc] initWithFrame:CGRectMake(3, 10, 22, 22)];
        [self addSubview:label];
        [self addSubview:itemsLabel];
        [self addSubview:imageView];
    }

    return self;
}

- (void)setObjectValue:(id)aValue
{
    if (!aValue)
        return;

    [label setStringValue:[aValue objectForKey:@"title"]];
    [imageView setImage:[aValue objectForKey:@"image"]];
    [itemsLabel setStringValue:([aValue objectForKey:"items"] || "No") +" Items"];
}

- (void)setThemeState:(CPThemeState)aState
{
    [super setThemeState:aState];
    if (aState === CPThemeStateSelectedDataView)
    {
        [label setThemeState:aState];
        [itemsLabel setThemeState:aState];
    }
}

- (void)unsetThemeState:(CPThemeState)aState
{
    [super unsetThemeState:aState];
    if (aState === CPThemeStateSelectedDataView)
    {
        [label unsetThemeState:aState];
        [itemsLabel unsetThemeState:aState];
    }
}

- (void)encodeWithCoder:(id)aCoder
{
    [aCoder encodeObject:imageView forKey:@"imageView"];
    [aCoder encodeObject:label forKey:@"label"];
    [aCoder encodeObject:itemsLabel forKey:@"items"];
    [super encodeWithCoder:aCoder];
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];

    if (self)
    {
        imageView = [aCoder decodeObjectForKey:@"imageView"];
        label = [aCoder decodeObjectForKey:@"label"];
        itemsLabel = [aCoder decodeObjectForKey:@"items"];
    }

    return self;
}

@end

@implementation RLSourceList : CPOutlineView
- (CPMenu)menuForEvent:(CPEvent)anEvent
{
    var contextMenu = [[CPMenu alloc] initWithTitle:""],
        removeItem  = [[CPMenuItem alloc] initWithTitle:"Remove Location" action:@selector(removeItem:) keyEquivalent:nil],
        addItem     = [[CPMenuItem alloc] initWithTitle:"Add Location" action:@selector(addNewLocation:) keyEquivalent:nil],
        viewItem    = [[CPMenuItem alloc] initWithTitle:"View Location" action:@selector(newSelectRow:) keyEquivalent:nil],
        editItem    = [[CPMenuItem alloc] initWithTitle:"Edit Location" action:@selector(edit:) keyEquivalent:nil],
        point       = [self convertPoint:[anEvent locationInWindow] fromView:nil],
        row         = [self rowAtPoint:point];

    [removeItem setTarget:self];
    [addItem setTarget:[CPApp delegate]];
    [viewItem setTarget:self];
    [editItem setTarget:self];
    [removeItem setRepresentedObject:row];
    [viewItem setRepresentedObject:row];
    [editItem setRepresentedObject:row];


    if (row < 0)
    {
        [removeItem setEnabled:NO];
        [viewItem setEnabled:NO];
        [editItem setEnabled:NO];
    }

    [contextMenu addItem:removeItem];
    [contextMenu addItem:viewItem];
    [contextMenu addItem:addItem];
    [contextMenu addItem:editItem];

    return contextMenu;
}

- (void)edit:(id)sender
{
    [self _noteSelectionIsChanging];
    [self selectRowIndexes:[CPIndexSet indexSetWithIndex:[sender representedObject]] byExtendingSelection:NO];
    [[[CPApp delegate] locationController] edit:nil];
    [self _noteSelectionDidChange];
}

- (void)newSelectRow:(id)sender
{
    [self _noteSelectionIsChanging];
    var indexSet = [CPIndexSet indexSetWithIndex:[sender representedObject]];
    [self selectRowIndexes:indexSet byExtendingSelection:NO];
    [self _noteSelectionDidChange];
}

- (void)removeItem:(id)sender
{
    [self selectRowIndexes:[CPIndexSet indexSetWithIndex:[sender representedObject]] byExtendingSelection:NO];
    [[self delegate] removeLocation:nil];

}

@end

@implementation RLDetailsPane : CPView
{
    CPProgressIndicator spaceUsed;
    CPTextField         spaceUsedText;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];


    spaceUsed = [[CPProgressIndicator alloc] initWithFrame:CGRectMake(15, aFrame.size.height - 31, aFrame.size.width - 30, 16)];
    [spaceUsed setDoubleValue:75.0];
    [self addSubview:spaceUsed];

    spaceUsedText = [[CPTextField alloc] initWithFrame:CGRectMake(15, aFrame.size.height - 50, aFrame.size.width - 30, 14)];
    [spaceUsedText setStringValue:"Storage Used: 1.5GB"];
    [spaceUsedText sizeToFit];
    [self addSubview:spaceUsedText];

    var title = [[CPTextField alloc] initWithFrame:CGRectMake(15, 5, aFrame.size.width - 30, 21)];
    [title setFont:[CPFont boldSystemFontOfSize:12.0]];
    [title setTextColor:[CPColor colorWithHexString:"333333"]];
    [title setTextShadowOffset:CGSizeMake(1,2)];
    [title setTextShadowColor:[CPColor whiteColor]];
    [title setStringValue:"Account Details"];
    [title setAlignment:CPCenterTextAlignment];
    [self addSubview:title];

    return self
}

-(void)drawRect:(id)aRect
{
    var context = [[CPGraphicsContext currentContext] graphicsPort];

    CGContextSetStrokeColor(context, [CPColor colorWithHexString:@"CCCCCC"]);

    var points = [
                    CGPointMake(0, 0.5), 
                    CGPointMake(aRect.size.width, 0.5)
                 ];

    CGContextStrokeLineSegments(context, points, 2);
}
@end

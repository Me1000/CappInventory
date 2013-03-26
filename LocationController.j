@implementation LocationController : CPObject
{
    Location location @accessors;
//    LocationEditView locationEditView; // FIX ME: will we need an ivar?

    CPView              containerView;
    NoLocationView      noLocationView;
    CPScrollView        scrollview;
    LocationView        locationView @accessors;

    ItemController      itemController @accessors;
}

- (id)initWithContentView:(CPView)aView
{
    self = [super init];

    if (self)
    {
        containerView = aView;
        var frame = [containerView bounds];//CGRectMake(0,0,700,600);
        scrollview = [[CPScrollView alloc] initWithFrame:frame];
        [scrollview setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

        var colorImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"texture4.png"] size:CGSizeMake(97, 97)];
        [scrollview setBackgroundColor:[CPColor colorWithPatternImage:colorImage]];

        locationView = [[LocationView alloc] initWithFrame:CGRectMake(0, 0, MAX(frame.size.width - 50, 845), MAX(frame.size.height - 50, 600)) andController:self];        
        //locationView = [[LocationView alloc] initWithFrame:CGRectMake(0, 0, 845, 600) andController:self];        
        [locationView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
        itemController = [[ItemController alloc] initWithItemView:[locationView itemView] locationController:self];

        [scrollview setDocumentView:locationView];
        [scrollview setAutohidesScrollers:YES];

        [containerView addSubview:scrollview];
//        [containerView addSubview:locationView];

        noLocationView = [[NoLocationView alloc] initWithFrame:frame];
        [noLocationView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [containerView addSubview:noLocationView];

        [self setLocation:nil];
    }

    return self;
}

- (void)edit:(id)sender
{

    var shadowView = [locationView shadowView],
        frame = [shadowView frame],
        contentView = [[scrollview window] contentView];

    frame = [[shadowView superview] convertRect:frame toView:contentView];

    var locationEditView = [[LocationEditView alloc] initWithFrame:frame],
        contentViewFrame = [contentView frame];

    [locationEditView setLocationData:[location dictionaryValues]];
    [contentView addSubview:locationEditView];
    [locationEditView setSaveAndCloseAction:@selector(saveAndCloseEditLocationWindow:)];
    [locationEditView setTarget:self];

    [locationEditView animateToFrame:CGRectMake(30, 5, contentViewFrame.size.width - 60, contentViewFrame.size.height - 10) willRemove:NO];
}

- (void)saveAndCloseEditLocationWindow:(id)sender
{
    var values = [sender locationData],
        shadowView = [locationView shadowView];
    [self setLocationData:values];
    // animate out.
    var frame = [shadowView frame];//[sender superview]
    frame = [[shadowView superview] convertRect:frame toView:[[scrollview window] contentView]];
    [sender animateToFrame:frame willRemove:YES];
}

// this one is used to create a new item using the GUI
- (void)addNewItem:(id)sender
{
    var item = [[Item alloc] initWithName:@"Untitled"],
        table = [locationView itemTableView];

    [location addItem:item];

    if ([location numberOfItems])
        [locationView hideNoItemsView];

    [[locationView collectionView] reloadContent];
    [table reloadData];
    var newRowIndex = [[location items] count] - 1;
    [table selectRowIndexes:[CPIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [table scrollRowToVisible:newRowIndex];

    var view = [locationView itemView];
    [view enterEditMode:YES];
    //[itemController enterEditMode:YES];
    [[locationView window] makeFirstResponder:[view nameField]];
    [[view nameField] selectText:self];

    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(removeItem:) object:item];
    [[[[CPApp delegate] sourceViewController] sourceList] reloadData];
}

- (void)refreshItemData
{
    [[locationView collectionView] reloadContent];
    [[locationView itemTableView] reloadData];
}

// this expects an actual item object
- (void)addItem:(Item)anItem
{
    [locationView hideNoItemsView];

    [location addItem:anItem];
    [[locationView itemTableView] reloadData];
    [[locationView collectionView] reloadContent];

    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(removeItem:) object:anItem];
}

- (void)confirmRemovalOfItem:(Item)anItem
{
    var removeLocationSheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0,400,120) styleMask:CPDocModalWindowMask],
        contentView = [removeLocationSheet contentView],
        header = [CPTextField labelWithTitle:@"Delete Item"];

    [header setFrame:CGRectMake(100,10, 415, 25)];
    [header setFont:[CPFont boldSystemFontOfSize:15]];
    [contentView addSubview:header];
    
    var headerImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"logoPlain.png"] size:CGSizeMake(68,68)];
    var headerImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20, 10, 68, 68)];
    [headerImageView setImage:headerImage];
    [contentView addSubview:headerImageView];
    
    var warningMessage = [[CPTextField alloc] initWithFrame:CGRectMake(100, 35, 325, 60)];
    [warningMessage setStringValue:@"Are you sure you want to delete '"+ [anItem name] +"'? "];
	[warningMessage setLineBreakMode:CPLineBreakByWordWrapping];
    [contentView addSubview:warningMessage];
    
    var removeButton = [[CPButton alloc] initWithFrame:CGRectMake(285, 85, 100, 24)];
    [removeButton setTitle:@"Remove"];
    [removeButton setTag:0];
    [removeButton setTarget:self];
    [removeButton setAction:@selector(closeSheet:)];
    [contentView addSubview:removeButton];
    [removeLocationSheet setDefaultButton:removeButton];
    
    var cancelButton = [[CPButton alloc] initWithFrame:CGRectMake(175, 85, 100, 24)];
    [cancelButton setTag:-1];
    [cancelButton setTitle:@"Cancel"];
    [cancelButton setTarget:self];
    [cancelButton setAction:@selector(closeSheet:)];
    [contentView addSubview:cancelButton];

    [CPApp beginSheet:removeLocationSheet modalForWindow:[locationView window] modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:anItem];
}

- (void)removeItem:(Item)anItem
{
  //  if (![location numberOfItems])
//        [locationView showNoItemsView];

    [location removeItem:anItem];
    [self refreshItemData];
    [[[[CPApp delegate] sourceViewController] sourceList] reloadData];

    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(addItem:) object:anItem];
}

// set the location of the main view for the items
- (void)setLocation:(Location)aLocation
{
    location = aLocation;

    if (aLocation)
    {
        /*if ([location numberOfItems])
            [locationView hideNoItemsView];
        else
            [locationView showNoItemsView];*/
        var table = [locationView itemTableView];
        [table reloadData];
        [[locationView collectionView] reloadContent];

        [table _noteSelectionIsChanging];
        [table _noteSelectionDidChange];

        [locationView setLocationTitle:[location name]];
        [scrollview setHidden:NO];
        [noLocationView setHidden:YES];
    }
    else
    {
        // display the "NO LOCATION screen dood"
        [scrollview setHidden:YES];
        [noLocationView setHidden:NO];
    }
    [[[CPApp delegate] mainToolbar] validateVisibleItems];
}

// change the values for the model.
- (void)setLocationData:(CPDictionary)newValues
{
    // register the undo
    var oldValues = [location dictionaryValues];

    // return if nothing changed...
    if ([oldValues isEqual:newValues])
        return;

    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(setLocationData:) object:oldValues];

    // set the new values
    [location setName:[newValues valueForKey:@"name"]];
    [location setType:[newValues valueForKey:@"type"]];
    [location setAddress:[newValues valueForKey:@"address"]];

    [[[[CPApp delegate] sourceViewController] sourceList] reloadData];    
}

- (CPArray)allItemsForLocation
{
    return [location items];
}

- (Item)currentItem
{
    var index = [[[locationView itemTableView] selectedRowIndexes] firstIndex];
    return [location items][index];
}

- (void)closeSheet:(id)sender
{
    [CPApp endSheet:[sender window] returnCode:[sender tag]];
}

- (void)didEndSheet:(CPWindow)sheet returnCode:(int)returnCode contextInfo:(id)contextInfo
{   
    [sheet orderOut:self];

    switch (returnCode)
    {
        case 0: // remove location
            [locationView setActiveItem:nil];
            [self removeItem:contextInfo];
            break;
    }
}

/*- (void)fileUpload:(DCFileUpload)anUpload didReceiveResponse:(CPString)aString
{
    var data = JSON.parse(aString),
        item = [[ItemAttachment alloc] init];

    [item setName:data.name];
    [item setType:data.type];
    [item setData:data.data];

    [[locationView itemView] addAttachment:item fromUpload:anUpload];
    [[locationView itemTableView] reloadData];
}


/* this is currently being used in the ItemView but I might move it here later
- (void)fileDropController:(DCFileUploadController)aController didBeginUpload:(DCFileUpload)anUpload
{
    console.log("begin: ");
    console.log(anUpload);
    
}*/

- (void)tableViewSelectionIsChanging:(CPNotification)aNotification
{
    //alert([[aNotification object] class]);
    //first off we're going to have to check if we're editing anything
    //var currentItemView = [locationView itemView];
    //if ([currentItemView isEditing]) // save it.
    //  [self itemDidEndEditing:[currentItemView itemForEditingValues]];
    [itemController saveIfNeeded];
}

- (void)tableViewSelectionDidChange:(CPNotification)aNotification
{
    var row = [[[aNotification object] selectedRowIndexes] firstIndex];

    if (row < 0)
        [locationView setActiveItem:nil];
    else
    {
        [locationView setActiveItem:[location itemAtIndex:row]];
    }

}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(int)aColumn row:(int)aRow
{
    var dict = [CPDictionary new],
        item = [location items][aRow];
    [dict setValue:[item name] forKey:@"name"];
    [dict setValue:[item make] forKey:@"maker"];
    [dict setValue:([[item attachments] count] > 0) forKey:@"attachments"];

    return dict;
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    var count = [[location items] count];

    if (!count)
        [locationView showNoItemsView];
    else
        [locationView hideNoItemsView];

    return [[location items] count];
}

- (BOOL)tableView:(CPTableView)aTableView writeRowsWithIndexes:(CPIndexSet)rowIndexes toPasteboard:(CPPasteboard)pboard
{
    [pboard declareTypes:[@"ItemDragType"] owner:self];
    [pboard setData:[CPKeyedArchiver archivedDataWithRootObject:rowIndexes] forType:@"ItemDragType"];
    return YES;
}

- (CPDragOperation)tableView:(CPTableView)aTableView 
                   validateDrop:(id)info 
                   proposedRow:(CPInteger)row 
                   proposedDropOperation:(CPTableViewDropOperation)operation
{
    var currentIndex = [[CPKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:"ItemDragType"]] firstIndex];
    if (row === currentIndex || row === currentIndex + 1)
        return CPDragOperationNone;

    [aTableView setDropRow:row dropOperation:CPTableViewDropAbove];
        
    return CPDragOperationMove;
}

- (BOOL)tableView:(CPTableView)aTableView acceptDrop:(id)info row:(int)row dropOperation:(CPTableViewDropOperation)operation
{    
    var pboard = [info draggingPasteboard],
        rowData = [pboard dataForType:"ItemDragType"],
        dragRow = [[CPKeyedUnarchiver unarchiveObjectWithData:rowData] firstIndex];

    // move item at dragRow to row
    if (dragRow === row)
        return NO;

    [location moveItemAtIndex:dragRow toIndex:row];

    return YES;
}

- (void)tableViewDeleteKeyPressed:(id)table
{
    [self confirmRemovalOfItem:[location itemAtIndex:[[table selectedRowIndexes] firstIndex]]];
}

- (BOOL)validateToolbarItem:(CPToolbarItem)anItem
{
    var identifier = [anItem itemIdentifier];

    if (identifier === "newItem")
        return !!location;
    else 
        return !!location;
}

+ (CPScroller)customVerticalScroller
{
    var scroller = [[CPScroller alloc] initWithFrame:CGRectMake(0.0, 0.0, 12.0, 170.0)],
        bundle = [CPBundle mainBundle],
        trackColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-track-top.png"] size:CGSizeMake(12.0, 7.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-track-center.png"] size:CGSizeMake(12.0, 1.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-track-bottom.png"] size:CGSizeMake(12.0, 6.0)]
            ]
        isVertical:YES]];
        
    [scroller setValue:21.0 forThemeAttribute:@"minimum-knob-length" inState:CPThemeStateVertical];
    [scroller setValue:CGInsetMake(0.0, 0.0, 0.0, 0.0) forThemeAttribute:@"knob-inset" inState:CPThemeStateVertical];
    [scroller setValue:CGInsetMake(3.0, 0.0, 3.0, 0.0) forThemeAttribute:@"track-inset" inState:CPThemeStateVertical];

    [scroller setValue:trackColor forThemeAttribute:@"knob-slot-color" inState:CPThemeStateVertical];

    [scroller setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"decrement-line-size" inState:CPThemeStateVertical];

    [scroller setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"increment-line-size" inState:CPThemeStateVertical];

    var knobColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-knob-top.png"] size:CGSizeMake(12.0, 7.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-knob-center.png"] size:CGSizeMake(12.0, 1.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-vertical-knob-bottom.png"] size:CGSizeMake(12.0, 6.0)]
            ]
        isVertical:YES]];

    [scroller setValue:knobColor forThemeAttribute:@"knob-color" inState:CPThemeStateVertical];

    return scroller;
}

+ (CPScroller)customHorizontalScroller
{
    var scroller = [[CPScroller alloc] initWithFrame:CGRectMake(0.0, 0.0, 170.0, 12.0)],
        bundle = [CPBundle mainBundle],
        trackColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-track-bottom.png"] size:CGSizeMake(6.0, 12.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-track-center.png"] size:CGSizeMake(1.0, 12.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-track-top.png"] size:CGSizeMake(6.0, 12.0)]
            ]
        isVertical:NO]];
        
    [scroller setValue:21.0 forThemeAttribute:@"minimum-knob-length"];
    [scroller setValue:CGInsetMake(0.0, 0.0, 0.0, 0.0) forThemeAttribute:@"knob-inset"];
    [scroller setValue:CGInsetMake(0.0, 3.0, 0.0, 3.0) forThemeAttribute:@"track-inset"];

    [scroller setValue:trackColor forThemeAttribute:@"knob-slot-color"];

    [scroller setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"decrement-line-size"];

    [scroller setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"increment-line-size"];

    var knobColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-knob-bottom.png"] size:CGSizeMake(6.0, 12.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-knob-center.png"] size:CGSizeMake(1.0, 12.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Scroller/scroller-horizontal-knob-top.png"] size:CGSizeMake(6.0, 12.0)]
            ]
        isVertical:NO]];

    [scroller setValue:knobColor forThemeAttribute:@"knob-color"];

    return scroller;
}
/*
+ (CPScroller)themedHorizontalScroller
{
    var scroller = [[CPScroller alloc] initWithFrame:CGRectMake(0.0, 0.0, 170.0, 15.0)],
        trackColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-horizontal-track.png" size:CGSizeMake(1.0, 15.0)]),
        disabledTrackColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-horizontal-track-disabled.png" size:CGSizeMake(1.0, 15.0)]);

    [scroller setValue:21.0 forThemeAttribute:@"minimum-knob-length"];
    [scroller setValue:CGInsetMake(0.0, 0.0, 0.0, 0.0) forThemeAttribute:@"knob-inset"];
    [scroller setValue:CGInsetMake(0.0, -10.0, 0.0, -11.0) forThemeAttribute:@"track-inset"];

    [scroller setValue:trackColor forThemeAttribute:@"knob-slot-color"];
    [scroller setValue:disabledTrackColor forThemeAttribute:@"knob-slot-color" inState:CPThemeStateDisabled];

    var arrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-left-arrow.png" size:CGSizeMake(24.0, 15.0)]),
        highlightedArrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-left-arrow-highlighted.png" size:CGSizeMake(24.0, 15.0)]),
        disabledArrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-left-arrow-disabled.png" size:CGSizeMake(24.0, 15.0)]);

    [scroller setValue:CGSizeMake(24.0, 15.0) forThemeAttribute:@"decrement-line-size"];
    [scroller setValue:arrowColor forThemeAttribute:@"decrement-line-color"];
    [scroller setValue:highlightedArrowColor forThemeAttribute:@"decrement-line-color" inState:CPThemeStateHighlighted],
    [scroller setValue:disabledArrowColor forThemeAttribute:@"decrement-line-color" inState:CPThemeStateDisabled];

    var arrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-right-arrow.png" size:CGSizeMake(24.0, 15.0)]),
        highlightedArrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-right-arrow-highlighted.png" size:CGSizeMake(24.0, 15.0)]),
        disabledArrowColor = PatternColor([_CPCibCustomResource imageResourceWithName:"scroller-right-arrow-disabled.png" size:CGSizeMake(24.0, 15.0)]);

    [scroller setValue:CGSizeMake(24.0, 15.0) forThemeAttribute:@"increment-line-size"];
    [scroller setValue:arrowColor forThemeAttribute:@"increment-line-color"];
    [scroller setValue:highlightedArrowColor forThemeAttribute:@"increment-line-color" inState:CPThemeStateHighlighted];
    [scroller setValue:disabledArrowColor forThemeAttribute:@"increment-line-color" inState:CPThemeStateDisabled];
    
    var knobColor = PatternColor([[CPThreePartImage alloc] initWithImageSlices:
            [
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-left.png" size:CGSizeMake(10.0, 15.0)],
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-center.png" size:CGSizeMake(1.0, 15.0)],
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-right.png" size:CGSizeMake(10.0, 15.0)]
            ]
        isVertical:NO]);

    var knobDisabledColor = PatternColor([[CPThreePartImage alloc] initWithImageSlices:
            [
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-disabled-left.png" size:CGSizeMake(10.0, 15.0)],
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-disabled-center.png" size:CGSizeMake(1.0, 15.0)],
                [_CPCibCustomResource imageResourceWithName:"scroller-horizontal-knob-disabled-right.png" size:CGSizeMake(10.0, 15.0)]
            ]
        isVertical:NO]);

    [scroller setValue:knobColor forThemeAttribute:@"knob-color"];
    [scroller setValue:knobDisabledColor forThemeAttribute:@"knob-color" inState:CPThemeStateDisabled];

    [scroller setFloatValue:0.1];
    [scroller setKnobProportion:0.5];

    return scroller;
}*/

@end
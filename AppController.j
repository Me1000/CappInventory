saveAppData = function(){[[CPApp delegate] serialize];};

/*
 * AppController.j
 * Inventory
 *
 * Created by You on May 9, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

// import the stuff flatten takes out
@import <AppKit/CPScrollView.j>

@import <Foundation/CPObject.j>
@import <MapKit/MapKit.j>
@import "CappuGeo/CPLocation.j"
@import "CappuGeo/CPLocationController.j"
@import "CappuGeo/CPDirections.j"
@import "CappuGeo/CPMapImage.j"
@import "CappuGeo/CPMapMarker.j"
@import "CappuGeo/CPMapView.j"

@import "LPMultiLineTextField.j"
@import "LPCardFlipController.j"

@import "SourceViewController.j"
@import "ItemView.j"
@import "ItemViewController.j"
@import "LocationView.j"
@import "LocationEditView.j"
@import "NoLocationView.j"
@import "Location.j"
@import "LocationController.j"
@import "Item.j"
@import "ItemController.j"
@import "ItemAttachment.j"
@import "RLOfflineLocalStorage.j"
@import "RLOfflineDatabaseStore.j"
@import "RLMapView.j"

@import "NATokenTextView.j"
@import "Stepper.j"
@import "DatePicker.j"
@import "CPDate+Additions.j"

@import "DeepDropFileUpload/DCFileDropController.j"
@import "DeepDropFileUpload/DCFileUploadManager.j"
@import "MediaView.j"

@implementation AppController : CPObject
{
    CPSplitView outsideSplitView;
    id          sourceViewController @accessors;
    CPArray     allLocations @accessors;
    CPWindow    mainWindow;
    CPToolbar   mainToolbar @accessors;
    CPUndoManager undoManager @accessors;

    id          locationController @accessors;

    // create Location controls
    CPTextField newLocationTitle;
    CPPopUpButton newLocationType;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    allLocations = [ ];
    undoManager = [[RLUndoManager alloc] init];
    [undoManager setDelegate:self];

    mainWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(50, 75, 1100, 650) styleMask:CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask];
    var contentView = [mainWindow contentView];

    [mainWindow setFullBridge:YES];

    outsideSplitView = [[CPSplitView alloc] initWithFrame:[contentView bounds]];
    [outsideSplitView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [outsideSplitView setDelegate:self];
    [outsideSplitView setIsPaneSplitter:YES];

    // The outside SplitView has two subviews, the sourceContainer and the details view

    var detailsView = [[CPView alloc] initWithFrame:CGRectMake(0,0,500, CGRectGetHeight([contentView bounds]))];
    [detailsView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    locationController = [[LocationController alloc] initWithContentView:detailsView];


    var sourceViewContainer = [[CPView alloc] initWithFrame:CGRectMake(0, 0, 230, CGRectGetHeight([contentView bounds]))];
    [outsideSplitView addSubview:sourceViewContainer];
    [outsideSplitView addSubview:detailsView];

    sourceViewController = [[SourceViewController alloc] initWithContainerView:sourceViewContainer];

    [outsideSplitView setVertical:YES];
    [outsideSplitView setPosition:230 ofDividerAtIndex:0];

    [contentView addSubview:outsideSplitView];
    [mainWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
     var mainMenu = [CPApp mainMenu],
         editMenuItem = [[CPMenuItem alloc] initWithTitle:@"Edit" action:nil keyEquivalent:nil],
         editMenu = [[CPMenu alloc] initWithTitle:@"Edit"],
         undoItem = [[CPMenuItem alloc] initWithTitle:@"Undo" action:@selector(undo) keyEquivalent:"z"],
         redoItem = [[CPMenuItem alloc] initWithTitle:@"Redo" action:@selector(redo) keyEquivalent:"Z"],
         saveItem = [[CPMenuItem alloc] initWithTitle:@"Save" action:@selector(serialize) keyEquivalent:"s"],
         openItem = [[CPMenuItem alloc] initWithTitle:@"Open" action:@selector(load) keyEquivalent:"o"];

//    [[CPApp mainMenu] setAutoenablesItems:NO];
  //  [editMenu setAutoenablesItems:NO];

    [undoItem setTarget:undoManager];
    [redoItem setTarget:undoManager];
    [saveItem setTarget:self];
    [openItem setTarget:self];

    [editMenu addItem:undoItem];
    [editMenu addItem:redoItem];
    [editMenu addItem:saveItem];
    [editMenu addItem:openItem];

    [editMenuItem setSubmenu:editMenu];
    [editMenu _setMenuName:@"CPMainMenu"];
    //[[CPApp mainMenu] insertItem:editMenuItem atIndex:0];
    [CPApp setMainMenu:editMenu];

//    window.cpSetMainMenu(editMenu);

    [mainMenu removeAllItems];

//    [CPMenu setMenuBarVisible:YES];

    [self load];
    mainToolbar = [[CPToolbar alloc] initWithIdentifier:@"maintoolbar"];
    [mainToolbar setDelegate:self];
    [mainWindow setToolbar:mainToolbar];
    [mainToolbar validateVisibleItems];
}

- (void)confirmRemovalOfLocation:(Location)aLocation
{
    if (!aLocation)
        return;

    var removeLocationSheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0,400,120) styleMask:CPDocModalWindowMask],
        contentView = [removeLocationSheet contentView],
        header = [CPTextField labelWithTitle:@"Delete Location"];

    [header setFrame:CGRectMake(100,10, 415, 25)];
    [header setFont:[CPFont boldSystemFontOfSize:15]];
    [contentView addSubview:header];
    
    var headerImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"logoPlain.png"] size:CGSizeMake(68,68)];
    var headerImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20, 10, 68, 68)];
    [headerImageView setImage:headerImage];
    [contentView addSubview:headerImageView];
    
    var warningMessage = [[CPTextField alloc] initWithFrame:CGRectMake(100, 35, 325, 60)];
    [warningMessage setStringValue:@"Are you sure you want to remove this location? "];
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

    [CPApp beginSheet:removeLocationSheet modalForWindow:mainWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:aLocation];
}

- (void)addNewLocation:(id)sender
{
    var createLocationSheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0,400,150) styleMask:CPDocModalWindowMask],
        contentView = [createLocationSheet contentView],
        header = [CPTextField labelWithTitle:@"Add New Location"];

    [header setFrame:CGRectMake(100,10, 415, 25)];
    [header setFont:[CPFont boldSystemFontOfSize:15]];
    [contentView addSubview:header];
    
    var headerImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"logoPlain.png"] size:CGSizeMake(68,68)],
         headerImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20, 10, 68, 68)];

    [headerImageView setImage:headerImage];
    [contentView addSubview:headerImageView];

    var addButton = [[CPButton alloc] initWithFrame:CGRectMake(280, 115, 100, 24)];
    [addButton setTitle:@"Create"];
    [addButton setTag:1];
    [addButton setTarget:self];
    [addButton setAction:@selector(closeSheet:)];
    [contentView addSubview:addButton];
    [createLocationSheet setDefaultButton:addButton];
    
    var cancelButton = [[CPButton alloc] initWithFrame:CGRectMake(175, 115, 100, 24)];
    [cancelButton setTag:-1];
    [cancelButton setTitle:@"Cancel"];
    [cancelButton setTarget:self];
    [cancelButton setAction:@selector(closeSheet:)];
    [contentView addSubview:cancelButton];

    newLocationTitle = [[CPTextField alloc] initWithFrame:CGRectMake(100, 35, 287, 28)];
    [newLocationTitle setBezeled:YES];
    [newLocationTitle setEditable:YES];
    [newLocationTitle setPlaceholderString:@"Add new location"];
    [newLocationTitle setTarget:addButton];
    [newLocationTitle setAction:@selector(performClick:)];
	[newLocationTitle setLineBreakMode:CPLineBreakByWordWrapping];
    [contentView addSubview:newLocationTitle];

    newLocationType = [[CPPopUpButton alloc] initWithFrame:CGRectMake(105, 70, 200, 24)];
    [newLocationType setBordered:NO];
    [newLocationType setTitle:@"Select Type"];
    //[newLocationType addItemsWithTitles:[@"Select Type", @"Building", @"Computer", @"Safe", @"Car", @"Bank", @"Yard"]];
    [newLocationType addItems:[LocationItemTypes menuItems]];
    [contentView addSubview:newLocationType];

    [CPApp beginSheet:createLocationSheet modalForWindow:mainWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
    [createLocationSheet makeFirstResponder:newLocationTitle];
}

- (void)removeLocation:(Location)aLocation
{
    if (!aLocation)
        return;

    var localSuperLocation = [aLocation superLocation];
    if (localSuperLocation)
        [localSuperLocation removeSubLocation:aLocation];
    else
        [allLocations removeObject:aLocation];

    var sourceList = [sourceViewController sourceList];
    [sourceList reloadData];
    [sourceList _noteSelectionDidChange];
    [undoManager registerUndoWithTarget:self selector:@selector(addLocation:) object:aLocation];
}

- (void)addLocation:(Location)aLocation
{
//    var locationCopy = [aLocation copy];

    if ([aLocation superLocation])
        [[aLocation superLocation] addSubLocation:aLocation];
    else
        [allLocations addObject:aLocation];

    [undoManager registerUndoWithTarget:self selector:@selector(removeLocation:) object:aLocation];

    [[sourceViewController sourceList] reloadData];
}

- (void)moveItem:(Item)anItem fromLocation:(Location)aLocation to:(Location)anotherLocation
{
    [anotherLocation addItem:anItem];
    [aLocation removeItem:anItem];

    [[sourceViewController sourceList] reloadData];
    [[[locationController locationView] itemTableView] reloadData];
//    [[[locationController locationView] collectionView] setContent:[[locationController location] items]];
    [[[locationController locationView] collectionView] reloadContent];//setContent:[[locationController location] items]];

    var invoke = [CPInvocation invocationWithMethodSignature:@"MoveItem:FromLocation:to:"];
    [invoke setTarget:self];
    [invoke setSelector:@selector(moveItem:fromLocation:to:)];
    [invoke setArgument:anItem atIndex:2];
    [invoke setArgument:anotherLocation atIndex:3];
    [invoke setArgument:aLocation atIndex:4];

    [undoManager registerUndoWithTarget:invoke selector:@selector(invoke) object:nil];
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
            [self removeLocation:contextInfo];
            break;
        case 1: // create location
            var name = [newLocationTitle stringValue];

            if (!name)
            {
                alert("You gotta enter a name for this location dude!");
                return;
            }

            var item = [[Location alloc] initWithName:[newLocationTitle stringValue]];
            [item setType:([newLocationType titleOfSelectedItem] || "")];
            [self addLocation:item];
            break;
    }
}

-(CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
    return [CPToolbarFlexibleSpaceItemIdentifier, CPToolbarSeparatorItemIdentifier, CPToolbarSpaceItemIdentifier, @"searchfield", @"newItem", @"newLocation", @"undo", @"redo"];
}

-(CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
    return [@"newItem", @"newLocation", CPToolbarSeparatorItemIdentifier, @"undo", @"redo", CPToolbarFlexibleSpaceItemIdentifier, @"searchfield"];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    var mainBundle = [CPBundle mainBundle],
        toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:itemIdentifier];

    [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityHigh];

    switch(itemIdentifier)
    {
        case @"newItem":
            /*var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"itemIcon.png"] size:CPSizeMake(32, 32)],
                highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"itemIcon.png"] size:CPSizeMake(32, 32)];
                
            [toolbarItem setImage:image];
            [toolbarItem setAlternateImage:highlighted];

            [toolbarItem setTarget:self];
            [toolbarItem setAction:@selector(newItem:)];
            [toolbarItem setLabel:"New Item"];
            [toolbarItem setTag:@"NewItem"];
            
            [toolbarItem setMinSize:CGSizeMake(32, 32)];
            [toolbarItem setMaxSize:CGSizeMake(32, 32)];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityLow];*/
            var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"itemIcon.png"] size:CPSizeMake(32, 32)],
                highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"itemIcon.png"] size:CPSizeMake(32, 32)];
                
            [toolbarItem setImage:image];
            [toolbarItem setAlternateImage:highlighted];
            
            [toolbarItem setTarget:locationController];
            [toolbarItem setAction:@selector(addNewItem:)];
            [toolbarItem setLabel:"New Item"];
            [toolbarItem setTag:@"NewItem"];
            
            [toolbarItem setMinSize:CGSizeMake(32, 32)];
            [toolbarItem setMaxSize:CGSizeMake(32, 32)];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityLow];
        break;

        case @"newLocation":
            var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"SignPost.png"] size:CPSizeMake(32, 32)],
                highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"SignPost.png"] size:CPSizeMake(32, 32)];
                
            [toolbarItem setImage:image];
            [toolbarItem setAlternateImage:highlighted];
            
            [toolbarItem setTarget:self];
            [toolbarItem setAction:@selector(addNewLocation:)];
            [toolbarItem setLabel:"New Location"];
            [toolbarItem setTag:@"NewLocation"];
            
            [toolbarItem setMinSize:CGSizeMake(32, 32)];
            [toolbarItem setMaxSize:CGSizeMake(32, 32)];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityLow];
        break;

        case @"searchfield":
            var searchField = [[CPSearchField alloc] initWithFrame:CGRectMake(0, 10, 140, 30)];
            [searchField setTarget:self];
            [searchField setAction:@selector(searchFieldDidChange:)];
            [searchField setSendsSearchStringImmediately:YES];

            [toolbarItem setView:searchField];
            [toolbarItem setLabel:@"Search Items"];
            [toolbarItem setTag:@"SearchItems"];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityHigh];
            
            [toolbarItem setMinSize:CGSizeMake(200, 30)];
            [toolbarItem setMaxSize:CGSizeMake(200, 30)];
        break;

        case @"undo":
            var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"undo.png"] size:CPSizeMake(32, 32)],
                highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"undo.png"] size:CPSizeMake(32, 32)];
                
            [toolbarItem setImage:image];
            [toolbarItem setAlternateImage:highlighted];
            
            [toolbarItem setTarget:undoManager];
            [toolbarItem setAction:@selector(undo)];
            [toolbarItem setLabel:"Undo"];
            [toolbarItem setTag:@"Undo"];
            
            [toolbarItem setMinSize:CGSizeMake(32, 32)];
            [toolbarItem setMaxSize:CGSizeMake(32, 32)];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityLow];
        break;

        case @"redo":
            var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"redo.png"] size:CPSizeMake(32, 32)],
                highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"redo.png"] size:CPSizeMake(32, 32)];
                
            [toolbarItem setImage:image];
            [toolbarItem setAlternateImage:highlighted];
            
            [toolbarItem setTarget:undoManager];
            [toolbarItem setAction:@selector(redo)];
            [toolbarItem setLabel:"Redo"];
            [toolbarItem setTag:@"Redo"];
            
            [toolbarItem setMinSize:CGSizeMake(32, 32)];
            [toolbarItem setMaxSize:CGSizeMake(32, 32)];
            [toolbarItem setVisibilityPriority:CPToolbarItemVisibilityPriorityLow];
        break;
    }

    return toolbarItem;
}

- (BOOL)validateToolbarItem:(CPToolbarItem)anItem
{

//    var identifier = [anItem itemIdentifier];
        return YES;
}

- (CGFloat)splitView:(CPSplitView)splitView constrainMinCoordinate:(float)proposedMin ofSubviewAt:(int)dividerIndex
{
    return 140;
}

- (CGFloat)splitView:(CPSplitView)splitView constrainMaxCoordinate:(float)proposedMax ofSubviewAt:(int)dividerIndex
{
    return 400;
}

- (void)undoManagerStackDidChange:(id)sender
{
    [self serialize];

    // do it outside the runloop because of the way -canUundo and -canRedo work... 
    // basically they get pushed onto the group stack then when the loop ends, they're 
    // pushed onto the main undo/redo stack, thus the methods do not work at runtime w/o this hack
    window.setTimeout(function(){
        [mainToolbar validateVisibleItems];
    },0);
}

- (void)serialize
{
    //var blah = ["1","2","3"];
    var data = JSON.stringify(allLocations),
        storage = [[RLOfflineLocalStorage alloc] init];

    if ([RLOfflineLocalStorage offlineDataStoreIsAvailable])
        [storage setValue:data forKey:@"InventoryData"];
    else
    {
        alert("You're using a bad browser. Get one that supports local storage.");
        return;
    }
}

- (void)load
{
    //var data = '[{"name":"one","subLocations":[]},{"name":"two","subLocations":[{"name":"three","subLocations":[]},{"name":"four","subLocations":[{"name":"five","subLocations":[]}]}]}]';
    var storage = [[RLOfflineLocalStorage alloc] init];

    if ([RLOfflineLocalStorage offlineDataStoreIsAvailable])
        var data = [storage getValueForKey:@"InventoryData"];
    else
    {
        alert("You're using a bad browser. Get one that supports local storage.");
        return;
    }

    if (!data || data === "null")
    {
        //alert("No data to load.");
        return;
    }

    data = JSON.parse(data);

    allLocations = [ ]; // clear the array
    
    // now that we have the JSON we need to add each item of the tree... creating new object and shit.

    for (var i = 0; i < data.length; i++)
    {
        var item = [Location decodeJSON:data[i]];
        [allLocations addObject:item];
    }

    [[sourceViewController sourceList] reloadData];
}

@end

@implementation CPPopUpButton (drawing)
- (void)drawRect:(CGRect)aRect
{
    if ([self hasThemeState:CPThemeStateBordered])
        return;

    var context = [[CPGraphicsContext currentContext] graphicsPort];

    CGContextBeginPath(context);

    // Center, but crisp.
    CGContextTranslateCTM(context, FLOOR(CGRectGetWidth(aRect) - 19.0), 12);
    CGContextRotateCTM(context, PI);

    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 5.0, 0.0);
    CGContextAddLineToPoint(context, 2.5, 5);
    CGContextAddLineToPoint(context, 0.0, 0.0);

    CGContextClosePath(context);
    var color = [CPColor grayColor];
    
    CGContextSetFillColor(context, color);
    CGContextFillPath(context);

    CGContextTranslateCTM(context, 5, -2.5);
    CGContextRotateCTM(context, PI);

    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 5.0, 0.0);
    CGContextAddLineToPoint(context, 2.5, 5);
    CGContextAddLineToPoint(context, 0.0, 0.0);

    CGContextClosePath(context);
    var color = [CPColor grayColor];
    
    CGContextSetFillColor(context, color);
    CGContextFillPath(context);
}
@end

@implementation CPMenu (additions)

- (void)removeAllItems
{
    return;
    for (var i = 0; i < [self numberOfItems]; i++)
        [self removeItemAtIndex:i];
}

@end

@implementation CPPopUpButton (additions)
- (void)addItems:(CPArray)items
{
    for (var i = 0; i < items.length; i++)
        [self addItem:items[i]];
}
@end

@implementation LocationItemTypes : CPObject
{
}

+ (CPArray)menuItems
{
    var items = [],
        bundle = [CPBundle mainBundle],
        item = [[CPMenuItem alloc] initWithTitle:@"Building" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Building"]];
    [items addObject:item];

    item = [[CPMenuItem alloc] initWithTitle:@"Computer" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Computer"]];
    [items addObject:item];

    item = [[CPMenuItem alloc] initWithTitle:@"Safe" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Safe"]];
    [items addObject:item];

    item = [[CPMenuItem alloc] initWithTitle:@"Car" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Car"]];
    [items addObject:item];

    item = [[CPMenuItem alloc] initWithTitle:@"Bank" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Bank"]];
    [items addObject:item];

    item = [[CPMenuItem alloc] initWithTitle:@"Yard" action:nil keyEquivalent:nil];
    [item setImage:[[self class] imageForItemWithTitle:@"Yard"]];
    [items addObject:item];

    return items;
}

+ (CPImage)imageForItemWithTitle:(CPString)aTitle
{
    var bundle = [CPBundle mainBundle];

    switch (aTitle)
    {
        case "Building":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"building.png"] size:CGSizeMake(16,16)];
            break;

        case "Computer":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"computer.png"] size:CGSizeMake(16,16)];
            break;

        case "Safe":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"safe.png"] size:CGSizeMake(16,16)];
            break;

        case "Car":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"car.png"] size:CGSizeMake(16,16)];
            break;

        case "Bank":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"bank.png"] size:CGSizeMake(16,16)];
            break;

        case "Yard":
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yard.png"] size:CGSizeMake(16,16)];
            break;

        default:
            return [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"SignPost.png"] size:CGSizeMake(20,20)];
            break;
    }
}

@end

@implementation RLUndoManager : CPUndoManager
{
    id delegate @accessors;
}

- (id)init
{
    self = [super init]

    if (self)
        delegate = nil

    return self;
}

- (void)registerUndoWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anObject
{
    [super registerUndoWithTarget:aTarget selector:aSelector object:anObject];

    if ([delegate respondsToSelector:@selector(undoManagerStackDidChange:)])
        [delegate undoManagerStackDidChange:self];
}

- (BOOL)validateToolbarItem:(CPToolbarItem)anItem
{
    var identifier = [anItem itemIdentifier];

    if (identifier === "undo")
        return [self canUndo];
    else if (identifier === "redo")
        return [self canRedo];
}
@end

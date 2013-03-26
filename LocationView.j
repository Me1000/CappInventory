@implementation LocationView : CPView
{
    id                  viewController @accessors;
    CPShadowView        shadowView @accessors;

    CPView              contain;

    CPTextField         locationTitle;
    CPSegmentedControl  viewSwitcher;

    CPScrollView        itemScrollView;
    CPTableView         itemTableView @accessors;

    CPScrollView        itemViewScrollView;
    ItemView            itemView @accessors;

    

    CPTextField         noItemsView;

    CPView              topView;
    CPView              gradientOverlay;

    CPButton            editButton @accessors;
    CPButton            uploadButton @accessors;
    CPButton            deleteButton @accessors;
    CPButton            backToItemsButton;

    CPScrollView        collectionViewScrollView;
    CPScrollView        collectionView @accessors;

    CPViewAnimation     animation;
}

- (id)initWithFrame:(CGRect)aFrame andController:(id)aController
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        viewController = aController;

        //newParentView = [[CPView alloc] initWithFrame:frame];
        //var colorImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"content-background.png"] size:CGSizeMake(159,159)];]
        locationTitle = [CPTextField new];
        [locationTitle setFrameOrigin:CGPointMake(50, 15)];
        [locationTitle setFont:[CPFont boldSystemFontOfSize:32]];
        [locationTitle setTextColor:[CPColor whiteColor]];
        [locationTitle setValue:CGSizeMake(1.0, 1.0) forThemeAttribute:@"text-shadow-offset"];
        [locationTitle setValue:[CPColor colorWithCalibratedWhite:0.0/255.0 alpha:0.9] forThemeAttribute:@"text-shadow-color"];
        [locationTitle setStringValue:@"My Location"];
        [locationTitle sizeToFit];
        [self addSubview:locationTitle];

        var bundle = [CPBundle mainBundle];
        viewSwitcher = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(aFrame.size.width - 88, 28, 0, 24)];
        [viewSwitcher setAutoresizingMask:CPViewMinXMargin|CPViewMaxYMargin];
        [viewSwitcher setSegmentCount:2];
        [viewSwitcher setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"list-view.png"] size:CGSizeMake(15, 15)] forSegment:0];
        [viewSwitcher setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"grid-view.png"] size:CGSizeMake(15, 15)] forSegment:1];
        [viewSwitcher setWidth:37 forSegment:0];
        [viewSwitcher setWidth:37 forSegment:1];
        [viewSwitcher setSelectedSegment:0];
        [viewSwitcher setTarget:self];
        [viewSwitcher setAction:@selector(switchViews:)];
        //[viewSwitcher setBackgroundColor:[CPColor redColor]];
        [self addSubview:viewSwitcher];


        // item table and stuff
        shadowView = [[CPShadowView alloc] initWithFrame:CGRectMakeZero()];
        [shadowView setWeight:CPHeavyShadow];
        [shadowView setFrameForContentFrame:CGRectMake(50,70,aFrame.size.width - 60, aFrame.size.height - 80)];
        [shadowView setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];
        [self addSubview:shadowView];

        contain = [[CPView alloc] initWithFrame:CGRectMake(50,70, aFrame.size.width - 60, aFrame.size.height - 80)];
        [contain setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        [self addSubview:contain];

        topArea = [[TopView alloc] initWithFrame:CGRectMake(225, 0, aFrame.size.width - 275, 44)];
        [topArea setBackgroundColor:[CPColor colorWithHexString:"f4f4f4"]];
        [topArea setAutoresizingMask:CPViewWidthSizable];
        [contain addSubview:topArea];

        itemScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 225,  aFrame.size.height - 80)];
        [itemScrollView setAutoresizingMask:CPViewHeightSizable];
        [itemScrollView setAutohidesScrollers:YES];
        [itemScrollView setVerticalScroller:[LocationController customVerticalScroller]];
        [itemScrollView setBackgroundColor:[CPColor whiteColor]];

        itemTableView = [[ItemViewTableView alloc] initWithFrame:CGRectMakeZero()];
        [itemTableView setBackgroundColor:[CPColor colorWithHexString:@"f8f8f8"]];
        [itemTableView setGridColor:[CPColor colorWithHexString:@"f0f0f0"]];
        [itemTableView setGridStyleMask:CPTableViewSolidHorizontalGridLineMask];
        [itemTableView setDelegate:viewController];
        [itemTableView setDataSource:viewController];
        [itemTableView setSelectionHighlightColor:[CPColor colorWithHexString:@"EEEEEE"]];
        [itemTableView setRowHeight:50];
        [itemTableView registerForDraggedTypes:[@"ItemDragType"]];

        var itemColumn = [[CPTableColumn alloc] initWithIdentifier:"Items"];
        [[itemColumn headerView] setStringValue:@"Items"];
        [itemColumn setWidth:210.0];
        [itemColumn setMinWidth:210.0];
        [itemColumn setDataView:[[ItemDataView alloc] initWithFrame:CGRectMake(0,0,210,50)]];


        [itemTableView addTableColumn:itemColumn];
        [itemScrollView setDocumentView:itemTableView];
        [contain addSubview:itemScrollView];
        

        // setup the item view
        gradientOverlay = [[CPView alloc] initWithFrame:CGRectMake(225,44, 550, 10)];
        [gradientOverlay setAutoresizingMask:CPViewWidthSizable];
        [gradientOverlay setBackgroundColor:[CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"itemScrollShadow.png"] size:CGSizeMake(10,10)]]];

        //itemViewScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(225, 44, 565, 481)];
        itemView = [[ItemView alloc] initWithFrame:CGRectMake(225, 44, aFrame.size.width - 265, aFrame.size.height - 124)];
        [itemView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        
        //[itemViewScrollView setDocumentView:itemView];
        //[itemViewScrollView setAutohidesScrollers:YES];

        //[itemViewScrollView setHasHorizontalScroller:NO];
        //[itemViewScrollView setBackgroundColor:[CPColor colorWithHexString:"f4f4f4"]];
        [itemView setLocationController:aController];
        [contain addSubview:itemView];
        [contain addSubview:gradientOverlay];

        editButton = [[CPButton alloc] initWithFrame:CGRectMake(520, 9, 30, 24)];
        var image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"editbutton.png"] size:CGSizeMake(18,18)];
        [editButton setImage:image];
        [editButton setTarget:itemView];
        [editButton setAction:@selector(toggleEditMode:)];
        [editButton setImagePosition:CPImageOnly];
        [editButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
        [editButton setHidden:YES];
        [topArea addSubview:editButton];

        uploadButton = [[CPButton alloc] initWithFrame:CGRectMake(480, 9, 30, 24)];
        [uploadButton setTitle:"\u21E7"];

    //    var image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"uploadButton.png"] size:CGSizeMake(18,18)];
  //      [editButton setImage:image];
        [uploadButton setTarget:itemView];
        [uploadButton setAction:@selector(uploadAttachment:)];
//        [editButton setImagePosition:CPImageOnly];
        [uploadButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
        [uploadButton setHidden:YES];
        [topArea addSubview:uploadButton];


        deleteButton = [[CPButton alloc] initWithFrame:CGRectMake(440, 9, 30, 24)];
        var image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"deletebutton.png"] size:CGSizeMake(14,18)];
        [deleteButton setImage:image];
        [deleteButton setTarget:self];
        [deleteButton setAction:@selector(deleteItemPushed:)];
        [deleteButton setImagePosition:CPImageOnly];
        [deleteButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
        [deleteButton setHidden:YES];
        [topArea addSubview:deleteButton];

        [self showNoItemsView];
    }

    return self;
}

- (void)setLocationTitle:(CPString)aTitle
{
    [locationTitle setStringValue:aTitle];
    [locationTitle sizeToFit];
}

- (void)resizeWithOldSuperviewSize:(CGSize)aSize
{
    //[super resizeWithOldSuperviewSize:aSize];

    var size = [[self superview] frameSize],
        newSize = CGSizeMake(MAX(size.width - 50, 845), MAX(size.height - 50, 600));

    [self setFrameSize:newSize];
}

- (void)setActiveItem:(Item)anItem
{
    [[viewController itemController] setItem:anItem];

    if (!anItem)
        [itemTableView selectRowIndexes:[CPIndexSet indexSet] byExtendingSelection:NO];
}

- (void)showNoItemsView
{
    if (!noItemsView)
    {
        noItemsView = [CPTextField new];
        [noItemsView setStringValue:@"No Items"];
        [noItemsView setFont:[CPFont boldSystemFontOfSize:14]];
        [noItemsView setTextColor:[CPColor colorWithHexString:@"666666"]];
        [noItemsView setTextShadowColor:[CPColor whiteColor]];
        [noItemsView setTextShadowOffset:CGSizeMake(0,2)];
        [noItemsView sizeToFit];
        var centerRect = [self convertRect:[itemTableView rectOfRow:4] fromView:itemTableView];
//        [noItemsView setCenter:];
        [noItemsView setCenter:CGPointMake(CGRectGetMidX(centerRect), CGRectGetMidY(centerRect))];
    }

    [self addSubview:noItemsView];
}

- (void)hideNoItemsView
{
    [noItemsView removeFromSuperview];
}

- (void)deleteItemPushed:(id)sender
{
    var item = [[viewController location] itemAtIndex:[[itemTableView selectedRowIndexes] firstIndex]];
    [viewController confirmRemovalOfItem:item];
}

- (void)switchViews:(id)sender
{
    var view = [sender selectedSegment];

    if (view === 0)
    {
        [collectionViewScrollView removeFromSuperview];
        [contain addSubview:itemScrollView];
        [topArea setFrame:CGRectMake(225,0,565,44)];
        [itemViewScrollView setFrameOrigin:CGPointMake(225, 44)];
        [backToItemsButton removeFromSuperview];
        [itemView setWidth:565];
        [gradientOverlay setFrame:CGRectMake(225,44, 550, 10)];
        [contain addSubview:gradientOverlay];
    }
    else
    {
        [itemScrollView removeFromSuperview];

        [topArea setFrame:CGRectMake(790,0,790,44)];

        var frame = [itemView frame];

        [itemView setFrame:CGRectMake(790, frame.origin.y, 790, 481)];
        [itemView setWidth:775];


        if (!backToItemsButton)
        {
            backToItemsButton = [[CPButton alloc] initWithFrame:CGRectMake(15, 9, 70, 24)];
            [backToItemsButton setTitle:@"Back"];
            [backToItemsButton setAction:@selector(animateToCollectionView:)];
            [backToItemsButton setTarget:self];
        }
        [topArea addSubview:backToItemsButton];

        if (!collectionViewScrollView)
        {

            collectionViewScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 790, 525)];
            [collectionViewScrollView setHasHorizontalScroller:NO];
            [collectionViewScrollView setAutohidesScrollers:YES];
            //[collectionViewScrollView setHorizontalLineScroll:0.0];

            var item = [[CPCollectionViewItem alloc] init];
	        [item setView:[[ItemCell alloc] initWithFrame:CGRectMakeZero()]];

            collectionView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, 775, 510)];
 	        [collectionView setMinItemSize:CGSizeMake(131, 155)];
 	        [collectionView setMaxItemSize:CGSizeMake(131, 155)];
 	        [collectionView setVerticalMargin:3];
 	        [collectionView setDelegate:self];
	        [collectionView setItemPrototype:item];
	        [collectionViewScrollView setBackgroundColor:[CPColor colorWithHexString:@"EEEEEE"]];
            [collectionView setAllowsMultipleSelection:YES];
            [collectionViewScrollView setDocumentView:collectionView];

	       [collectionView setContent:[[viewController location] items]];

        }

        [itemView enterEditMode:NO];
        [collectionViewScrollView setFrameOrigin:CGPointMake(0,0)];
        [contain addSubview:collectionViewScrollView];
        [gradientOverlay setFrame:CGRectMake(0,44, 775, 10)];
        [gradientOverlay removeFromSuperview];
    }
}

- (void)collectionView:(CPCollectionView)aView didDoubleClickOnItemAtIndex:(int)index
{

    if ([animation isAnimating])
        return;

    [itemTableView selectRowIndexes:[CPIndexSet indexSetWithIndex:index] byExtendingSelection:NO];

    var frame = [collectionViewScrollView frame],
        frame2 = [itemView frame],
        frame3 = [topArea frame],
        targetFrame = CGRectMake(frame.origin.x - frame.size.width, frame.origin.y, frame.size.width, frame.size.height),
        targetFrame2 = CGRectMake(frame.origin.x, frame2.origin.y, frame2.size.width, frame2.size.height),
        targetFrame3 = CGRectMake(frame.origin.x, frame3.origin.y, frame3.size.width, frame3.size.height);


    var animationDict = [CPDictionary new];
    [animationDict setValue:collectionViewScrollView forKey:CPViewAnimationTargetKey];
    [animationDict setValue:frame forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:targetFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:nil forKey:CPViewAnimationEffectKey];

    var animationDict2 = [CPDictionary new];
    [animationDict2 setValue:itemView forKey:CPViewAnimationTargetKey];
    [animationDict2 setValue:frame2 forKey:CPViewAnimationStartFrameKey];
    [animationDict2 setValue:targetFrame2 forKey:CPViewAnimationEndFrameKey];
    [animationDict2 setValue:nil forKey:CPViewAnimationEffectKey];

    var animationDict3 = [CPDictionary new];
    [animationDict3 setValue:topArea forKey:CPViewAnimationTargetKey];
    [animationDict3 setValue:frame3 forKey:CPViewAnimationStartFrameKey];
    [animationDict3 setValue:targetFrame3 forKey:CPViewAnimationEndFrameKey];
    [animationDict3 setValue:nil forKey:CPViewAnimationEffectKey];

    animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict, animationDict2, animationDict3]];
    [animation setDuration:.3];

    [animation setDelegate:self];
    [animation startAnimation];

    window.setTimeout(function(){
        //[contain addSubview:gradientOverlay];
    },1);
}

- (void)animateToCollectionView:(id)sender
{
    if ([animation isAnimating])
        return;

    var frame = [collectionViewScrollView frame],
    frame2 = [itemView frame],
    frame3 = [topArea frame],
    targetFrame = CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, frame.size.width, frame.size.height),
    targetFrame2 = CGRectMake(840, frame2.origin.y, 790, 481),
    targetFrame3 = CGRectMake(840,frame3.origin.y,790,44);
        

    var animationDict = [CPDictionary new];
    [animationDict setValue:collectionViewScrollView forKey:CPViewAnimationTargetKey];
    [animationDict setValue:frame forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:targetFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:nil forKey:CPViewAnimationEffectKey];

    var animationDict2 = [CPDictionary new];
    [animationDict2 setValue:itemView forKey:CPViewAnimationTargetKey];
    [animationDict2 setValue:frame2 forKey:CPViewAnimationStartFrameKey];
    [animationDict2 setValue:targetFrame2 forKey:CPViewAnimationEndFrameKey];
    [animationDict2 setValue:nil forKey:CPViewAnimationEffectKey];

    var animationDict3 = [CPDictionary new];
    [animationDict3 setValue:topArea forKey:CPViewAnimationTargetKey];
    [animationDict3 setValue:frame3 forKey:CPViewAnimationStartFrameKey];
    [animationDict3 setValue:targetFrame3 forKey:CPViewAnimationEndFrameKey];
    [animationDict3 setValue:nil forKey:CPViewAnimationEffectKey];

    animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict, animationDict2, animationDict3]];
    [animation setDuration:.3];

    [animation setDelegate:self];
    [animation startAnimation];
    [gradientOverlay removeFromSuperview];
}

- (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
    return ["ItemDragType"];
}

- (CPData)collectionView:(CPCollectionView)aCollectionView dataForItemsAtIndexes:(CPIndexSet)indices forType:(CPString)aType
{
    return [CPKeyedArchiver archivedDataWithRootObject:indices];
}

- (BOOL)collectionView:(CPCollectionView)aView shouldDeleteItemsAtIndexes:(CPIndexSet)indicies
{
    return NO;
}

@end

@implementation ItemDataView : CPView
{
    CPTextField itemName;
    CPTextField itemMaker;
    CPImageView attachments;
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        itemName = [[CPTextField alloc] initWithFrame:CGRectMake(8, 3, aFrame.size.width - 45, 20)];
        [itemName setTextColor:[CPColor colorWithHexString:@"4c4c4c"]];
        [itemName setTextShadowColor:[CPColor whiteColor]];
        [itemName setTextShadowOffset:CGSizeMake(0,1)];
        [itemName setFont:[CPFont boldSystemFontOfSize:16]];
        [self addSubview:itemName];

        itemMaker = [[CPTextField alloc] initWithFrame:CGRectMake(8, 22, aFrame.size.width - 45, 20)];
        [itemMaker setTextColor:[CPColor colorWithHexString:@"555555"]];
        [itemMaker setFont:[CPFont systemFontOfSize:12]];
        [self addSubview:itemMaker];

        attachments = [[CPImageView alloc] initWithFrame:CGRectMake(aFrame.size.width - 25, 5, 22, 23)];
        [attachments setImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"Attachments/Attachment.png"] size:CGSizeMake(22, 23)]];
        [self addSubview:attachments];
    }

    return self;
}

- (void)setObjectValue:(CPDictionary)aValue
{
    [itemName setStringValue:[aValue valueForKey:@"name"]];
    [itemMaker setStringValue:[aValue valueForKey:@"maker"]];
    [attachments setHidden:![aValue valueForKey:@"attachments"]];
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [aCoder encodeObject:itemName forKey:@"ItemName"];
    [aCoder encodeObject:itemMaker forKey:@"ItemMaker"];
    [aCoder encodeObject:attachments forKey:@"Attachments"];

    [super encodeWithCoder:aCoder];
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];

    if (self)
    {
        itemName = [aCoder decodeObjectForKey:@"ItemName"];
        itemMaker = [aCoder decodeObjectForKey:@"ItemMaker"];
        attachments = [aCoder decodeObjectForKey:@"Attachments"];
    }

    return self;
}

@end


@implementation ItemViewTableView : CPTableView
- (CPMenu)menuForEvent:(CPEvent)anEvent
{
    var contextMenu = [[CPMenu alloc] initWithTitle:@""],
        removeItem  = [[CPMenuItem alloc] initWithTitle:@"Remove Item" action:@selector(removeItem:) keyEquivalent:nil],
        addItem     = [[CPMenuItem alloc] initWithTitle:@"Add Item" action:@selector(addNewItem:) keyEquivalent:nil],
        viewItem    = [[CPMenuItem alloc] initWithTitle:@"View Item" action:@selector(newSelectRow:) keyEquivalent:nil],
        point       = [self convertPoint:[anEvent locationInWindow] fromView:nil],
        row         = [self rowAtPoint:point];

    [removeItem setTarget:self];
    [addItem setTarget:[self delegate]];
    [viewItem setTarget:self];
    [removeItem setRepresentedObject:row];
    [viewItem   setRepresentedObject:row];


    if (row < 0)
    {
        [removeItem setEnabled:NO];
        [viewItem setEnabled:NO];
    }

    [contextMenu addItem:removeItem];
    [contextMenu addItem:viewItem];
    [contextMenu addItem:addItem];

    return contextMenu;
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
    var item = [[[self delegate] location] itemAtIndex:[sender representedObject]];
    [[self delegate] confirmRemovalOfItem:item];
}
@end

@implementation ItemCell : CPView
{
	CPTextField name;
    CPTextField make;
    CPImageView image;
    CPView      borderOverlay;

    CPColor bgColor;
    CPColor selectedBGColor;
}

- (void)setRepresentedObject:(id)anObject
{
    if (!borderOverlay)
    {
        var bundle = [CPBundle mainBundle];
        bgColor = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
                      [
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-0.png"] size:CGSizeMake(5.0, 5.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-1.png"] size:CGSizeMake(1.0, 5.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-2.png"] size:CGSizeMake(5.0, 5.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-3.png"] size:CGSizeMake(5.0, 2.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-4.png"] size:CGSizeMake(2.0, 2.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-5.png"] size:CGSizeMake(5.0, 5.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-6.png"] size:CGSizeMake(5.0, 5.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-7.png"] size:CGSizeMake(1.0, 5.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-8.png"] size:CGSizeMake(5.0, 5.0)]
                      ]]];

        borderOverlay = [[CPView alloc] initWithFrame:CGRectMake(5, 5, 121, 121)];
        [borderOverlay setBackgroundColor:bgColor];

        image = [[CPImageView alloc] initWithFrame:CGRectMake(5,5,121,121)];
        [image setImageScaling:CPScaleNone];
        [self addSubview:image];

        [self addSubview:borderOverlay];

        name = [[CPTextField alloc] initWithFrame:CGRectMake(5,126,121, 24)];
        [name setFont:[CPFont boldSystemFontOfSize:13]];
        [name setTextShadowColor:[CPColor whiteColor]];
        [name setTextShadowOffset:CGSizeMake(0,1)];
        [name setAlignment:CPCenterTextAlignment];
        [self addSubview:name];

        make = [[CPTextField alloc] initWithFrame:CGRectMake(5,140,121, 24)];
        [make setFont:[CPFont systemFontOfSize:11]];
        [make setTextShadowColor:[CPColor whiteColor]];
        [make setTextShadowOffset:CGSizeMake(0,1)];
        [make setAlignment:CPCenterTextAlignment];
        [self addSubview:make];
    }
        [image setImage:[[CPImage alloc] initWithContentsOfFile:@"Resources/ItemCellView/iPhone-test-image.png" size:[self scaleImageWithSize:CGSizeMake(578,397)]]];
        [make setStringValue:[anObject make]];
        [name setStringValue:[anObject name]];
}

- (void)setSelected:(BOOL)isSelected
{
	var bundle = [CPBundle mainBundle];

    if (!selectedBGColor)
    {
         selectedBGColor = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
                      [
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-0.png"] size:CGSizeMake(9.0, 9.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-1.png"] size:CGSizeMake(2.0, 9.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-2.png"] size:CGSizeMake(8.0, 9.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-3.png"] size:CGSizeMake(9.0, 2.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-4.png"] size:CGSizeMake(2.0, 2.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-5.png"] size:CGSizeMake(8.0, 2.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-6.png"] size:CGSizeMake(9.0, 9.0)], 
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-7.png"] size:CGSizeMake(2.0, 9.0)],
                          [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"ItemCellView/ItemView-selected-8.png"] size:CGSizeMake(8.0, 9.0)]
                      ]]];
    }


    if (isSelected)
        [borderOverlay setBackgroundColor:selectedBGColor];
    else
        [borderOverlay setBackgroundColor:bgColor];
}

- (CGSize)scaleImageWithSize:(CGSize)aSize
{
    var constrain = 121,
        height = aSize.height,
        width = aSize.width,
        ratio = MAX( constrain / width, constrain / height );

    width = ratio * width;
    height = ratio * height;

    return CGSizeMake(width, height);
}
@end

@implementation TopView : CPView
-(void)drawRect:(id)aRect
{
    var context = [[CPGraphicsContext currentContext] graphicsPort];

    CGContextSetStrokeColor(context, [CPColor colorWithHexString:@"CCCCCC"]);

    var points = [
                    CGPointMake(15, 43.5), 
                    CGPointMake(aRect.size.width - 30, 43.5)
                 ];

    CGContextStrokeLineSegments(context, points, 2);
}
@end

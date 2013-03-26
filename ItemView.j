@implementation ItemView : CPView
{
    int MINHEIGHT;
    id  locationController @accessors;
    id  itemController @accessors;
    BOOL isEditing @accessors;

    ItemContentView itemContentView;
    CPScrollView scrollView;

    MainItemView mainItemImage;
    CPTextField nameField @accessors;
    CPTextField makeField;
    CPTextField modelField;
    CPTextField priceField;
    CPTextField serialField;
    DatePicker  dateAcquiredField;
    CPButton    clearDateButton;
    CPTextField dateAcquiredTextField;
    NATokenFieldView tagsField;
    CPTextField tagsUnedited;
    CPTextField notesLabel;
    CPArray tagsArray;
    CPTextField notesField;

    CPDictionary extrasLabels;
    CPDictionary extrasFields;
    CPDictionary removeExtraFieldButtons;
    CPButton     addExtraFieldButton;

    NAMenu      _completionMenu;
    CPView      noItemView;

    CPTextField newFieldPrompt;
    CPButton    createNewFieldButton;

    CPScrollView attachmentsScrollView;
    CPCollectionView attachmentsCollectionView;

    DCFileUpload mainImageUpload @accessors;

}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
	
    if (self)
    {
        MINHEIGHT = aFrame.size.height - 100;

        [self setBackgroundColor:[CPColor colorWithHexString:"f4f4f4"]];
        tagsArray =  [ ];

        scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0,0,aFrame.size.width,aFrame.size.height - 90)];
        itemContentView = [[ItemContentView alloc] initWithFrame:CGRectMake(0,0,aFrame.size.width - 20, aFrame.size.height - 100)];
        [scrollView setHasHorizontalScroller:NO];
        [scrollView setAutohidesScrollers:YES];
        [scrollView setDocumentView:itemContentView];
        [self addSubview:scrollView];


        [[DCFileUploadManager sharedManager] setDelegate:itemController];
        mainItemImage = [[MainItemView alloc] initWithFrame:CGRectMake(aFrame.size.width - 160, 10, 145, 145)];
        [mainItemImage setController:self];
        [itemContentView addSubview:mainItemImage];


        var nameLabel = [ItemView customLabelWithFrame:CGRectMake(15, 24, 65, 28)];
        [nameLabel setStringValue:"Name: "];
        [nameLabel sizeToFit];
        [itemContentView addSubview:nameLabel];
        nameField = [ItemView ItemViewTextField];
        [nameField setFrame:CGRectMake(CGRectGetMaxX([nameLabel frame]) + 5, 15, 275, 35)];
        [nameField setFont:[CPFont systemFontOfSize:24]];
        [itemContentView addSubview:nameField];

        var makeLabel = [ItemView customLabelWithFrame:CGRectMake(15, 64, 65, 28)];
        [makeLabel setStringValue:"Make: "];
        [makeLabel sizeToFit];
        [itemContentView addSubview:makeLabel];
        makeField = [ItemView ItemViewTextField];
        [makeField setFrame:CGRectMake(CGRectGetMaxX([nameLabel frame]) + 5, 60, 275, 28)];
        [makeField setFont:[CPFont systemFontOfSize:13]];
        [nameField setNextKeyView:makeField];
        [nameField setNextResponder:makeField];
        [itemContentView addSubview:makeField];

        var modelLabel = [ItemView customLabelWithFrame:CGRectMake(15, 124, 100, 28)];
        [modelLabel setStringValue:"Model: "];
        [itemContentView addSubview:modelLabel];
        modelField = [ItemView ItemViewTextField];
        [modelField setFrame:CGRectMake(115, 120, 275, 28)];
        [modelField setFont:[CPFont systemFontOfSize:13]];
        [itemContentView addSubview:modelField];

        var priceLabel = [ItemView customLabelWithFrame:CGRectMake(15, 154, 100, 28)];
        [priceLabel setStringValue:"Price: "];
        [itemContentView addSubview:priceLabel];
        priceField = [ItemView ItemViewTextField];
        [priceField setFrame:CGRectMake(115, 150, 275, 28)];
        [priceField setFont:[CPFont systemFontOfSize:13]];
        [itemContentView addSubview:priceField];

        var serialLabel = [ItemView customLabelWithFrame:CGRectMake(15, 184, 100, 28)];
        [serialLabel setStringValue:"Serial Number: "];
        [itemContentView addSubview:serialLabel];
        serialField = [ItemView ItemViewTextField];
        [serialField setFrame:CGRectMake(115, 180, 275, 28)];
        [serialField setFont:[CPFont systemFontOfSize:13]];
        [itemContentView addSubview:serialField];

        var dateAcquiredLabel = [ItemView customLabelWithFrame:CGRectMake(15, 214, 100, 28)];
        [dateAcquiredLabel setStringValue:"Date Acquired: "];
        [itemContentView addSubview:dateAcquiredLabel];
        dateAcquiredField = [[DatePicker alloc] initWithFrame:CGRectMake(115, 210, 215, 28)];
        [dateAcquiredField displayPreset:1];
        clearDateButton = [[CPButton alloc] initWithFrame:CGRectMake(340, 213, 50, 24)];
        [clearDateButton setTitle:"Clear"];
        [clearDateButton setTarget:self];
        [clearDateButton setAction:@selector(clearDate:)];
//        [itemContentView addSubview:dateAcquiredField];

        dateAcquiredTextField = [[CPTextField alloc] initWithFrame:CGRectMake(115, 214, 275, 28)];
        [itemContentView addSubview:dateAcquiredTextField];

        var tagsLabel = [ItemView customLabelWithFrame:CGRectMake(15, 244, 100, 28)];
        [tagsLabel setStringValue:"Tags: "];
        [itemContentView addSubview:tagsLabel];
        tagsField = [[NATokenTextView alloc] initWithFrame:CGRectMake(115, 240, 275, 28)];
        [tagsField setValue:[CPColor colorWithWhite:0.6 alpha:1.0] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];
        [tagsField setValue:CGInsetMakeZero() forThemeAttribute:@"bezel-inset" inState:CPThemeStateNormal];
        [tagsField setValue:CGInsetMake(-1.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateNormal];

        var bundle = [CPBundle mainBundle],
            textFieldBackgroundImage = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
                                        [
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-0.png"] size:CGSizeMake(11.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-1.png"] size:CGSizeMake(1.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-2.png"] size:CGSizeMake(11.0, 9.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-3.png"] size:CGSizeMake(11.0, 1.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-4.png"] size:CGSizeMake(1.0, 1.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-5.png"] size:CGSizeMake(11.0, 1.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-6.png"] size:CGSizeMake(11.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-7.png"] size:CGSizeMake(1.0, 9.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-8.png"] size:CGSizeMake(11.0, 9.0)]
                                        ]]],

            textFieldFocusedBackground = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
                                        [
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-0.png"] size:CGSizeMake(11.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-1.png"] size:CGSizeMake(1.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-2.png"] size:CGSizeMake(11.0, 9.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-3.png"] size:CGSizeMake(11.0, 1.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-4.png"] size:CGSizeMake(1.0, 1.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-5.png"] size:CGSizeMake(11.0, 1.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-6.png"] size:CGSizeMake(11.0, 9.0)], 
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-7.png"] size:CGSizeMake(1.0, 9.0)],
                                            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"TextField/textfield-focused-8.png"] size:CGSizeMake(11.0, 9.0)]
                                        ]]];

        [tagsField setValue:textFieldBackgroundImage forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled];
        [tagsField setValue:textFieldFocusedBackground forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled|CPThemeStateEditing];
        [tagsField setDelegate:self];
//        [itemContentView addSubview:tagsField];
        tagsUnedited = [[AutoExpandingTextField alloc] initWithFrame:CGRectMake(115, 240, 275, 28)];
		[tagsUnedited setValue:CGInsetMake(7.0, 10.0, 2.0, 10.0) forThemeAttribute:@"content-inset"];
		[tagsUnedited setLineBreakMode:CPLineBreakByWordWrapping];
		[itemContentView addSubview:tagsUnedited];

        notesLabel = [ItemView customLabelWithFrame:CGRectMake(15, 274, 100, 28)];
        [notesLabel setStringValue:"Notes: "];
        [itemContentView addSubview:notesLabel];
        notesField = [[AutoExpandingTextField alloc] init];//[LocationEditView customMultiLineTextField];
        [notesField setFrame:CGRectMake(115, 270, 275, 50)];
        [notesField setTextColor:[CPColor blackColor]];
        [notesField setEditable:NO];
        [notesField setBezeled:NO];
        [notesField setFont:[CPFont systemFontOfSize:13]];
        [notesField setDelegate:self];
        [notesField setValue:[CPColor colorWithWhite:0.6 alpha:1.0] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];
        [notesField setValue:CGInsetMakeZero() forThemeAttribute:@"bezel-inset" inState:CPThemeStateNormal];
        [notesField setValue:CGInsetMake(5.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateNormal];

        [notesField setValue:textFieldBackgroundImage forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled];
        [itemContentView addSubview:notesField];

        extrasLabels = [CPDictionary dictionary];
        extrasFields = [CPDictionary dictionary];
        removeExtraFieldButtons = [CPDictionary dictionary];

        addExtraFieldButton = [[CPButton alloc] initWithFrame:CGRectMake(17, 216, 12, 12)];
        [addExtraFieldButton setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"AddButton.png"] size:CGSizeMake(12,12)]];
        [addExtraFieldButton setAlternateImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"AddButtonP.png"] size:CGSizeMake(12,12)]];
        [addExtraFieldButton setBordered:NO];
        [addExtraFieldButton setTarget:self];
        [addExtraFieldButton setAction:@selector(promptAddExtraField:)];


        attachmentsScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, aFrame.size.height - 90, aFrame.size.width - 20, 90)];
//        [attachmentsScrollView setBackgroundColor:[CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Attachments/CollectionGradientBG.png"] size:CGSizeMake(484, 7)]]];
        [attachmentsScrollView setHasVerticalScroller:NO];
        [attachmentsScrollView setAutohidesScrollers:YES];
        [attachmentsScrollView setVerticalLineScroll:0.0001];
        [attachmentsScrollView setHorizontalScroller:[LocationController customHorizontalScroller]];
        [attachmentsScrollView setAutoresizingMask:CPViewWidthSizable|CPViewMinYMargin];

        attachmentsCollectionView = [[DropUploadCollectionView alloc] initWithFrame:CGRectMake(0, 0, aFrame.size.width - 20, 90)];

        var item = [[CPCollectionViewItem alloc] init];
        [item setView:[AttachmentCell new]];

        [attachmentsCollectionView setMinItemSize:CGSizeMake(80, 85)];
 	    [attachmentsCollectionView setMaxItemSize:CGSizeMake(80, 85)];
 	    [attachmentsCollectionView setVerticalMargin:5];
 	    [attachmentsCollectionView setDelegate:self];
	    [attachmentsCollectionView setItemPrototype:item];
        [attachmentsCollectionView setMaxNumberOfRows:1];
        [attachmentsCollectionView setAutoresizingMask:CPViewWidthSizable];

//	    [attachmentsCollectionView setBackgroundColor:[CPColor colorWithHexString:@"EEEEEE"]];
  //      [attachmentsCollectionView setAllowsMultipleSelection:YES];
//	    [attachmentsCollectionView setContent:["123", "456", "789", "123", "456", "789", "123", "456", "789", "123", "456", "789", "123", "456", "789", "123", "456", "end"]];
         // activate the view as a drop zone for uploads
        //Collection view drop view
        //dropCover = [[RLCollectionViewDropCover alloc] initWithFrame:CGRectMake(0, aFrame.size.height - 90, aFrame.size.width, 75)];
        //[dropCover setHidden:YES];

    // we timeout because the itemController isn't set until after this view is created
window.setTimeout(function(){
	    var fileDropUploadController = [[DCFileDropController alloc] initWithView:attachmentsCollectionView 
		                                                             dropDelegate:itemController 
		                                                                //uploadURL:[CPURL URLWithString:@"http://localhost:8888/upload.php"] 
                                                                        uploadURL:[CPURL URLWithString:@"http://timetableapp.com/TestingEnviro/Iguana/upload.php"]
		                                                            uploadManager:[DCFileUploadManager sharedManager]];

        [fileDropUploadController setValidFileTypes:["png","gif","jpg", "pdf"]];

},0);

        [attachmentsScrollView setDocumentView:attachmentsCollectionView];

        var shadowView = [[CPView alloc] initWithFrame:CGRectMake(0, aFrame.size.height - 90, aFrame.size.width, 11)];
        [shadowView setBackgroundColor:[CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"Attachments/CollectionShadow.png"] size:CGSizeMake(52,11)]]];
        [shadowView setAutoresizingMask:CPViewWidthSizable|CPViewMinYMargin];

        [self addSubview:attachmentsScrollView];

        [self addSubview:shadowView];

        noItemView = nil;
        [self setItem:nil];
    }

    return self;
}

- (void)setLocationController:(id)aController
{
    locationController = aController;
    [[DCFileUploadManager sharedManager] setDelegate:itemController];
}

- (void)setWidth:(int)aWidth
{
    var height = [itemContentView frame].size.height;
    [itemContentView setFrameSize:CGSizeMake(aWidth, height)];
}

- (void)setupEditViewsWithItem:(Item)anItem
{
    var itemExtras = [anItem extras],
        keys       = [itemExtras allKeys],
        y          = CGRectGetMaxY([notesField frame]) + 3,
        i          = 0;

    for (; i < [keys count]; i++)
    {
        var key   = keys[i],
            value = [itemExtras valueForKey:key];

        // create the label 
        var label = [ItemView customLabelWithFrame:CGRectMake(15, y + 4, 100, 28)];
        [label setStringValue:key + ": "];
        [extrasLabels setValue:label forKey:key];
        [itemContentView addSubview:label];

        // create the field
        var field = [ItemView ItemViewTextField];
        [field setFrame:CGRectMake(115, y, 275, 28)];
        [field setFont:[CPFont systemFontOfSize:13]];
        [field setStringValue:value];
        [extrasFields setValue:field forKey:key];
        [itemContentView addSubview:field];

        var button = [[CPButton alloc] initWithFrame:CGRectMake(3, y + 4, 12,12)],
            bundle = [CPBundle mainBundle];
        [button setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"MinusButton.png"] size:CGSizeMake(12,12)]];
        [button setAlternateImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"MinusButtonP.png"] size:CGSizeMake(12,12)]];
        [button setBordered:NO];
        [button setTarget:self];
        [button setAction:@selector(removeField:)];
        [button setTag:key];
        [removeExtraFieldButtons setValue:button forKey:key];

        y += 30;
    }
/*    [nameField setNextResponder:makeField];
    [makeField setNextResponder:nameField];

    [nameField setNextKeyView:makeField];
    [makeField setNextKeyView:nameField];*/
}

- (void)moveExtrasIntoPlace
{
    var keys = [extrasLabels allKeys],
        y    = CGRectGetMaxY([notesField frame]) + 3,
        i    = 0;

    for (; i < [keys count]; i++)
    {
        // move the label
        [itemContentView addSubview:[extrasLabels valueForKey:keys[i]]];
        [[extrasLabels valueForKey:keys[i]] setFrameOrigin:CGPointMake(15, y + 4)];

        // move the field
        [itemContentView addSubview:[extrasFields valueForKey:keys[i]]];
        [[extrasFields valueForKey:keys[i]] setFrameOrigin:CGPointMake(115, y)];

        // move the remove button
        [itemContentView addSubview:[removeExtraFieldButtons valueForKey:keys[i]]];
        [[removeExtraFieldButtons valueForKey:keys[i]] setFrameOrigin:CGPointMake(3, y + 7)];

        // reset Y
        y += 30;
    }

    [addExtraFieldButton setFrameOrigin:CGPointMake(3, y)];

    // set the size of the whole view... 
    // but I need to put it in a scrollview first... duh. 
    var size = [itemContentView bounds].size;
    [itemContentView setFrameSize:CGSizeMake(size.width, MAX(MINHEIGHT, y + 30))];
}

- (void)setExtrasToEdit:(BOOL)aFlag
{
    var keys = [extrasFields allKeys];
        i    = 0;

    for (; i < [keys count]; i++)
    {
        // move the field
        [[extrasFields valueForKey:keys[i]] setEditable:aFlag];
        [[extrasFields valueForKey:keys[i]] setBezeled:aFlag];

        if (aFlag)
            [itemContentView addSubview:[removeExtraFieldButtons valueForKey:keys[i]]];
        else
            [[removeExtraFieldButtons valueForKey:keys[i]] removeFromSuperview];
    }
}

- (void)removeAllExtras
{

    var keys = [extrasLabels allKeys],
        i    = 0;

    for (; i < [keys count]; i++)
    {
        // remove the label
        [[extrasLabels valueForKey:keys[i]] removeFromSuperview];
        // remove the field
        [[extrasFields valueForKey:keys[i]] removeFromSuperview];
        // remove the remove button
        [[removeExtraFieldButtons valueForKey:keys[i]] removeFromSuperview];
    }

    // empty the dicts
    [extrasLabels removeAllObjects];
    [extrasFields removeAllObjects];
    [removeExtraFieldButtons removeAllObjects];
}

- (void)promptAddExtraField:(id)sender
{
     var removeLocationSheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0,300,120) styleMask:CPDocModalWindowMask],
        contentView = [removeLocationSheet contentView],
        header = [CPTextField labelWithTitle:@"Add Item Field: "];

    [header setFrame:CGRectMake(15,10, 200, 25)];
    [header setFont:[CPFont boldSystemFontOfSize:15]];
    [header sizeToFit];
    [contentView addSubview:header];

    createNewFieldButton = [[CPButton alloc] initWithFrame:CGRectMake(183, 80, 100, 24)];

    newFieldPrompt = [[CPTextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY([header frame]) + 5, 270, 28)];
    [newFieldPrompt setEditable:YES];
    [newFieldPrompt setBezeled:YES];
    [newFieldPrompt setTarget:createNewFieldButton];
    [newFieldPrompt setAction:@selector(performClick:)];
    [newFieldPrompt setDelegate:self];
    [contentView addSubview:newFieldPrompt];
    
    [createNewFieldButton setTitle:@"Create"];
    [createNewFieldButton setTag:0];
    [createNewFieldButton setTarget:self];
    [createNewFieldButton setAction:@selector(closeSheet:)];
    [createNewFieldButton setEnabled:NO];
    [contentView addSubview:createNewFieldButton];
    [removeLocationSheet setDefaultButton:createNewFieldButton];
    
    var cancelButton = [[CPButton alloc] initWithFrame:CGRectMake(73, 80, 100, 24)];
    [cancelButton setTag:-1];
    [cancelButton setTitle:@"Cancel"];
    [cancelButton setTarget:self];
    [cancelButton setAction:@selector(closeSheet:)];
    [contentView addSubview:cancelButton];

    [CPApp beginSheet:removeLocationSheet modalForWindow:[self window] modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
    [removeLocationSheet makeFirstResponder:newFieldPrompt];
}

- (void)removeField:(id)sender
{
    var key = [sender tag];
    [[extrasLabels valueForKey:key] removeFromSuperview];
    [[extrasFields valueForKey:key] removeFromSuperview];
    [[removeExtraFieldButtons valueForKey:key] removeFromSuperview];

    [extrasLabels removeObjectForKey:key];
    [extrasFields removeObjectForKey:key];
    [removeExtraFieldButtons removeObjectForKey:key];

    [self moveExtrasIntoPlace];
}

- (void)setItem:(Item)anItem
{
    // remove extras from the previous item
    [self removeAllExtras];

    if (!anItem)
    {
        if (!noItemView)
        {
            // make one
            noItemView = [[CPView alloc] initWithFrame:[self bounds]];
            [noItemView setBackgroundColor:[CPColor colorWithHexString:@"f4f4f4"]];
            [noItemView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
            var label = [CPTextField new];
            [label setStringValue:"No Item Selected"];
            [label setFont:[CPFont systemFontOfSize:22]];
            [label setTextColor:[CPColor colorWithHexString:"727272"]];
            [label setTextShadowColor:[CPColor whiteColor]];
            [label setTextShadowOffset:CGSizeMake(0,2)];
            [label sizeToFit];
            [label setCenter:CGPointMake(CGRectGetMidX([self bounds]), CGRectGetMidY([self bounds]) - 50)];
            [label setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin | CPViewMaxXMargin | CPViewMaxYMargin];
            [noItemView addSubview:label];
        }

        var locationView = [locationController locationView];

        [[locationView editButton] setHidden:YES];
        [[locationView deleteButton] setHidden:YES];
        [[locationView uploadButton] setHidden:YES];
        [self addSubview:noItemView];
        return;
    }

    var locationView = [locationController locationView];

    [[locationView editButton] setHidden:NO];
    [[locationView deleteButton] setHidden:NO];
    [[locationView uploadButton] setHidden:NO];
    
    [noItemView removeFromSuperview];

    [nameField setStringValue:[anItem name]];
    [makeField setStringValue:[anItem make]];
    [modelField setStringValue:[anItem model]];
    [priceField setStringValue:[anItem price]];
    [serialField setStringValue:[anItem serial]];
    [dateAcquiredField setDate:[[anItem dateAcquired] copy]];
    [dateAcquiredTextField setStringValue:[[anItem dateAcquired] longStringDate]];
    [tagsField setTokens:[anItem tags]];
    [tagsUnedited setStringValue:[[anItem tags] componentsJoinedByString:", "]];
    [notesField setStringValue:[anItem notes]];

    [attachmentsCollectionView setContent:[anItem attachments]];

    // if we don't do this then it doesn't work right... hell if I know why
    window.setTimeout(function(){
        [tagsUnedited sizeToFit];
        if ([tagsUnedited frame].size.height < 28)
            [tagsUnedited setFrameSize:CGSizeMake([tagsUnedited frame].size.width, 28)];

        [notesField sizeToFit];
        if (CGRectGetHeight([notesField frame]) < 50)
            [notesField setFrameSize:CGSizeMake([notesField frame].size.width, 50)];
        
        [self setupEditViewsWithItem:anItem];
        [self moveExtrasIntoPlace];
        [self setExtrasToEdit:isEditing];
    },0);
}

- (CPDictionary)extrasForEditingItem
{
    var dict   = [CPDictionary dictionary],
        keys   = [extrasFields allKeys],
        values = [extrasFields allValues],
        i      = 0;

    for (; i < [keys count]; i++)
        [dict setValue:[values[i] stringValue] forKey:keys[i]];

    return dict;
}

- (void)toggleEditMode:(id)sender
{
    [self enterEditMode:!isEditing];

    if (!isEditing)
    {
        // construct new item to send
        [itemController itemDidEndEditing:[self itemForEditingValues]];
    }
}

- (Item)itemForEditingValues
{
    var item = [[Item alloc] initWithName:[nameField stringValue]];
    [item setMake:[makeField stringValue]];
    [item setModel:[modelField stringValue]];
    [item setNotes:[notesField stringValue]];
    [item setDateAcquired:[dateAcquiredField date]];
    [item setPrice:[priceField stringValue]];
    tagsArray = [tagsField tokens];
    [item setTags:tagsArray];
    [item setExtras:[self extrasForEditingItem]];

    return item;
}

- (void)enterEditMode:(BOOL)aFlag
{
    isEditing = aFlag;
    [nameField setEditable:aFlag];
    [nameField setBezeled:aFlag];

    [makeField setEditable:aFlag];
    [makeField setBezeled:aFlag];

    [makeField setEditable:aFlag];
    [makeField setBezeled:aFlag];

    [modelField setEditable:aFlag];
    [modelField setBezeled:aFlag];

    [priceField setEditable:aFlag];
    [priceField setBezeled:aFlag];

    [serialField setEditable:aFlag];
    [serialField setBezeled:aFlag];

    [notesField setEditable:aFlag];
    [notesField setBezeled:aFlag];

    if (isEditing)
    {
        [dateAcquiredTextField removeFromSuperview];
        [itemContentView addSubview:dateAcquiredField];
        [itemContentView addSubview:clearDateButton];
        [itemContentView addSubview:addExtraFieldButton];

        [tagsField setFrame:[tagsUnedited frame]];
        [tagsUnedited removeFromSuperview];
        [itemContentView addSubview:tagsField];

        [self tokenTextViewFrameSizeDidChange:tagsField];

        //[[[locationController locationView] editButton] setTitle:"Done"];
        //[[[locationController locationView] editButton] setValue:[CPColor colorWithCalibratedRed:0.0/255.0 green:108.0/255.0 blue:152.0/255.0 alpha:1.0] forThemeAttribute:@"text-color"];
        var image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"editbutton-selected.png"] size:CGSizeMake(18,18)];
        [[[locationController locationView] editButton] setImage:image];
    }
    else
    {
        [addExtraFieldButton removeFromSuperview];
        [dateAcquiredField removeFromSuperview];
        [clearDateButton removeFromSuperview];
        var date = [[dateAcquiredField date] longStringDate];
        [dateAcquiredTextField setStringValue:date];
        [itemContentView addSubview:dateAcquiredTextField];

        [tagsUnedited setFrame:[tagsField frame]];
        [tagsField removeFromSuperview];
        tagsArray = [tagsField tokens];
        [tagsUnedited setStringValue:[tagsArray componentsJoinedByString:", "]];
        [itemContentView addSubview:tagsUnedited];

        [self tokenTextViewFrameSizeDidChange:tagsUnedited];

        //[[[locationController locationView] editButton] setTitle:"Edit"];
        //[[[locationController locationView] editButton] setValue:[CPColor colorWithCalibratedWhite:79.0 / 255.0 alpha:1.0] forThemeAttribute:"text-color"];
        var image = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"editbutton.png"] size:CGSizeMake(18,18)];
        [[[locationController locationView] editButton] setImage:image];
    }


    [self setExtrasToEdit:aFlag];
}

- (void)clearDate:(id)sender
{
    [dateAcquiredTextField setStringValue:""];
    [dateAcquiredField setDate:nil];
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
        case 0: // create new extra
            var key = [[newFieldPrompt stringValue] capitalizedString],
                label = [ItemView customLabelWithFrame:CGRectMake(15, 10, 100, 28)];

            // just in case they slip by... :) (generally by hitting enter too quickly)
            if ([extrasLabels containsKey:key])
            {
                alert("Sorry, You cannot have two extras with the same name.");
                return;
            }

            if (!key)
            {
                alert("Sorry, You must enter a name for the new extra.");
                return;
            }

            [label setStringValue:key + ": "];
            [extrasLabels setValue:label forKey:key];
            [itemContentView addSubview:label];
            
            // create the field
            var field = [ItemView ItemViewTextField];
            [field setFrame:CGRectMake(115, 10, 275, 28)];
            [field setFont:[CPFont systemFontOfSize:13]];
            [field setBezeled:YES];
            [field setEditable:YES];
            [extrasFields setValue:field forKey:key];
            [itemContentView addSubview:field];
            
            var button = [[CPButton alloc] initWithFrame:CGRectMake(3, 10, 12,12)],
                bundle = [CPBundle mainBundle];
            [button setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"MinusButton.png"] size:CGSizeMake(12,12)]];
            [button setAlternateImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"MinusButtonP.png"] size:CGSizeMake(12,12)]];
            [button setBordered:NO];
            [button setTarget:self];
            [button setAction:@selector(removeField:)];
            [button setTag:key];
            [removeExtraFieldButtons setValue:button forKey:key];

            [self moveExtrasIntoPlace];
            [[self window] makeFirstResponder:field];

            var clip = [scrollView contentView];
            [clip scrollToPoint:CGPointMake(0, [clip bounds].size.height)];
            [scrollView reflectScrolledClipView:clip];

            break;
    }

    [newFieldPrompt setStringValue:""];
}

- (void)controlTextDidChange:(CPNotification)aNote
{
    var field = [aNote object];
    if (field === newFieldPrompt)
    {
        // check to see if this field already exists
        var value = [[field stringValue] capitalizedString];

        [createNewFieldButton setEnabled:(value && ![extrasLabels containsKey:value])];
        
    }
    else if (field === notesField)
    {
        [field sizeToFit];

        if (CGRectGetHeight([field frame]) < 50)
            [field setFrameSize:CGSizeMake([field frame].size.width, 50)];

        [self moveExtrasIntoPlace];
    }
}

- (void)tokenTextViewFrameSizeDidChange:(id)sender
{
    var newY = CGRectGetMaxY([sender frame]) + 4;
    [notesLabel setFrameOrigin:CGPointMake(15, newY + 2)];
    [notesField setFrameOrigin:CGPointMake(115, newY)];

    [self moveExtrasIntoPlace];
}

/*- (CPString)tokenTextViewCompletionForToken:(id)sender {
	if(sender == tagsField) {
		if(_completionMenu) {
			var selectedTag = [_completionMenu selectedItem];
			if(selectedTag == nil)
				return nil;
			return [selectedTag.tag getName];
		}
	}	
	return nil;
}


- (void)tokenTextViewResignFirstResponder:(id)sender {
	if(sender == tagsField) {
		if(_completionMenu) {
			[_completionMenu orderOut:self];
		}
	}
}

- (void)tokenTextViewCurrentTokenOriginDidChange:(id)sender {
	if(sender == tagsField) {
		if(!_completionMenu)
			return;
		
		var point = [tagsField currentTokenOrigin];
		point = [sender convertPoint:point toView:nil];
		point.y += 21;
		[_completionMenu setFrameOrigin:point];
	}
}


- (void)tokenTextViewCurrentTokenDidChange:(id)sender {
	if(sender == tagsField) {
		if(!_completionMenu) {
			_completionMenu = [[NAMenu alloc] init];
            _completionContent = [[self class] availableTags];
			[_completionMenu setContent:_completionContent];
		}
		
		var stringValue = [tagsField currentTokenStringValue];
		if([stringValue length] > 0) {
			var tags = [[self class] availableTags];//NAModelTag search:stringValue into:[astor.tags array]];

			[_completionContent removeAllObjects];
			var i, tag, count = [tags count];
			if(count > 10)
				count = 10;
			for(i = 0; i < count; ++i) {
				tag = [tags objectAtIndex:i];
				[_completionContent addObject:{ 'name' : tag, 'tag' : tag }];
			}
			[_completionMenu reloadContent];

			if([_completionContent count] > 0) {
				
				[_completionMenu orderFront:self];
			}
			else {
				[_completionMenu orderOut:self];
			}
		}
		else {
			[_completionMenu orderOut:self];
		}
	}
}*/

- (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
    //if ([[aCollectionView content][[indices firstIndex]] type] === "image")

    return ["ItemImageAttachment"];
}

- (CPData)collectionView:(CPCollectionView)aCollectionView dataForItemsAtIndexes:(CPIndexSet)indices forType:(CPString)aType
{
    return [CPKeyedArchiver archivedDataWithRootObject:indices];
}

- (BOOL)collectionView:(CPCollectionView)aView shouldDeleteItemsAtIndexes:(CPIndexSet)indicies
{
    return YES;
    //return NO;
}

- (void)collectionView:(CPCollectionView)aView didDoubleClickOnItemAtIndex:(int)anIndex
{
    var item = [aView content][anIndex],
        //itemView = ;[[aView items][anIndex] view],
        itemFrame = [aView frameForItemAtIndex:anIndex];//[itemView frame];

    //convert frame to window
    itemFrame = [aView convertRect:itemFrame toView:nil];

    var window = [[CPWindow alloc] initWithContentRect:itemFrame styleMask:CPTitledWindowMask|CPHUDBackgroundWindowMask|CPResizableWindowMask|CPClosableWindowMask];

    [window setTitle:[item name]];


    // FIX ME: here we need to store the size of the media so we have syncronous access to it
    /*var image = [[CPImage alloc] initWithContentsOfFile:[item data]],
        imageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 900, 550)],
        scroll = [[CPScrollView alloc] initWithFrame:CGRectMake(0,0,900,550)],
        hud = [CPTheme themeNamed:@"Aristo-HUD"];

    [[scroll verticalScroller] setTheme:hud];
	[[scroll horizontalScroller] setTheme:hud];
    [scroll setDocumentView:imageView];
//    [scroll setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];

    [imageView setImage:image];
    [imageView setImageScaling:CPScaleNone];

    // create some buttons
    var fullScreenButton = [[CPButton alloc] initWithFrame:CGRectMake(425, 575, 75, 24)];
    [fullScreenButton setTitle:@"Fullscreen"];
    [fullScreenButton setTheme:hud];
    [fullScreenButton setTarget:imageView];
    [fullScreenButton setAction:@selector(enterFullScreenMode)];

    var contentView = [window contentView];
    [contentView addSubview:fullScreenButton];
    [contentView addSubview:scroll];*/

    mediaView = [[MediaView alloc] initWithFrame:CGRectMake(0,0,900,650)];
    [mediaView setMedia:item forItem:[itemController activeItem]];
    [window setContentView:mediaView];
    [window makeKeyAndOrderFront:self];
    [window makeFirstResponder:mediaView];


    var containerSize = [CPPlatform isBrowser] ? [[window platformWindow] contentBounds].size : [[self screen] visibleFrame].size,
         point = CGPointMake((containerSize.width - 900) / 2.0, (containerSize.height - 650) / 2.0),
         size = [[aView window] frame].size,
         newFrame = CGRectMake(point.x, point.y, 900, 650);


    [window setFrame:newFrame display:YES animate:YES];
}

+ (CPTextField)ItemViewTextField
{
    var textfield = [LocationEditView customTextField];

    [textfield setFont:[CPFont systemFontOfSize:13]];
    [textfield setValue:CGInsetMake(0.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateNormal];
    [textfield setValue:CGInsetMake(1.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateEditing];

    [textfield setBezeled:NO];
    [textfield setEditable:NO];

    return textfield;
}


+ (CPTextField)customLabelWithFrame:(CGRect)aRect
{
    var textfield = [[CPTextField alloc] initWithFrame:aRect];
    [textfield setTextColor:[CPColor colorWithHexString:"666666"]];
    [textfield setFont:[CPFont boldSystemFontOfSize:12]];
    [textfield setAlignment:CPRightTextAlignment];

    return textfield;
}

@end

@implementation AutoExpandingTextField : LPMultiLineTextField
{
}
- (void)setFrameHeightToFit
{
    var element = document.getElementsByTagName("textarea"),
        aSize = nil;
    for(var i=0; i < element.length; i++)
    {
        if(element[i] === document.activeElement)
        {
            //FitToContent(element[i], 200000);
            
            var aDOMElement = element[i],
                adjustedHeight = aDOMElement.clientHeight;
                
               adjustedHeight = MAX(aDOMElement.scrollHeight, adjustedHeight);
               
               if(adjustedHeight > aDOMElement.clientHeight)
                  aDOMElement.style.height = adjustedHeight + "px";
            
            var height = parseInt(aDOMElement.style.height);
            aSize = CGSizeMake(CGRectGetWidth([self bounds]), height + 14);
            
        }
    }
    [super setFrameSize:aSize];
}

- (void)sizeToFit
{
    var width = CGRectGetWidth([self bounds]),
        heightDiv = document.createElement("div"),
        lineBreaks = [self stringValue].lastIndexOf("\n") + 1;
    
    heightDiv.style.width = (width - [self currentValueForThemeAttribute:@"content-inset"].left - [self currentValueForThemeAttribute:@"content-inset"].right) + "px";
    heightDiv.style.font = [[self font] cssString];
    heightDiv.innerHTML = [self stringValue].replace(/\n/gi,"<br />");
    heightDiv.style.zindex = -200;
    //heightDiv.style.position = "absolute";
    //heightDiv.style.top = "-2000px";
    //heightDiv.style.left = "-2000px";
    document.body.appendChild(heightDiv);
    var height = heightDiv.offsetHeight + [self currentValueForThemeAttribute:@"content-inset"].top + [self currentValueForThemeAttribute:@"content-inset"].bottom + 16;
    document.body.removeChild(heightDiv);

    //height += (lineBreaks)*2.5;
    [self setFrameSize:CGSizeMake(width, height)];
}

@end

@implementation ItemContentView : CPView
-(void)drawRect:(id)aRect
{
    var context = [[CPGraphicsContext currentContext] graphicsPort];

    CGContextSetStrokeColor(context, [CPColor colorWithHexString:@"CCCCCC"]);

    var points = [
                    CGPointMake(15, 100.5), 
                    CGPointMake(388, 100.5)
                 ];

    CGContextStrokeLineSegments(context, points, 2);
}
@end

@implementation RLProgressIndicator : CPProgressIndicator
- (void)updateBackgroundColor
{
    
    [self setBackgroundColor:[CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"Attachments/upload-background.png"] size:CGSizeMake(47,7)]]];
    [self drawBar];
}

- (void)drawBar
{
    if (_style == CPProgressIndicatorSpinningStyle)
        return;
    
    if (!_barView)
    {
        _barView = [[CPView alloc] initWithFrame:CGRectMake(0.0, 1.0, 0.0, 5.0)];        
        [self addSubview:_barView];
    }
    var bundle = [CPBundle mainBundle];
    [_barView setBackgroundColor:[CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
        [
            [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"Attachments/upload-bar-0.png"] size:CGSizeMake(3,5)],
            [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"Attachments/upload-bar-1.png"] size:CGSizeMake(1,5)],
            [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:"Attachments/upload-bar-2.png"] size:CGSizeMake(3,5)]
        ]
        isVertical:NO]]];

    var width = CGRectGetWidth([self bounds]),
        barWidth = width * ((_doubleValue - _minValue) / (_maxValue - _minValue));

    if (barWidth > 0.0 && barWidth < 4.0)
        barWidth = 4.0;

    [_barView setFrameSize:CGSizeMake(barWidth, 5.0)];
}

@end

@implementation AttachmentCell : CPView
{
	CPTextField name;
    CPImageView image;
    CPView      borderOverlay;

    CPColor bgColor;
    CPColor selectedBGColor;
    //CPProgressIndicator progressBar;
    double  progress;
    CPProgressIndicator progressBar;
}

- (void)setRepresentedObject:(id)anObject
{
    if (!borderOverlay)
    {
        var bundle = [CPBundle mainBundle];
        bgColor = [CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Attachments/AttachmentBG.png"] size:CGSizeMake(54.0, 54.0)]];

        borderOverlay = [[CPView alloc] initWithFrame:CGRectMake(13, 5, 54, 54)];
        [borderOverlay setBackgroundColor:bgColor];

        image = [[CPImageView alloc] initWithFrame:CGRectMake(14,5,53,52)];
        [image setImageScaling:CPScaleNone];
        [self addSubview:borderOverlay];
        [self addSubview:image];

        name = [[CPTextField alloc] initWithFrame:CGRectMake(10,58,60, 24)];
        [name setFont:[CPFont systemFontOfSize:11]];
        [name setTextColor:[CPColor colorWithHexString:"626262"]];
        [name setTextShadowColor:[CPColor whiteColor]];
        [name setTextShadowOffset:CGSizeMake(0,1)];
        [name setAlignment:CPCenterTextAlignment];
        [name setLineBreakMode:CPLineBreakByTruncatingTail];
        [self addSubview:name];

    }
    [image setImage:[[CPImage alloc] initWithContentsOfFile:[anObject data] size:[self scaleImageWithSize:CGSizeMake(578,397)]]];

    [name setStringValue:[anObject name]];
    [anObject setRepresentedView:self];

    [progressBar removeFromSuperview];

}

- (void)setProgress:(double)aPercentage
{
    progress = aPercentage;

    if (!progressBar)
    {
        var bounds = [self bounds];
        progressBar  = [[RLProgressIndicator alloc] initWithFrame:CGRectMake(17, bounds.size.height - 37, 47, 7)];
        [progressBar setMaxValue:1.0];
        [self addSubview:progressBar];
    }

    [self addSubview:progressBar];
    [progressBar setDoubleValue:aPercentage];

    if (progress >= 1.0)
        [name setStringValue:"Processing"];
}

- (void)setSelected:(BOOL)isSelected
{
	var bundle = [CPBundle mainBundle];

    if (!selectedBGColor)
         selectedBGColor = [CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Attachments/AttachmentBG.png"] size:CGSizeMake(54.0, 54.0)]];


    if (isSelected)
        [borderOverlay setBackgroundColor:selectedBGColor];
    else
        [borderOverlay setBackgroundColor:bgColor];
}

- (CGSize)scaleImageWithSize:(CGSize)aSize
{
    var constrain = 54,
        height = aSize.height,
        width = aSize.width,
        ratio = MAX( constrain / width, constrain / height );

    width = ratio * width;
    height = ratio * height;

    return CGSizeMake(width, height);
}
@end

@implementation MainItemView : CPView
{
    CPImageView image;
    CPView      borderOverlay;
    CPColor     normalBorder;
    CPColor     highlightBorder;
    id          controller @accessors;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        var bundle = [CPBundle mainBundle];
            
        normalBorder = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
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

        borderOverlay = [[CPView alloc] initWithFrame:CGRectMake(5, 5, aFrame.size.width - 10, aFrame.size.height - 10)];
        [borderOverlay setBackgroundColor:normalBorder];

        image = [[CPImageView alloc] initWithFrame:CGRectMake(5,5,aFrame.size.width - 10, aFrame.size.height - 10)];
        [image setImageScaling:CPScaleNone];

        [self addSubview:image];

        [self addSubview:borderOverlay];

        [self registerForDraggedTypes:["ItemImageAttachment"]];

        // activate the view as a drop zone for uploads
	    var fileDropUploadController = [[DCFileDropController alloc] initWithView:self 
		                                                             dropDelegate:self 
		                                                                uploadURL:[CPURL URLWithString:@"http://timetableapp.com/TestingEnviro/Iguana/upload.php"] 
		                                                            uploadManager:[DCFileUploadManager sharedManager]];

        [fileDropUploadController setValidFileTypes:["png","gif","jpg"]];
    }

    return self;
}

- (void)draggingEntered:(CPDraggingInfo)info
{
    if (!highlightBorder)
    {
        var bundle = [CPBundle mainBundle];
         highlightBorder = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
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

    [borderOverlay setBackgroundColor:highlightBorder];
}

- (void)draggingExited:(CPDraggingInfo)info
{
    [borderOverlay setBackgroundColor:normalBorder];
}

- (void)imageDidLoad:(CPImage)anImage
{
    [self setImage:anImage];
}

- (void)performDragOperation:(CPDraggingInfo)info
{
    [self draggingExited:info];

    var index = [[CPKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:"ItemImageAttachment"]] firstIndex],
        cv = [info draggingSource],
        imageData = [[cv content][index] data],
        theImage = [[CPImage alloc] initWithContentsOfFile:imageData];

    [theImage setDelegate:self];
}

- (void)fileDropUploadController:(DCFileDropController)theController setState:(BOOL)visible
{
	if (visible)
		[self draggingEntered:nil]
    else
		[self draggingExited:nil];
}

- (void)fileDropController:(DCFileUploadController)aController didBeginUpload:(DCFileUpload)anUpload
{
    [locationController setMainImageUpload:anUpload];
}

- (void)setImage:(CPImage)anImage
{
    [anImage setSize:[self scaleImageWithSize:[anImage size]]];
    [image setImage:anImage];

}

- (CGSize)scaleImageWithSize:(CGSize)aSize
{
    var constrain = 135,
        height = aSize.height,
        width = aSize.width,
        ratio = MAX( constrain / width, constrain / height );

    width = ratio * width;
    height = ratio * height;

    return CGSizeMake(width, height);
}
@end


@implementation CPCollectionView (RespectMaxNumberOfRows)
{
    int  originalWidth;
    int  originalHeight;
}
- (void)tile
{
    var width = CGRectGetWidth([self bounds]);

    if (![_content count] || width == _tileWidth)
        return;

    // We try to fit as many views per row as possible.  Any remaining space is then
    // either proportioned out to the views (if their minSize != maxSize) or used as
    // margin
    var itemSize = CGSizeMakeCopy(_minItemSize);

    _numberOfColumns = MAX(1.0, FLOOR(width / itemSize.width));

    if (_maxNumberOfColumns > 0)
        _numberOfColumns = MIN(_maxNumberOfColumns, _numberOfColumns);

    var remaining = width - _numberOfColumns * itemSize.width,
        itemsNeedSizeUpdate = NO;

    if (remaining > 0 && itemSize.width < _maxItemSize.width)
        itemSize.width = MIN(_maxItemSize.width, itemSize.width + FLOOR(remaining / _numberOfColumns));

    // When we ONE column and a non-integral width, the FLOORing above can cause the item width to be smaller than the total width.
    if (_maxNumberOfColumns == 1 && itemSize.width < _maxItemSize.width && itemSize.width < width)
        itemSize.width = MIN(_maxItemSize.width, width);

    if (!CGSizeEqualToSize(_itemSize, itemSize))
    {
        _itemSize = itemSize;
        itemsNeedSizeUpdate = YES;
    }

    var index = 0,
        count = _items.length;

    _numberOfRows = CEIL(count / _numberOfColumns);

    if (_maxNumberOfRows > 0)
    {
        _numberOfRows = MIN(_maxNumberOfRows, _numberOfRows);

        // we need to recalc the number of columns now too
        _numberOfColumns = MAX(1.0, count / _numberOfRows);

        if (_maxNumberOfColumns > 0 && _numberOfColumns > _maxNumberOfColumns)
            _numberOfColumns = _maxNumberOfColumns;
    }


    if (_maxNumberOfColumns > 0 && _maxNumberOfRows > 0)
        count = MIN(count, _maxNumberOfColumns * _maxNumberOfRows);

//    _horizontalMargin = MAX(0.0, FLOOR((width - _numberOfColumns * itemSize.width) / (_numberOfColumns + 1)));

    var x = _horizontalMargin,
        y = -itemSize.height;

    for (; index < count; ++index)
    {
        if (index % _numberOfColumns == 0)
        {
            x = _horizontalMargin;
            y += _verticalMargin + itemSize.height;
        }

        var view = [_items[index] view];


        [view setFrameOrigin:CGPointMake(x, y)];

        if (itemsNeedSizeUpdate)
            [view setFrameSize:_itemSize];

        x += itemSize.width + _horizontalMargin;
    }

    var superview = [self superview],
        proposedHeight =  y + itemSize.height,// + _verticalMargin,
        proposedWidth = _numberOfColumns * (itemSize.width + _horizontalMargin);

    /*if ([superview isKindOfClass:[CPClipView class]])
    {
        var superviewSize = [superview bounds].size,
            scrollview = [superview superview];

            var newSize = [scrollview contentSize];

            proposedHeight = MAX(superviewSize.height, proposedHeight);
            proposedWidth = MAX(superviewSize.width - _horizontalMargin, proposedWidth);

    }*/

    proposedWidth = MAX(originalWidth, proposedWidth);
    proposedHeight = MAX(originalHeight, proposedHeight);

    _tileWidth = proposedWidth;
    [self setFrameSize:CGSizeMake(proposedWidth, proposedHeight)];
    _tileWidth = -1.0;
}
@end

@implementation DropUploadCollectionView : CPCollectionView
{
    CPTextField noItemsLabel;
    BOOL isDragging;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    originalWidth = aFrame.size.width;
    originalHeight = aFrame.size.height;

    return self;
}

- (void) mouseDragged:(CPEvent) anEvent {
    //if (![_delegate respondsToSelector:@selector(collectionView:dragTypesForItemsAtIndexes:)])
      //   return;
 
     // If we don't have any selected items, we've clicked away, and thus the drag is meaningless.
     //if (![_selectionIndexes count])
       //  return;
 
     //if ([_delegate respondsToSelector:@selector(collectionView:canDragItemsAtIndexes:withEvent:)] &&
       //  ![_delegate collectionView:self canDragItemsAtIndexes:_selectionIndexes withEvent:_mouseDownEvent])
         //return;
 
     // Set up the pasteboard
     var dragTypes = [_delegate collectionView:self dragTypesForItemsAtIndexes:_selectionIndexes];
 
     [[CPPasteboard pasteboardWithName:CPDragPboard] declareTypes:dragTypes owner:self];
 
     var point = [self convertPoint:[anEvent locationInWindow] fromView:nil];
 
     if (!_itemForDragging)
         _itemForDragging = [self newItemForRepresentedObject:_content[[_selectionIndexes firstIndex]]];
     else
         [_itemForDragging setRepresentedObject:_content[[_selectionIndexes firstIndex]]];
 
     var view = [_itemForDragging view];
 
     [view setFrameSize:_itemSize];
     [view setAlphaValue:0.7];
 
     [self dragView:view
        at: [self convertPoint:[anEvent locationInWindow] fromView:nil]
         offset:CGRectMakeZero()
         event:_mouseDownEvent
         pasteboard:nil
         source:self
         slideBack:YES];
}

- (void)draggingEntered:(CPDraggingInfo)info
{
    isDragging = YES;
    [self setNeedsDisplay:YES];
    [[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode]; 
}

- (void)draggingExited:(CPDraggingInfo)info
{
    isDragging = NO;
    [self setNeedsDisplay:YES];
    [[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode]; 
}

- (void)fileDropUploadController:(DCFileDropController)theController setState:(BOOL)visible {

	if (visible)
		[self draggingEntered:nil]
    else
		[self draggingExited:nil];

     [[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode]; 
}

- (void)tile
{
    if ([_items count])
    {
        [noItemsLabel removeFromSuperview];
        [super tile];
    }
    else
    {
        if (!noItemsLabel)
        {
            noItemsLabel = [[CPTextField alloc] init];

            [noItemsLabel setFont:[CPFont boldSystemFontOfSize:16]];
            [noItemsLabel setTextColor:[CPColor colorWithHexString:"CCCCCC"]];
            [noItemsLabel setTextShadowColor:[CPColor whiteColor]];
            [noItemsLabel setTextShadowOffset:CGSizeMake(2,2)];
            [noItemsLabel setStringValue:"Drop Files Here To Upload Them."];
            [noItemsLabel sizeToFit];
        }
        [noItemsLabel setCenter:[self center]];
        [self addSubview:noItemsLabel];
    }
}

- (void)drawRect:(CGRect)aRect
{
    if (!isDragging)
        return;

    var superView = [self superview],
        aRect = [superView bounds],
        context = [[CPGraphicsContext currentContext] graphicsPort];

    aRect = [self convertRect:aRect fromView:superView];

    CGContextSetStrokeColor(context, [CPColor colorWithHexString:@"4886ca"]);
    CGContextSetLineWidth(context, 3);

    var newRect = CGRectMake(aRect.origin.x + 4, aRect.origin.y + 6, aRect.size.width - 8, aRect.size.height - 17);

    CGContextSetFillColor(context, [CPColor colorWithRed:72/255 green:134/255 blue:202/255 alpha:0.25]);
    CGContextFillRoundedRectangleInRect(context, newRect, 8, YES, YES, YES, YES);

    CGContextStrokeRoundedRectangleInRect(context, newRect, 8, YES, YES, YES, YES);
}

@end

// FIX ME: THIS IS SHIT!!!
@implementation CPEvent (fuck)
- (BOOL)_couldBeKeyEquivalent
{
    if (_type !== CPKeyDown)
        return NO;

    var characterCount = _characters.length;

    if (!characterCount)
        return NO;

    if (_modifierFlags & (CPCommandKeyMask | CPControlKeyMask))
        return YES;

    for(var i=0; i<characterCount; i++)
    {
        switch(_characters.charAt(i))
        {
            //case CPBackspaceCharacter:
            //case CPDeleteCharacter:
            //case CPDeleteFunctionKey:
            //case CPTabCharacter:
            case CPCarriageReturnCharacter:
            case CPNewlineCharacter:
            case CPEscapeFunctionKey:
            case CPPageUpFunctionKey:
            case CPPageDownFunctionKey:
            //case CPLeftArrowFunctionKey:
            //case CPUpArrowFunctionKey:
            //case CPRightArrowFunctionKey:
            //case CPDownArrowFunctionKey:
                return YES;
        }
    }
    // FIXME: More cases? Space?
    return NO;
}

@end

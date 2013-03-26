@implementation RLMapView : CPView
{
    CPMapView   mapView;
    CPView      editView;
    CPTextField addressField;
    CPPopUpButton mapTypeMenu;
    CPButton    changeButton;
    CPButton    bigCurl;

    BOOL        isEditing;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        isEditing = NO;
        var bundle = [CPBundle mainBundle],
            colorImage = [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"content-background.png"] size:CGSizeMake(159, 159)];

        editView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, aFrame.size.width, aFrame.size.height)];
        [editView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        [editView setBackgroundColor:[CPColor colorWithPatternImage:colorImage]];
        self._DOMElement.style.border = "1px solid #bbb";


        addressField = [LocationEditView customMultiLineTextField];
        [addressField setDelegate:self];
        [addressField setFrame:CGRectMake(15,15, aFrame.size.width -30, 60)];
        [addressField setFont:[CPFont boldSystemFontOfSize:13]];
        [addressField setPlaceholderString:@"Location Address"];
//        addressField = [[CPTextField alloc] initWithFrame:];
  //      [addressField setBezeled:YES];
    //    [addressField setBezelStyle:CPTextFieldRoundedBezel];
      //  [addressField setEditable:YES];
        [addressField setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        [addressField setTarget:self];
        [addressField setAction:@selector(updateAddress:)];
        [editView addSubview:addressField];

        var label = [CPTextField new];
        [label setFrameOrigin:CGPointMake(15, 90)];
        [label setStringValue:"Map Type:"];
        [label setFont:[CPFont boldSystemFontOfSize:12]];
        [label setValue:[CPColor colorWithCalibratedWhite:79.0 / 255.0 alpha:.8] forThemeAttribute:@"text-color"];
        [label setValue:[CPColor colorWithCalibratedWhite:240.0 / 255.0 alpha:1.0] forThemeAttribute:@"text-shadow-color"];
        [label setValue:CGSizeMake(0.0, 1.0) forThemeAttribute:@"text-shadow-offset" inState:CPThemeStateBordered];

        [label sizeToFit];
        [editView addSubview:label];

         mapTypeMenu = [[CPPopUpButton alloc] initWithFrame:CGRectMake(15, 110, aFrame.size.width -30, 24)];
        [mapTypeMenu setAutoresizingMask:CPViewWidthSizable];
        [mapTypeMenu addItemsWithTitles:[@"Standard", @"Hybrid", @"Satellite", @"Terrain"]];
        [mapTypeMenu setTarget:self];
        [mapTypeMenu setAction:@selector(setMapType:)];
        [editView addSubview:mapTypeMenu];

        var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(aFrame.size.width - 115, aFrame.size.height - 39, 100, 24)];
        [doneButton setTitle:@"Done"];
        [doneButton setDefaultButton:YES];
        [doneButton setAutoresizingMask:CPViewMinXMargin|CPViewMinYMargin];
        [doneButton setTarget:self];
        [doneButton setAction:@selector(hideEditView:)];
        [editView addSubview:doneButton];

        mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0,0,aFrame.size.width,aFrame.size.height)];
        //[mapView setDelegate:self];
        [mapView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        //[mapView setLocation:[[CPLocation alloc] initWithString:@"4336 Griggstown Rd. Calvert City, KY"]];
        [mapView setDoubleTarget:self];
        [mapView setDoubleAction:@selector(showEditView:)];
        [self addSubview:mapView];

        changeButton = [[CPButton alloc] initWithFrame:CGRectMake(aFrame.size.width-45,aFrame.size.height-40,45,40)];
        [changeButton setBordered:NO];
        [changeButton setImage: [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"RLMapViewCorner.png"] size:CGSizeMake(45,40)]];
		[changeButton setImagePosition:CPImageOnly];
        [changeButton setAutoresizingMask:CPViewMinYMargin|CPViewMinXMargin];
        [changeButton setTarget:self];
        [changeButton setAction:@selector(showEditView:)];

        /*bigCurl = [[CPButton alloc] initWithFrame:CGRectMake(aFrame.size.width-256, 0, 256, 306)];
        [bigCurl setBordered:NO];
        [bigCurl setImage: [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"RLMapViewBigCurl.png"] size:CGSizeMake(256,306)]];
		[bigCurl setImagePosition:CPImageOnly];
        [bigCurl setAutoresizingMask:CPViewMinYMargin|CPViewMinXMargin];
        [bigCurl setTarget:self];
        [bigCurl setAction:@selector(hideEditView:)];*/        
        
        [self addSubview:changeButton];
        //[self addSubview:editView];
    }

    return self;
}

- (void)mapViewDidLoad:(id)sender
{
    console.log("bam");
}

- (void)mapViewWillLoad:(id)sender
{
    console.log("load");
}

- (void)updateAddress:(id)sender
{
    
}

- (void)showEditView:(id)sender
{

    isEditing = YES;

    var options = {modalView: editView};

    [self addSubview:editView];
    //[mapView flip:options];


    var animationDict = [CPDictionary new],
        mapViewFrame = [mapView frame];

    [self addSubview:editView];
    [animationDict setValue:editView forKey:CPViewAnimationTargetKey];
    [animationDict setValue:mapViewFrame forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:mapViewFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:CPViewAnimationFadeInEffect forKey:CPViewAnimationEffectKey];

    var animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict]];
    [animation startAnimation];
}

- (void)hideEditView:(id)sender
{
    //console.log("in hideEditView: of RLMapView we need to implement some editing stuff kthxbia");

    isEditing = NO;

    //[editView setFrame:[mapView frame]];
    //var options = {modalView: editView};

    [self addSubview:editView];
    //[mapView unflip];

    var animationDict = [CPDictionary new],
        mapViewFrame = [mapView frame];

    [animationDict setValue:editView forKey:CPViewAnimationTargetKey];
    [animationDict setValue:mapViewFrame forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:mapViewFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:CPViewAnimationFadeOutEffect forKey:CPViewAnimationEffectKey];

    var animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict]];
    [animation startAnimation];
}

- (void)mouseDown:(CPEvent)anEvent
{
    if ([anEvent clickCount] < 2)
        return;

    if (isEditing)
        [self hideEditView:self];
    else
       [self showEditView:self];
}

- (void)setAddress:(CPString)anAddress
{
 //   alert(addressField);
    [addressField setStringValue:anAddress];
    [mapView takeStringAddressFrom:addressField];
}

- (void)setMapType:(id)valueOrSender
{
    if ([valueOrSender isKindOfClass:[CPPopUpButton class]])
    {
        var valueOrSender = [valueOrSender indexOfSelectedItem];
    }
    else
    {
        // we may consider passing the actual value here...
    }

    [mapView setMapType:valueOrSender];
}

@end

@implementation MKMapView (doubleClicker)
{
    id  doubleTarget;
    SEL doubleAction;
}
- (void)setDoubleTarget:(id)target
{
    doubleTarget = target;
}

- (void)setDoubleAction:(id)action
{
    doubleAction = action;
}

- (void)mouseDown:(CPEvent)anEvent
{
    if ([anEvent clickCount] === 2 && doubleTarget && doubleAction)
    {
        objj_msgSend(doubleTarget, doubleAction, self);
        return;
    }

    [self trackPan:anEvent];

    [super mouseDown:anEvent];
}

- (MKMarker)addMarker:(MKMarker)aMarker atLocation:(MKLocation)aLocation
{
    if (_mapReady) {
        var gMarker = [aMarker gMarker];
        gMarker.setLatLng([aLocation googleLatLng]);
        m_map.addOverlay(gMarker);
    } else {
        // TODO some sort of queue?
    }
    return marker;
}

- (void)clearOverlays 
{
    if (_mapReady) {
        m_map.clearOverlays();
    }
}

@end

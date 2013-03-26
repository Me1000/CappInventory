@implementation LocationEditView : CPView
{
    CPTextField         locationTitle;
    CPPopUpButton       locationType;
    CPTextField         locationAddress;

    CPShadowView        shadowView;
    CPView              contentView;

    MKMapView           map;

    CPButton            closeButton;
    id                  target;
    SEL                 saveAndCloseAction @accessors;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        var bundle = [CPBundle mainBundle];
        
        shadowView = [[CPShadowView alloc] initWithFrame:CGRectMake(0,0,aFrame.size.width,aFrame.size.height)];
        [shadowView setWeight:CPHeavyShadow];
        [self addSubview:shadowView];

        contentView = [[CPView alloc] initWithFrame:CGRectMake(7, 5, aFrame.size.width - 14, aFrame.size.height - 10)];
        [contentView setBackgroundColor:[CPColor colorWithHexString:@"e7eaee"]];

        [self addSubview:contentView];


        [self setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];
        [shadowView setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];
        [contentView setAutoresizingMask:CPViewHeightSizable|CPViewWidthSizable];
        //newParentView = [[CPView alloc] initWithFrame:frame];
        //var colorImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"content-background.png"] size:CGSizeMake(159,159)];]
        locationTitle = [[self class] customTextField];

        [locationTitle setStringValue:@""];
        [locationTitle setPlaceholderString:@"Location Name"];

        [contentView addSubview:locationTitle];

        var lineView = [[CPView alloc] initWithFrame:CGRectMake(50,80,425,1)];
        [lineView setBackgroundColor:[CPColor colorWithHexString:@"999999"]];
        [contentView addSubview:lineView];

        locationType = [[CPPopUpButton alloc] initWithFrame:CGRectMake(55, 90, 250, 24)];
        [locationType setBordered:NO];
        [locationType addItems:[LocationItemTypes menuItems]];
        [contentView addSubview:locationType];

        locationAddress = [[self class] customMultiLineTextField];
        [locationAddress setStringValue:@""];
        [locationAddress setDelegate:self];
//        [locationAddress setFrame:CGRectMake(50, 130, 425, 60)];
        [locationAddress setFont:[CPFont boldSystemFontOfSize:20]];
        [locationAddress setPlaceholderString:@"Location Address"];

        [contentView addSubview:locationAddress];


        map = [[RLMapView alloc] initWithFrame:CGRectMake(635, 15, aFrame.size.width - 700, 300)];
        [map setAutoresizingMask:CPViewWidthSizable];
        [contentView addSubview:map];


        closeButton = [[CPButton alloc] initWithFrame:CGRectMake(5,5,20,21)];
        [closeButton setBordered:NO];
        [closeButton setImage: [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:"CloseButton.png"] size:CGSizeMake(20,21)]];
		[closeButton setImagePosition:CPImageOnly];
        [closeButton setTarget:self];
        [closeButton setAction:@selector(close:)];

        [contentView addSubview:closeButton];


        var doneButton = [[self class] customBigButton];

//        [doneButton setFrame:CGRectMake(100, 300, 150, 44)];
        [doneButton setTitle:@"Done"];
        [doneButton setTarget:self];
        [doneButton setAction:@selector(close:)];
        [contentView addSubview:doneButton];
    }

    return self;
}

// update the views with this data man
- (void)setLocationData:(CPDictionary)aDict
{
    [locationTitle setStringValue:[aDict valueForKey:@"name"]];
    [locationType  selectItemWithTitle:[aDict valueForKey:@"type"]];
    [locationAddress  setStringValue:[aDict valueForKey:@"address"]];
    [map setAddress:[aDict valueForKey:@"address"]];
}

- (CPDictionary)locationData
{
    var dictionary = [CPDictionary new];

    [dictionary setValue:[locationTitle stringValue] forKey:@"name"];
    [dictionary setValue:[locationType titleOfSelectedItem] forKey:@"type"];
    [dictionary setValue:[locationAddress stringValue] forKey:@"address"];

    return dictionary;
}

- (void)controlTextDidEndEditing:(CPNotification)anote
{
    [map setAddress:[[anote object] stringValue]];
}

- (void)close:(SEL)aSelector
{
    objj_msgSend(target, saveAndCloseAction, self);
}

- (void)setTarget:(id)aTarget
{
    target = aTarget;
}

- (void)setLocationTitle:(CPString)aTitle
{
    [locationTitle setStringValue:aTitle];
    [locationTitle sizeToFit];
}

- (void)animateToFrame:(CGRect)aTargetFrame willRemove:(BOOL)willRemove
{
    var animationDict = [CPDictionary new];

    [animationDict setValue:self forKey:CPViewAnimationTargetKey];
    [animationDict setValue:[self frame] forKey:CPViewAnimationStartFrameKey];
    [animationDict setValue:aTargetFrame forKey:CPViewAnimationEndFrameKey];
    [animationDict setValue:(willRemove) ? CPViewAnimationFadeOutEffect : CPViewAnimationFadeInEffect forKey:CPViewAnimationEffectKey];
//    [animationDict setValue:nil forKey:CPViewAnimationEffectKey];

    var animation = [[CPViewAnimation alloc] initWithViewAnimations:[animationDict]];

    [animation setDelegate:self];
    [animation startAnimation];
}

- (void)animationDidEnd:(CPAnimation)anAnimation
{
    // this gets called when the fading view (in this case the "edit location view") wants to get removed. kthx
    if ([[anAnimation viewAnimations][0] valueForKey:CPViewAnimationEffectKey] === CPViewAnimationFadeOutEffect)
        [[[anAnimation viewAnimations][0] valueForKey:CPViewAnimationTargetKey] removeFromSuperview];
    //else
      //  [map setHidden:NO];
}

-(void)drawRect:(id)aRect
{
    var context = [[CPGraphicsContext currentContext] graphicsPort];

    CGContextSetStrokeColor(context, [CPColor colorWithHexString:@"000000"]);

    var points = [
                    CGPointMake(50, 80), 
                    CGPointMake(425, 80)
                 ];

    CGContextStrokeLineSegments(context, points, 2);
}

+ (CPTextField)customTextField
{
    var bundle = [CPBundle mainBundle],
        textfield = [[CPTextField alloc] initWithFrame:CGRectMake(50, 15, 425, 52)];
        [textfield setBezeled:YES];
        [textfield setEditable:YES];
        [textfield setFont:[CPFont boldSystemFontOfSize:32]];

        [textfield setValue:[CPColor colorWithWhite:0.6 alpha:1.0] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];
        [textfield setValue:CGInsetMakeZero() forThemeAttribute:@"bezel-inset" inState:CPThemeStateNormal];
        [textfield setValue:CGInsetMake(-1.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateNormal];
        [textfield setVerticalAlignment:CPCenterVerticalTextAlignment];

        var textFieldBackgroundImage = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
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

        [textfield setValue:textFieldBackgroundImage forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled];
        [textfield setValue:textFieldFocusedBackground forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled|CPThemeStateEditing];

    return textfield;
}

+ (CPTextField)customMultiLineTextField
{
    var bundle = [CPBundle mainBundle],
        textfield = [[LPMultiLineTextField alloc] initWithFrame:CGRectMake(50, 130, 425, 80)];
        [textfield setBezeled:YES];
        [textfield setEditable:YES];
        [textfield setFont:[CPFont boldSystemFontOfSize:32]];
        [textfield setTextColor:[CPColor grayColor]];

        [textfield setValue:[CPColor colorWithWhite:0.6 alpha:1.0] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];
        [textfield setValue:CGInsetMakeZero() forThemeAttribute:@"bezel-inset" inState:CPThemeStateNormal];
        [textfield setValue:CGInsetMake(5.0, 10.0, 0.0, 10.0) forThemeAttribute:@"content-inset" inState:CPThemeStateNormal];
        [textfield setVerticalAlignment:CPCenterVerticalTextAlignment];

        var textFieldBackgroundImage = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
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

        [textfield setValue:textFieldBackgroundImage forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled];
        [textfield setValue:textFieldFocusedBackground forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled|CPThemeStateEditing];

    return textfield;
}

+ (CPButton)customBigButton
{
    var bundle = [CPBundle mainBundle],
        button = [[CPButton alloc] initWithFrame:CGRectMake(275.0, 235.0, 200.0, 39.0)],
        bezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-left.png"] size:CGSizeMake(2.0, 39.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-center.png"] size:CGSizeMake(1.0, 39.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-right.png"] size:CGSizeMake(2.0, 39.0)]
            ]
        isVertical:NO]],

        highlightedBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-left-active.png"] size:CGSizeMake(2.0, 39.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-center-active.png"] size:CGSizeMake(1.0, 39.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Buttons/gradient-button-right-active.png"] size:CGSizeMake(2.0, 39.0)]
            ]
        isVertical:NO]]

    [button setValue:[CPFont systemFontOfSize:18.0] forThemeAttribute:@"font" inState:CPThemeStateBordered];
    [button setValue:[CPColor colorWithCalibratedWhite:0.0 / 255.0 alpha:0.9] forThemeAttribute:@"text-color"];
    [button setValue:[CPColor colorWithCalibratedWhite:240.0 / 255.0 alpha:1.0] forThemeAttribute:@"text-shadow-color" inState:CPThemeStateBordered];
    [button setValue:CGSizeMake(0.0, 1.0) forThemeAttribute:@"text-shadow-offset" inState:CPThemeStateBordered];
    [button setValue:CPLineBreakByTruncatingTail forThemeAttribute:@"line-break-mode"];
    
    [button setValue:bezelColor forThemeAttribute:@"bezel-color" inState:CPThemeStateBordered];
    [button setValue:highlightedBezelColor forThemeAttribute:@"bezel-color" inState:CPThemeStateBordered|CPThemeStateHighlighted];
    [button setValue:CGInsetMake(0.0, 5.0, 0.0, 5.0) forThemeAttribute:@"content-inset" inState:CPThemeStateBordered];

    [button setValue:CGSizeMake(0.0, 24.0) forThemeAttribute:@"min-size"];
    [button setValue:CGSizeMake(-1.0, 24.0) forThemeAttribute:@"max-size"];

    return button;
}

@end
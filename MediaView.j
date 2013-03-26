@implementation MediaView : CPView
{
    CPView frontView;
    CPView backView;

    ItemAttachment attachment;
    Item            itemUsed;

    CPView pdfView;
    CPImageView imageView;
    BOOL isFullScreen;

    CPButton fullScreenButton;
    CPButton infoButton;
    CPButton deleteButton;

    CPScrollView scrollView;
}

- (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];

    if (self)
    {
        frontView = [[CPView alloc] initWithFrame:CGRectMake(0,0,aRect.size.width,aRect.size.height)];
        [self addSubview:frontView];
        [frontView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
        //console.log(aRect.size.height);

        scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0,0,aRect.size.width, aRect.size.height - 50)];
        [scrollView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable/*|CPViewMaxXMargin|CPViewMinXMargin|CPViewMinYMargin|CPViewMaxYMargin*/];
        [scrollView setHorizontalLineScroll:.5];
        [scrollView setVerticalLineScroll:.5];
        [frontView addSubview:scrollView];

        var hud = [CPTheme themeNamed:@"Aristo-HUD"];

        [[scrollView verticalScroller] setTheme:hud];
        [[scrollView horizontalScroller] setTheme:hud];

        fullScreenButton = [[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 - 202, aRect.size.height - 35, 125, 24)];
        [fullScreenButton setTitle:@"Full Screen"];
        [fullScreenButton setTheme:hud];
        [fullScreenButton setTarget:self];
        [fullScreenButton setAction:@selector(fullScreen:)];
        [fullScreenButton setKeyEquivalent:"f"];
        [fullScreenButton setKeyEquivalentModifierMask:CPCommandKeyMask];
        [fullScreenButton setAutoresizingMask:CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [frontView addSubview:fullScreenButton];

        infoButton = [[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 - 62, aRect.size.height - 35, 125, 24)];
        [infoButton setTitle:@"Info"];
        [infoButton setTheme:hud];
        [infoButton setTarget:self];
        [infoButton setAction:@selector(info:)];
        [infoButton setKeyEquivalent:"i"];
        [infoButton setKeyEquivalentModifierMask:CPCommandKeyMask];
        [infoButton setAutoresizingMask:CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [frontView addSubview:infoButton];

        deleteButton = [[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 + 77, aRect.size.height - 35, 125, 24)];
        [deleteButton setTitle:@"Delete"];
        [deleteButton setTheme:hud];
        [deleteButton setTarget:self];
        [deleteButton setAction:@selector(confirmDelete:)];
        [deleteButton setAutoresizingMask:CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [frontView addSubview:deleteButton];
    }

    return self;
}

- (void)fullScreen:(id)sender
{
    if ([self isInFullScreenMode])
    {
        // exit full screen
        [self exitFullScreenModeWithOptions:nil];
        [fullScreenButton setTitle:"Full Screen"];
    }
    else
    {
        // enter full screen
        [self enterFullScreenMode:nil withOptions:nil];
        [fullScreenButton setTitle:"Exit Full Screen"];
    }
}

- (void)info:(id)sender
{
    var frame = [frontView frame],
        startPoint = CGPointMake(0, frame.size.height),
        endPoint = CGPointMake(0,0);

    backView = [[MediaInfoView alloc] initWithFrame:CGRectMake(startPoint.x, startPoint.y, frame.size.width, frame.size.height)];
    //[backView setBackgroundColor:[CPColor redColor]];
    [backView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];

    [self addSubview:backView];

    
    var cardFlipController = [LPCardFlipController sharedController],
        centerPoint = [[self window] convertBaseToGlobal:[frontView convertPoint:[frontView center] toView:nil]];

    [cardFlipController setDelegate:self];

    [cardFlipController setStartCenter:centerPoint endCenter:centerPoint];
    [cardFlipController flipWithView:frontView backView:backView reverse:NO];

    //window.setTimeout(function(){[self flipBackToMedia:nil];},1000);

    /*var animation = [[LPViewAnimation alloc] initWithViewAnimations:[
        {
            @"target": backView,
            @"animations": [
                [LPOriginAnimationKey, startPoint, endPoint] // Can also have multiple animations on a single view
            ]
        }
    ]];

    [animation setAnimationCurve:CPAnimationEaseInOut];
    [animation setDuration:0.5];
    [animation setShouldUseCSSAnimations:YES];
    [animation startAnimation];*/
}

- (void)flipBackToMedia:(id)sender
{
    var cardFlipController = [LPCardFlipController sharedController],
        centerPoint = [[self window] convertBaseToGlobal:[backView convertPoint:[backView center] toView:nil]];

    [cardFlipController setDelegate:self];

    [cardFlipController setStartCenter:centerPoint endCenter:centerPoint];
    [cardFlipController flipWithView:backView backView:frontView reverse:NO];
}

- (void)confirmDelete:(id)sender
{
     /*var removeAttachmentSheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0,400,120) styleMask:CPDocModalWindowMask],
        contentView = [removeAttachmentSheet contentView],
        header = [CPTextField labelWithTitle:@"Delete Attachment"];

    [header setFrame:CGRectMake(100,10, 415, 25)];
    [header setFont:[CPFont boldSystemFontOfSize:15]];
    [contentView addSubview:header];
    
    var headerImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"logoPlain.png"] size:CGSizeMake(68,68)];
    var headerImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20, 10, 68, 68)];
    [headerImageView setImage:headerImage];
    [contentView addSubview:headerImageView];
    
    var warningMessage = [[CPTextField alloc] initWithFrame:CGRectMake(100, 35, 325, 60)];
    [warningMessage setStringValue:@"Are you sure you want to this attachment? This action cannot be undone."];
	[warningMessage setLineBreakMode:CPLineBreakByWordWrapping];
    [contentView addSubview:warningMessage];
    
    var removeButton = [[CPButton alloc] initWithFrame:CGRectMake(285, 85, 100, 24)];
    [removeButton setTitle:@"Remove"];
    [removeButton setTag:0];
    [removeButton setTarget:self];
    [removeButton setAction:@selector(closeSheet:)];
    [contentView addSubview:removeButton];
    
    var cancelButton = [[CPButton alloc] initWithFrame:CGRectMake(175, 85, 100, 24)];
    [cancelButton setTag:-1];
    [cancelButton setTitle:@"Cancel"];
    [cancelButton setTarget:self];
    [cancelButton setAction:@selector(closeSheet:)];
    [contentView addSubview:cancelButton];
    [removeAttachmentSheet setDefaultButton:cancelButton];

    [CPApp beginSheet:removeAttachmentSheet modalForWindow:[self window] modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:self];
    */

    var alert = [[CPAlert alloc] init];
//    [alert setWindowStyle:CPHUDBackgroundWindowMask];
    [alert setTitle:"Delete Attachment"];
    [alert setDelegate:self];
    [alert setAlertStyle:CPWarningAlertStyle];
    [alert setMessageText:"Delete Attachment"];
    [alert setInformativeText:"Are you sure you want to delete "+ [attachment name] +"? This action cannot be undone."];
    [alert addButtonWithTitle:"Delete"];
    [alert addButtonWithTitle:"Cancel"];

    [alert runModal];

}

-(void)alertDidEnd:(CPAlert)theAlert returnCode:(int)returnCode
{
    if (returnCode)
        return;

    [itemUsed removeAttachment:attachment];
    [[self window] orderOut:self];
}

- (void)setMedia:(ItemAttachment)anAttachment forItem:(Item)anItem
{
    attachment = anAttachment;
    itemUsed = anItem;

    var type = [attachment type];

    switch (type)
    {
        case "image":
                var imageView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,1000,1000)],
                    image = [[CPImage alloc] initWithContentsOfFile:[anAttachment data] size:CGSizeMake(1000,1000)];
                [imageView setImage:image];

                [scrollView setDocumentView:imageView];

                break;
        case "pdf":

                var webview = [[CPWebView alloc] initWithFrame:[scrollView frame]]//CGRectMake(0,0,)];
                [webview setMainFrameURL:"mysamplepdf.pdf"];//[anAttachment data]];
                [webview setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
                [scrollView removeFromSuperview];
                [frontView addSubview:webview];

                break;
        case "video":
                break;
        case "audio":
                break;
        case "document":
                break;
        case "other":
                break;
    }
}

- (void)keyDown:(CPEvent)anEvent
{
    if ([anEvent keyCode] === CPEscapeKeyCode && [self isInFullScreenMode])
        [self fullScreen:nil];

}

- (BOOL)acceptsFirstResponder
{
    return YES;
}


- (void)cardFlipDidFinish:(id)sender
{
    [[sender frontView] removeFromSuperview];
    [self addSubview:[sender backView]];
    [[sender backView] setFrameOrigin:CGPointMakeZero()];

}

@end

@implementation MediaInfoView : CPView
{
    CPTextField nameField;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        var nameLabel = [[CPTextField alloc] initWithFrame:CGRectMake(30,30,30,30)];
        [nameLabel setStringValue:"File Name:"];
        [nameLabel sizeToFit];
        [nameLabel setAlignment:CPRightTextAlignment];
        [nameLabel setTextColor:[CPColor whiteColor]];
        [self addSubview:nameLabel];

        nameField = [LocationEditView customTextField];
        [nameField setFrame:CGRectMake(CGRectGetMaxX([nameLabel frame]) + 5, 25, 165, 30)];
        [nameField setFont:[CPFont systemFontOfSize:12]];
        [nameField setTextColor:[CPColor whiteColor]];
        [self addSubview:nameField];
    }

    return self;
}

@end

@implementation NoLocationView : CPView
{

}

- (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];

    if (self)
    {
        [self setBackgroundColor:[CPColor colorWithHexString:@"EEEEEE"]];
        var title = [CPTextField new];
        [title setStringValue:@"No Location Selected"];
        [title setFont:[CPFont boldSystemFontOfSize:36]];
        [title sizeToFit];
        [title setCenter:CGPointMake(CGRectGetMidX(aRect), 60)];
        [title setAutoresizingMask:CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [title setTextColor:[CPColor colorWithHexString:@"555555"]];
        [title setTextShadowColor:[CPColor whiteColor]];
        [title setTextShadowOffset:CGSizeMake(0,2)];

        [self addSubview:title];

        var bundle = [CPBundle mainBundle],
            wellBackground = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:
            [
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/1.png"] size:CGSizeMake(14.0, 13.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/2.png"] size:CGSizeMake(9.0, 13.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/3.png"] size:CGSizeMake(10.0, 13.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/4.png"] size:CGSizeMake(14.0, 7.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/5.png"] size:CGSizeMake(6.0, 7.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/6.png"] size:CGSizeMake(10.0, 7.0)],
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/7.png"] size:CGSizeMake(14.0, 8.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/8.png"] size:CGSizeMake(9.0, 8.0)], 
                [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"WellView/9.png"] size:CGSizeMake(10.0, 8.0)]
            ]]],
            wellView = [LocationEditView customBigButton];//[[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 - 25, 90, 55, 50)];

        [wellView setFrame:CGRectMake((aRect.size.width / 2 - 25) - 91, 90, 84, 39)];
        // wellBackground = [CPColor colorWithPatternImage:wellBackground];
        // [wellView setBackgroundColor:wellBackground];
        // [wellView setHasShadow:YES];
        [wellView setAutoresizingMask:CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [wellView setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"SignPost.png"] size:CGSizeMake(32,32)]];
        // [wellView setImageScaling:CPScaleNone];
        // [wellView setImageScaling:CPImageOverlaps];
        [wellView setImagePosition:CPImageOnly];
        [wellView setTarget:[CPApp delegate]];
        [wellView setAction:@selector(addNewLocation:)];
        [self addSubview:wellView];

        var wellView = [LocationEditView customBigButton];//[[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 - 25, 90, 55, 50)];
        [wellView setFrame:CGRectMake(aRect.size.width / 2 - 25, 90, 84, 39)];
        [wellView setAutoresizingMask:CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [wellView setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"help.png"] size:CGSizeMake(32,32)]];
        [wellView setImagePosition:CPImageOnly];
        [self addSubview:wellView];



        var wellView = [LocationEditView customBigButton];//[[CPButton alloc] initWithFrame:CGRectMake(aRect.size.width / 2 - 25, 90, 55, 50)];

        [wellView setFrame:CGRectMake(aRect.size.width / 2 - 25 + 91, 90, 84, 39)];
        [wellView setAutoresizingMask:CPViewMaxYMargin|CPViewMinXMargin|CPViewMaxXMargin];
        [wellView setImage:[[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"iPhoneIcon.png"] size:CGSizeMake(32,32)]];
        [wellView setImagePosition:CPImageOnly];
        [self addSubview:wellView];


        var wellView = [[CPView alloc] initWithFrame:CGRectMake(50, 300, aRect.size.width - 100, 90)],
            wellLabel = [[CPTextField alloc] initWithFrame:CGRectMake(53, 285, 0,0)];

        [wellLabel setFont:[CPFont systemFontOfSize:12.0]];
        [wellLabel setTextColor:[CPColor colorWithHexString:@"555555"]];
        [wellLabel setTextShadowColor:[CPColor whiteColor]];
        [wellLabel setTextShadowOffset:CGSizeMake(0,1)];
        [wellLabel setStringValue:"Import Queue"];
        [wellLabel sizeToFit];

        [wellView setBackgroundColor:wellBackground];
        [wellView setAutoresizingMask:CPViewWidthSizable];
        [self addSubview:wellLabel];
        [self addSubview:wellView];

    }

    return self;
}

@end
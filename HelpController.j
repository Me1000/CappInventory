@implementation HelpController : CPObject
{
    CPPanel helpWindow;
    CPWebView webview;
}

- (void)showHelp:(id)sender
{
    if (!helpWindow)
    {
        helpWindow = [[CPPanel alloc] initWithContentRect:CGRectMake(0,0,465,450) styleMask:CPClosableWindowMask];
        [helpWindow setTitle:"Iguana Help"];
    }

    [helpWindow center];
    [helpWindow orderFront:nil];
}

@end
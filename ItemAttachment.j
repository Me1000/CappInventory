@implementation ItemAttachment : CPObject
{
    CPString name @accessors;
    CPString type @accessors;
    CGSize   displaySize @accessors;
    CPString data @accessors; // Data can either be a base64 encoded rep, or a link (most likely a link)
    CPString globalID @accessors;

    DCFileUploadManager uploadManager @accessors;
    CPView   representedView @accessors;

    CPString errorString;
}

- (id)init
{
    self = [super init];

    if (self)
    {
        name = "";
        type = "";
        displaySize = CGSizeMakeZero();
        data = "";
        globalID = [CPString UUID];
        isUploading = NO;
    }

    return self;
}

- (CPString)type
{
    if (type)
        return type;

    if ([data substringWithRange:CPMakeRange(0,10)] === "data:image")
    {
        type = "image";
        saveAppData();
        return "image";
    }

    return "other";
}

- (void)fileUploadDidEnd:(DCFileUpload)anUpload withResponse:(CPString)reply
{
    try
    {
        var reply = JSON.parse(reply);

        if (reply.error)
        {
            var error = [[CPAlert alloc] init];
            [error setAlertStyle:CPCriticalAlertStyle];
            [error setTitle:reply.error];
            [error setDelegate:self];
            [error setMessageText:reply.error];
            [error setInformativeText:reply.errorMessage + " Please try again or report it."];
            [error addButtonWithTitle:"Okay"];
            [error addButtonWithTitle:"Report"];
            errorString = reply.error + ": " + reply.error;
        }
    }
    catch (e)
    {
        var error = [[CPAlert alloc] init];

        [error setAlertStyle:CPCriticalAlertStyle];
        [error setTitle:"Server Error"];
        [error setDelegate:self];
        [error setMessageText:"Server Error"];
        [error setInformativeText:"There was an unknown error while uploading your attachment, please try again or report it."];
        [error addButtonWithTitle:"Okay"];
        [error addButtonWithTitle:"Report"];

        errorString = e +": " + reply;
    }

    [self setName:anUpload.name];
    [self setData:reply.data];
    [self setType:"image"];
    [representedView setRepresentedObject:self];
    //saveAppData();
}

- (void)alertDidEnd:(CPAlert)theAlert returnCode:(int)returnCode
{
    if (returnCode === 1)
    {
        // FIX ME: implement this
        alert("let the user send a report or something dude...");
    }
}

- (void)fileUploadManagerDidChange:(DCFileUploadManager)aManager
{
    var upload = [aManager fileUploads][0];

    [representedView setProgress:[upload progress]];
}

- (JSObject)toJSON
{
    var object = { };
    object.name = name;
    object.displaySize = displaySize;
    object.globalID = globalID;
    object.data = data;
    object.type = type;
    
    return object;
}

+ (id)decodeJSON:(JSObject)anObject
{
    var attachment = [[ItemAttachment alloc] init];
    [attachment setName:anObject.name];
    [attachment setDisplaySize:anObject.displaySize];
    [attachment setGlobalID:anObject.globalID];
    [attachment setData:anObject.data];
    [attachment setType:anObject.type];

    return attachment;
}

@end

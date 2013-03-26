var SharedManager;

@implementation ItemAttachmentManager : CPObject
{
}

/*+ (ItemAttachmentManager)sharedManager
{
    if (!SharedManager)
        SharedManager = [[ItemAttachmentManager alloc] init];

    return SharedManager;
}

- (ItemAttachment)attachmentForObject:(ItemAttachment)anAttachment
{
    // check the cached version first
    // get it from the tubes
}

- (void)openAttachment:(ItemAttachment)anAttachment
{
    var newWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(50, 75, 520, 400) styleMask:CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask];

    [newWindow center];
    [newWinodw orderFront:self];
}

- (CPImage)thumbnailForAttachment:(ItemAttachment)anAttachment
{
    if ([anAttachment type] === "png" || [anAttachment type] === "gif" || [anAttachment type] === "jpg")
    {
        // give me a thumbnail
    }
}

- (id)cacheAttachment:(ItemAttachment)anAttachment
{
    if (![RLOfflineDatabaseStore offlineDataStoreIsAvailable])
        return;

    var storage = [[RLOfflineDatabaseStore alloc] - (id)initWithName:"InventoryFileCache" delegate:self];
    var data = [storage getValueForKey:@"InventoryData"];
}

- (void)userDidRejectDatabase
{
    alert("In order to use local caching for faster file access and offline accesability you need to accept the database.");
}

- (void)didReciveData:(CPString)fileData
{
    
}*/

@end

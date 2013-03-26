@implementation ItemController : CPObject
{
    LocationController  locationController;
    Item                activeItem @accessors;
    ItemView            itemView;
}

- (id)initWithItemView:(CPView)aView locationController:(id)aController
{
    self = [super init];

    if (self)
    {
        itemView = aView;
        [itemView setItemController:self];
        locationController = aController;

        [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshItem:) name:ItemAttachmentsDidChangeNotification object:nil];
    }

    return self;
}

- (void)refreshItem:(CPNotification)aNote
{
    var object = [aNote object];
    if (object === activeItem)
    {
        [itemView.attachmentsCollectionView reloadContent];
        [locationController refreshItemData];
    }
}

- (void)setItem:(Item)anItem
{
    activeItem = anItem;
    [itemView setItem:activeItem];
}

- (void)saveIfNeeded
{
    if ([itemView isEditing])
        [self itemDidEndEditing:[itemView itemForEditingValues]]; 
}

- (void)itemDidEndEditing:(Item)newItem
{
    var //index = activeItem,//[[[locationView itemTableView] selectedRowIndexes] firstIndex],
        //item =  [location items][index],
        copiedObject = [activeItem copy];

    [activeItem setName:[newItem name]];
    [activeItem setMake:[newItem make]];
    [activeItem setModel:[newItem model]];
    [activeItem setPrice:[newItem price]];
    [activeItem setNotes:[newItem notes]];
    [activeItem setDateAcquired:[newItem dateAcquired]];
    [activeItem setTags:[newItem tags]];
    [activeItem setExtras:[newItem extras]];

    //[[locationView collectionView] reloadContent];
    //[[locationView itemTableView] reloadData];
    [locationController refreshItemData]

    // register the undo
    var dict = [CPDictionary dictionaryWithObjects:[activeItem, copiedObject] forKeys:[@"oldItem", @"newItem"]];
        [[[CPApp delegate] undoManager] registerUndoWithTarget:[locationController location] selector:@selector(replaceItemWithItem:) object:dict];
}

/*- (void)enterEditMode:(BOOL)aFlag
{
    [itemView enterEditMode:YES];
}*/

/*- (void)fileUpload:(DCFileUpload)anUpload didReceiveResponse:(CPString)aString
{
    alert();
    var data = JSON.parse(aString),
        item = [[ItemAttachment alloc] init];

    [item setName:data.name];
    [item setType:data.type];
    [item setData:data.data];

    [[locationView itemView] addAttachment:item fromUpload:anUpload];
    [[locationView itemTableView] reloadData];
}*/

- (void)fileDropUploadController:(DCFileDropController)theController setState:(BOOL)visible 
{
	/*if (visible)
		[dropCover draggingEntered:nil]
    else
		[dropCover draggingExited:nil];*/
}

- (DCFileUploadManager)newUploadManager:(DCFileUploadController)aController
{
    // create new attachment object
    var newAttachment = [[ItemAttachment alloc] init],
    // create new upload manager
        manager = [[DCFileUploadManager alloc] init];
    // assign upload manager to the attachment object
    [newAttachment setName:@"Uploading..."];
    [newAttachment setUploadManager:manager];
    [manager setDelegate:newAttachment];

    // add new attachment object to collectionview
    var allAttachments = [activeItem attachments]; 
    [allAttachments addObject:newAttachment];
//    [itemView.attachmentsCollectionView setContent:allAttachments];
    [itemView.attachmentsCollectionView reloadContent];
    // profit?

    return manager;
}

- (void)managerDidUpload:(DCFileUploadManager)anUpload
{
    //var attachment = [anUpload delegate];
        //currentItem = [locationController currentItem];
    // add this to the item object now that we know it was successful
    //[itemController addAttachment:attachment];
    [locationController refreshItemData];
}


- (void)addAttachment:(id)anAttachment
{
    [activeItem addAttachment:anAttachment];
    [locationController refreshItemData];
}

@end
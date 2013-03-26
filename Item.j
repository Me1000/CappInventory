
ItemAttachmentsDidChangeNotification = "ItemAttachmentsDidChangeNotification";

@implementation Item : CPObject
{
    CPString name @accessors; //
    CPString make @accessors; //
    CPString model @accessors; //
    CPString notes @accessors;
    CPString serial @accessors;
    CPDate   dateAcquired @accessors; //
    double   price @accessors; //
    CPArray  attachments @accessors; 
    CPArray  tags @accessors; //
    CPDictionary extras @accessors; //
}

- (id)initWithName:(CPString)aName
{
    self = [super init];

    if (self)
    {
        name = aName;
        make = "Unknown";
        model = "";
        notes = "";
        serial = ""
        dateAcquired = [CPDate date];
        attachments = [ ];
        tags = [ ];
        extras = [CPDictionary dictionary];
    }

    return self;
}

- (void)addAttachment:(ItemAttachment)anAttachment
{
    [attachments addObject:anAttachment];
}

- (void)removeAttachment:(ItemAttachment)anAttachment
{
    [attachments removeObject:anAttachment];
    [[CPNotificationCenter defaultCenter] postNotificationName:ItemAttachmentsDidChangeNotification object:self userInfo:nil];
    saveAppData();

    // FIX ME: delete it from the server too
}

- (void)setObject:(id)aValue forExtrasKey:(CPString)aKey
{
    [extras setObject:aValue forKey:aKey];
}

- (id)valueForExtrasWithKey:(CPString)aKey
{
    return [extras objectValueForKey:aKey];
}

- (BOOL)isEqual:(id)anObject
{
    if ([anObject class] === [self class])
    {
        var one = ([name isEqual:[anObject name]] && [make isEqual:[anObject make]] && [model isEqual:[anObject model]] && [notes isEqual:[anObject notes]] && [make isEqual:[anObject make]] && price === [anObject price] && [attachments isEqual:[anObject attachments]] && [tags isEqual:[anObject tags]] && [extras isEqual:[anObject extras]]);
        if (one)
        {
            if (dateAcquired)
                return [dateAcquired isEqual:[anObject dateAcquired]];
            else
                return YES;
        }
    }

    return NO;
}

- (Item)copy
{
    var newItem = [[Item alloc] initWithName:name];
    [newItem setMake:make];
    [newItem setModel:model];
    [newItem setNotes:notes];
    [newItem setDateAcquired:[dateAcquired copy]];
    [newItem setPrice:price];
    [newItem setSerial:serial];
    [newItem setAttachments:[attachments copy]];
    [newItem setTags:[tags copy]];
    [newItem setExtras:[extras copy]];




    return newItem;
}

- (CPString)toJSON
{
    var object = { };

    object.name = name;
    object.attachments = attachments;
    object.make = make;
    object.model = model;
    object.price = price;
    object.serial = serial;
    object.notes = notes;
    object.dateAcquired = [dateAcquired toJSON];
    object.tags = tags;
    object.extras = [extras toJSON];

    return object;
}

+ (Location)decodeJSON:(Object)anObject
{
    var item = [[Item alloc] initWithName:anObject.name];
    [item setMake:anObject.make];
    [item setModel:anObject.model];
    [item setPrice:anObject.price];
    [item setNotes:anObject.notes];
    [item setSerial:anObject.serial];
    [item setDateAcquired:[CPDate decodeJSON:anObject.dateAcquired]];

    if (anObject.tags)
        [item setTags:anObject.tags];
    else
        [item setTags:[ ]];

    if (anObject.attachments)
    {
        var decoded = [ ];
        for (var i = 0; i < anObject.attachments.length; i++)
        {
            var anAttachment = [ItemAttachment decodeJSON:anObject.attachments[i]];
            decoded.push(anAttachment);
        }

        [item setAttachments:decoded];
    }
    else
        [item setAttachments:[ ]];

    [item setExtras:[CPDictionary dictionaryWithJSObject:anObject.extras]];

    return item;
}
@end

@implementation CPDate (json)
- (CPString)toJSON
{
    return self.getTime();
}

+ (CPDate)decodeJSON:(Object)anObject
{
    self = [CPDate date];
    self.setTime(anObject);
    return self;
}
@end

@implementation CPDictionary (json)
- (CPString)toJSON
{
    var object = { },
        keys = [self allKeys],
        values = [self allValues];

    for (var i = 0; i < [keys count] ; i++)
            object[keys[i]] = values[i];

    return object;
}
@end
/*objj_class.prototype.toJSON = objj_object.prototype.toJSON = function()
{
    if (this.isa && class_getInstanceMethod(this.isa, "toJSON") != NULL)
        return [this toJSON];
    else
        return String(this) + " (-toJSON not implemented)";
}
*/
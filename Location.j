@implementation Location : CPObject
{
    id       superLocation @accessors;
    CPString name @accessors;
    CPString type @accessors;
    CPString address @accessors;
    CPArray  subLocations @accessors;
    CPArray  items @accessors;
}

- (id)initWithName:(CPString)aName
{
    self = [super init];

    if (self)
    {
        name = aName;
        subLocations = [ ];
        items = [ ];
        type = "";
        address = "";
        superLocation = nil;
    }

    return self;
}

- (void)addSubLocation:(Location)aLocation atIndex:(int)anIndex
{
    [aLocation setSuperLocation:self];
    [subLocations insertObject:aLocation atIndex:anIndex];
}

- (void)addSubLocation:(Location)aLocation
{
    [self addSubLocation:aLocation atIndex:subLocations.length];
}

- (void)removeSubLocation:(Location)aLocation
{
    [aLocation setSuperLocation:nil];
    [subLocations removeObject:aLocation];
}

- (void)moveItemAtIndex:(int)fromIndex toIndex:(int)toIndex
{

    if (toIndex > fromIndex)
        toIndex--;

    if (fromIndex === toIndex)
        return;

    var temp = items[fromIndex];

    [items removeObjectAtIndex:fromIndex];
    [items insertObject:temp atIndex:toIndex];


    var invoke = [CPInvocation invocationWithMethodSignature:@"moveItemAtIndex:toIndex:"];
    [invoke setTarget:self];
    [invoke setSelector:@selector(moveItemAtIndex:toIndex:)];
    [invoke setArgument:toIndex atIndex:2];
    [invoke setArgument:fromIndex atIndex:3];


    var appController = [CPApp delegate];

    [[appController locationController] refreshItemData] 
    [[appController undoManager] registerUndoWithTarget:invoke selector:@selector(invoke) object:nil];
}

- (int)indexOfSubLocation:(Location)aLocation
{
    return [subLocations indexOfObject:aLocation];
}

- (void)addItem:(Item)anItem
{
    [items addObject:anItem];
}

- (void)removeItem:(Item)anItem
{
    [items removeObjectIdenticalTo:anItem];
}

- (Item)itemAtIndex:(int)anIndex
{
    return [items objectAtIndex:anIndex];
}

- (int)numberOfItems
{
    return [items count];
}

- (void)replaceItemWithItem:(CPDictionary)undoItems
{
    var oldItem = [undoItems valueForKey:@"oldItem"],
        newItem = [undoItems valueForKey:@"newItem"],
        controller = [[CPApp delegate] locationController],
        locationView = [controller locationView];

    [items replaceObjectAtIndex:[items indexOfObject:oldItem] withObject:newItem];
    [controller refreshItemData];

    //now select that item we just added if it exists... 
    var selectIndex = [items indexOfObject:newItem];
    if (selectIndex !== -1)
    {
        [[locationView itemTableView] selectRowIndexes:[CPIndexSet indexSetWithIndex:selectIndex] byExtendingSelection:NO];
        [locationView setActiveItem:newItem];
    }

    var dict = [CPDictionary dictionaryWithObjects:[newItem, oldItem] forKeys:[@"oldItem", @"newItem"]];
    [[[CPApp delegate] undoManager] registerUndoWithTarget:self selector:@selector(replaceItemWithItem:) object:dict];
}

- (CPDictionary)dictionaryValues
{
    var dictionary = [CPDictionary new];

    [dictionary setValue:name forKey:@"name"];
    [dictionary setValue:type forKey:@"type"];
    [dictionary setValue:address forKey:@"address"];

    return dictionary;
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super init];

    if (self)
    {
        name = [aCoder decodeObjectForKey:@"LocationName"];
        type = [aCoder decodeObjectForKey:@"LocationType"];
        address = [aCoder decodeObjectForKey:@"LocationAddress"];
        subLocations = [aCoder decodeObjectForKey:@"LocationSubLocations"];
        superLocation = [aCoder decodeObjectForKey:@"LocationSuperLocation"];
    }

    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [aCoder encodeObject:name forKey:@"LocationName"];
    [aCoder encodeObject:type forKey:@"LocationType"];
    [aCoder encodeObject:address forKey:@"LocationAddress"];
    [aCoder encodeObject:subLocations forKey:@"LocationSubLocations"];
    [aCoder encodeObject:superLocation forKey:@"LocationSuperLocation"];
}

- (BOOL)isEqual:(id)anObject
{
    if ([anObject class] === [self class])
        return ([name isEqual:[anObject name]] && [type isEqual:[anObject type]] && [address isEqual:[anObject address]] && [subLocations isEqual:[anObject subLocations]]);
    else
        return NO;
}

- (Location)copy
{
    var item = [super copy];
    [item setSuperLocation:superLocation];
    [item setName:name];
    [item setType:type];
    [item setAddress:address];
    [item setSubLocations:subLocations];

    return item;
}

- (CPString)toJSON
{
    var object = { };

    object.name = name;
    object.type = type;
    object.address = address;
    object.subLocations = subLocations;
    object.items = items;

    return object;
}

+ (Location)decodeJSON:(Object)anObject
{
    var item = [[Location alloc] initWithName:anObject.name];

    [item setType:anObject.type];

    if (![item type])
        [item setType:""];

    [item setAddress:anObject.address];

    for (var i = 0; i < anObject.subLocations.length; i++)
    {
        var subItem = [Location decodeJSON:anObject.subLocations[i]];
        [item addSubLocation:subItem];
    }

    for (var i = 0; i < anObject.items.length; i++)
    {
        var anItem = [Item decodeJSON:anObject.items[i]];
        [item addItem:anItem];
    }

    return item;
}
@end

objj_class.prototype.toJSON = objj_object.prototype.toJSON = function()
{
    if (this.isa && class_getInstanceMethod(this.isa, "toJSON") != NULL)
        return [this toJSON];
    else
        return String(this) + " (-toJSON not implemented)";
}

@implementation RLFileWrapper : CPObject
{
    CPDictionary _fileAttributes @accessors;
    CPString _filename @accessors;
    CPString _preferredFilename @accessors;
    CPData _contentData @accessors;
}

@end
@import <AppKit/CPPanel.j>

/*

DCFileDropControllerDropDelegate protocol
- (void)fileDropUploadController:(DCFileDropController)theController setState:(BOOL)visible;

*/

DCFileDropableTargets = [ ];

@implementation DCFileDropController : CPObject {
	CPView view @accessors;
    CPArray validFileTypes @accessors;

	id dropDelegate;
	CPURL uploadURL;
	id uploadManager;
	
	CPView _overView;
}

- (id)initWithView:(CPView)theView dropDelegate:(id)theDropDelegate uploadURL:(CPURL)theUploadURL uploadManager:(id)theUploadManager {
	return [self initWithView:theView dropDelegate:theDropDelegate uploadURL:theUploadURL uploadManager:theUploadManager insertAsFirstSubview:NO];
}

- (id)initWithView:(CPView)theView dropDelegate:(id)theDropDelegate uploadURL:(CPURL)theUploadURL uploadManager:(id)theUploadManager insertAsFirstSubview:(BOOL)shouldInsertAsFirstSubview {
	self = [super init];

	view = theView;
	dropDelegate = theDropDelegate;
	uploadURL = theUploadURL;
	uploadManager = theUploadManager;
	
	_overView = [[CPView alloc] initWithFrame:CGRectMake(0,0,[theView frame].size.width,[theView frame].size.height)];
	[_overView setBackgroundColor:[CPColor clearColor]];
	[_overView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
	[_overView setHitTests:NO];
	[_overView setHidden:YES];

	[self setFileDropState:NO];
	
	[DCFileDropableTargets addObject:_overView._DOMElement];
	
	theView._DOMElement.addEventListener("dragenter", function (event) {
		event.preventDefault();
		event.dataTransfer.dropEffect = "copy"; 
		[self fileDraggingEntered:event];
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);
	
	theView._DOMElement.addEventListener("dragover",function(event) {
		event.preventDefault();
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);

	_overView._DOMElement.addEventListener("dragover", function (event) {
		event.preventDefault();
		event.dataTransfer.dropEffect = "copy"; 
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);
	
	
	window.document.addEventListener("dragover", function(event) {
		event.preventDefault();
		if (window.navigator.userAgent.indexOf("AppleWebKit") != -1)
			if(![DCFileDropableTargets containsObject:event.toElement])
				event.dataTransfer.dropEffect = "none"; 
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);
	
	
	window.document.addEventListener("drop", function(event) { 
		event.preventDefault();
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);
	
	theView._DOMElement.addEventListener("drop", function(event) {
		event.preventDefault();
		[self fileDropped:event.dataTransfer.files];
		[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
	}, YES);
	
	if (window.navigator.userAgent.indexOf("AppleWebKit") != -1) {
		_overView._DOMElement.addEventListener("dragleave", function (event) { 
			event.preventDefault()
			event.dataTransfer.dropEffect = "none"; 
			[self fileDraggingExited:event];
			[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
		}, YES);		
	}
	else {
		theView._DOMElement.addEventListener("dragleave", function (event) { 
			event.preventDefault()
			event.dataTransfer.dropEffect = "none"; 
			[self fileDraggingExited:event];
			[[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
		}, YES);
	}
	

	return self;
}

- (BOOL)validateDraggedFiles:(FileList)files
{
    if (![validFileTypes count])
        return YES;

    for (var i = 0; i < files.length; i++)
    {
        // we really can only check the filename :(
        var filename = files.item(i).fileName,
            type = [filename pathExtension];

        return [validFileTypes containsObject:type];
    }

    return YES;
}

- (void)setFileDropState:(BOOL)visible {
	if ([view respondsToSelector:@selector(fileDropUploadController:setState:)]) {
		[view fileDropUploadController:self setState:visible];
	}
}

- (void)fileDraggingEntered:(id)sender {
	[self setFileDropState:YES];
	[_overView setFrame:CGRectMake(0,0,[view frame].size.width,[view frame].size.height)];
	[_overView setHidden:NO];
	if (window.navigator.userAgent.indexOf("AppleWebKit") != -1)
		[view addSubview:_overView];
}

- (void)fileDraggingExited:(id)sender {
	[self setFileDropState:NO];
	[_overView setHidden:YES];
}

- (void)fileDropped:(id)files {

	[self setFileDropState:NO];
	[_overView setHidden:YES];


	for(var i = 0, len = files.length; i < len; i++) {

        if ([dropDelegate respondsToSelector:@selector(newUploadManager:)])
            managerToUse = [dropDelegate newUploadManager:self] || uploadManager;
        else
            managerToUse = uploadManager;

        [managerToUse setEndDelegate:dropDelegate];

		if ([managerToUse respondsToSelector:@selector(fileUploadWithFile:uploadURL:)])
        {
			var upload = [managerToUse fileUploadWithFile:files[i] uploadURL:uploadURL];

            if ([dropDelegate respondsToSelector:@selector(fileDropController:didBeginUpload:)])
                [dropDelegate fileDropController:self didBeginUpload:upload];
        }
        
	}

    // now clear the input 
//    fileInput.value = nil;
}
@end
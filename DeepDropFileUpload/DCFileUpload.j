@import <AppKit/CPPanel.j>

/*

DCFileUploadDelegate protocol
- (void)fileUploadDidBegin:(DCFileUpload)theController;
- (void)fileUploadProgressDidChange:(DCFileUpload)theController;
- (void)fileUploadDidEnd:(DCFileUpload)theController;

*/

@implementation DCFileUpload : CPObject {
	CPString name @accessors;
	float progress @accessors;
	id delegate @accessors;
	CPURL uploadURL @accessors;

	id file;
	var xhr;
	BOOL isUploading;
    CPString response @accessors;
}

- (id)initWithFile:(id)theFile {
	self = [super init];
	file = theFile;
	progress = 0.0;
	isUploading = NO;
	return self;
}

- (void)begin {
	[self processXHR];
}

- (void)processXHR {
	xhr = new XMLHttpRequest();

	var fileUpload = xhr.upload;
	
	fileUpload.addEventListener("progress", function(event) {
		if (event.lengthComputable) {
			[self setProgress:event.loaded / event.total];
			[self fileUploadProgressDidChange];
		}
	}, false);
	
	fileUpload.addEventListener("error", function(evt) {
		CPLog("error: " + evt);
	}, false);

    xhr.addEventListener("load", function(evt) {
        if (xhr.responseText)
            [self fileUploadDidEndWithResponse:xhr.responseText];
    }, NO);

	xhr.open("POST", [uploadURL absoluteURL]);
	xhr.setRequestHeader("If-Modified-Since", "Mon, 26 Jul 1997 05:00:00 GMT");
	xhr.setRequestHeader("Cache-Control", "no-cache");
	xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
	xhr.setRequestHeader("X-File-Name", file.fileName);
	xhr.setRequestHeader("X-File-Size", file.fileSize);
	xhr.setRequestHeader("Content-Type", "multipart/form-data");
	xhr.send(file);

	[self fileUploadDidBegin];
};

- (void)fileUploadDidBegin {
	isUploading = YES;
	if ([delegate respondsToSelector:@selector(fileUploadDidBegin:)]) {
		[delegate fileUploadDidBegin:self];
	}
}

- (void)fileUploadProgressDidChange {
	isUploading = YES;
	if ([delegate respondsToSelector:@selector(fileUploadProgressDidChange:)]) {
		[delegate fileUploadProgressDidChange:self];
	}
}

- (void)fileUploadDidEndWithResponse:(CPString)aReply{
	isUploading = NO;
	if ([delegate respondsToSelector:@selector(fileUploadDidEnd:withResponse:)])
		[delegate fileUploadDidEnd:self withResponse:aReply];
}

- (BOOL)isUploading {
	return isUploading;
}

- (void)cancel {
	isUploading = NO;
	xhr.abort();
}

@end

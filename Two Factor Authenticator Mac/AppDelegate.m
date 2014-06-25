//
//  AppDelegate.m
//  Two Factor Authenticator Mac
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import "AppDelegate.h"
#import "TokenViewController.h"

@implementation AppDelegate {
    NSArray *_viewControllers;

    NSAlert *_addByQRCodeAlert;

    ScreenCaptureWindowController *_screenCaptureController;
}

- (id)init {
    if (self = [super init]) {
        _viewControllers = @[[self make], [self make]];
    }
    return self;
}

- (TokenViewController *)make {
    TokenViewController *controller = [[TokenViewController alloc] init];
    [controller loadView];
    return controller;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_viewControllers count];
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSTextField *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
//
//    // There is no existing cell to reuse so create a new one
//    if (result == nil) {
//
//        // Create the new NSTextField with a frame of the {0,0} with the width of the table.
//        // Note that the height of the frame is not really relevant, because the row height will modify the height.
//        result = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 50, 10)];
//
//        // The identifier of the NSTextField instance is set to MyView.
//        // This allows the cell to be reused.
//        result.identifier = @"MyView";
//    }
//
//    // result is now guaranteed to be valid, either as a reused cell
//    // or as a new cell, so set the stringValue of the cell to the
//    // nameArray value at row
//    result.stringValue = @"test";
//
//    // Return the result
//    return result;
    return [[_viewControllers objectAtIndex:row] view];
}

- (IBAction)addByQRCode:(id)sender {
    if (_screenCaptureController == nil) {
        _screenCaptureController = [[ScreenCaptureWindowController alloc] init];
        _screenCaptureController.delegate = self;
    }
    NSAlert *alert = [[NSAlert alloc] init];
    _addByQRCodeAlert = alert;
    [alert setMessageText:@"Please drag a rectangle over the QR code"];
    [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse result) {
        [_screenCaptureController start];
    }];

}

- (IBAction)addBySecretKey:(id)sender {
    if (_screenCaptureController == nil) {
        _screenCaptureController = [[ScreenCaptureWindowController alloc] init];
        _screenCaptureController.delegate = self;
    }
    [NSApp beginSheet:self.addByKeyWindow modalForWindow:self.window modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];

    [_screenCaptureController start];
}

- (IBAction)didAddBySecretKey:(id)sender {
    [NSApp endSheet:self.addByKeyWindow];
}

- (IBAction)didCancelAddBySecretKey:(id)sender {
    [NSApp endSheet:self.addByKeyWindow];
}

- (void)didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    [sheet orderOut:self];
}

- (void)capturedImage:(NSImage *)image {
    [[_addByQRCodeAlert window] orderOut:self];
}


- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    NSView *view = [[_viewControllers objectAtIndex:row] view];
    [view layoutSubtreeIfNeeded];
    return view.frame.size.height;
}




@end

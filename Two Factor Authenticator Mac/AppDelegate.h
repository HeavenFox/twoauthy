//
//  AppDelegate.h
//  Two Factor Authenticator Mac
//
//  Created by Jingsi Zhu on 6/17/14.
//
//

#import <Cocoa/Cocoa.h>
#import "ScreenCaptureWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate, ScreenCaptureWindowControllerDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSWindow *addByKeyWindow;

@end

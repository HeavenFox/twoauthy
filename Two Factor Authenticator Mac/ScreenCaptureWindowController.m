//
//  ScreenCaptureWindowController.m
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/18/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import "ScreenCaptureWindowController.h"

@implementation ScreenCaptureWindowController {
    NSMutableArray *_windows;

    CGRect resultRect;
}

- (id)init {
    if (self = [super init]) {
        _windows = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)start {
    for (NSScreen *screen in [NSScreen screens]) {
        TransparentWindow *win = [[TransparentWindow alloc] initWithScreen:screen];
        [_windows addObject:win];
        win.rectDelegate = self;
        [win setReleasedWhenClosed:NO];
        [win makeKeyAndOrderFront:nil];
    }
    [[NSCursor crosshairCursor] push];
}

- (void)view:(NSView*)view didSelectRect:(NSRect)rect {
    NSScreen *primaryScreen = [[NSScreen screens] objectAtIndex:0];

    NSPoint origin = [[view window] frame].origin;
    resultRect = CGRectOffset(rect, origin.x, origin.y);
    resultRect.origin.y = [primaryScreen frame].size.height - resultRect.origin.y - resultRect.size.height;

    for (NSWindow *win in _windows) {
        [win close];
    }

    [_windows removeAllObjects];

    [NSCursor pop];

    // Prevent capturing the selection rectangle
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(capture) userInfo:nil repeats:NO];
}

- (void)capture {
    CGImageRef image = CGWindowListCreateImage(resultRect,
                                               kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageDefault);

    [self.delegate capturedImage:[[NSImage alloc] initWithCGImage:image size:NSZeroSize]];
}

@end

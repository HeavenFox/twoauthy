//
//  TransparentWindow.m
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/17/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import "TransparentWindow.h"

@implementation TransparentWindow

- (id<RectSelectionDelegate>)rectDelegate {
    return [(RectSelectionView*)self.contentView delegate];
}

- (void)setRectDelegate:(id<RectSelectionDelegate>)rectDelegate {
    [(RectSelectionView*)self.contentView setDelegate:rectDelegate];
}


- (id)initWithScreen:(NSScreen*)screen {
    if (self = [super initWithContentRect:[screen frame] styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO]) {
        self.contentView = [[RectSelectionView alloc] initWithFrame:[screen frame]];
        [self setBackgroundColor:[NSColor clearColor]];
        [self setOpaque:NO];
        [self setLevel:NSMainMenuWindowLevel + 1];
        [self setIgnoresMouseEvents:NO];
    }
    return self;
}

@end

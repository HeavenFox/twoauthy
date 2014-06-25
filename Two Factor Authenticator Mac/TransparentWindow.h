//
//  TransparentWindow.h
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/17/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RectSelectionView.h"

@interface TransparentWindow : NSWindow

@property (readwrite) id<RectSelectionDelegate> rectDelegate;

- (id)initWithScreen:(NSScreen*)screen;

@end

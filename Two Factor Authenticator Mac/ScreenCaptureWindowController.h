//
//  ScreenCaptureWindowController.h
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/18/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransparentWindow.h"
#import "RectSelectionView.h"

@protocol ScreenCaptureWindowControllerDelegate <NSObject>

- (void)capturedImage:(NSImage*)image;

@end

@interface ScreenCaptureWindowController : NSObject <RectSelectionDelegate>

@property (weak) id<ScreenCaptureWindowControllerDelegate> delegate;

- (void)start;

@end

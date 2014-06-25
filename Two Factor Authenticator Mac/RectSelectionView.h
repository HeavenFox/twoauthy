//
//  RectSelectionView.h
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/17/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol RectSelectionDelegate <NSObject>

- (void)view:(NSView*)view didSelectRect:(NSRect)rect;

@end

@interface RectSelectionView : NSView

@property (weak) id<RectSelectionDelegate> delegate;

@end

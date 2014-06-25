//
//  RectSelectionView.m
//  FullScreenWindow
//
//  Created by Jingsi Zhu on 6/17/14.
//  Copyright (c) 2014 Jingsi Zhu. All rights reserved.
//

#import "RectSelectionView.h"

@implementation RectSelectionView {
    BOOL dragStarted;
    NSPoint startPoint;
    NSPoint endPoint;
}

//- (id)initWithFrame:(NSRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code here.
//    }
//    return self;
//}

- (NSRect)rect {
    return NSMakeRect(MIN(startPoint.x, endPoint.x), MIN(startPoint.y, endPoint.y), fabs(endPoint.x-startPoint.x), fabs(endPoint.y-startPoint.y));
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    if (dragStarted) {
        [[NSColor colorWithSRGBRed:0 green:0 blue:0 alpha:0.1] setFill];
        NSRectFill([self rect]);
    }
}

- (void)mouseDown:(NSEvent *)theEvent {
    dragStarted = YES;
    startPoint = [theEvent locationInWindow];
    endPoint = startPoint;
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    endPoint = [theEvent locationInWindow];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent {
    dragStarted = NO;
    [self display];
    [self.delegate view:self didSelectRect:[self rect]];
}

@end

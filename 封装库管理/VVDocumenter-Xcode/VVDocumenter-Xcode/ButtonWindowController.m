//
//  ButtonWindowController.m
//  fengzhuang
//
//  Created by wwegos on 13-10-21.
//  Copyright (c) 2013年 wwegos. All rights reserved.
//

#import "ButtonWindowController.h"
#import "ButtonView.h"

@interface ButtonWindowController ()

@end

@implementation ButtonWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (id)init
{
    NSRect frame = NSMakeRect(0, 0, 320, 500);
 	NSUInteger styleMask = NSTitledWindowMask;
	NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
    
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered defer:false];
	[window setBackgroundColor:[NSColor whiteColor]];
 	[window makeKeyAndOrderFront:self];
    [ window setTitle:@"iphone simulator"];
	ButtonView *button = [[ButtonView alloc] initWithFrame:frame];
    
	[[ window contentView] addSubview:button];
    
    if(self = [super initWithWindow:window])
    {
        
    }
/*    if(self = [super initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered defer:false])
    {
        
    }*/
    return self;
}

- (void)windowDidLoad
{
  
 
	
	
	
	NSPoint leftTopPoint = NSMakePoint(0, 480);
	NSPoint OriPoint = NSMakePoint(0, 0);
	[self line:leftTopPoint :OriPoint];
	
	NSPoint rightTopPoint = NSMakePoint(320, 480);
	NSPoint rightBottomPoint = NSMakePoint(320, 0);
	[self line:rightTopPoint :rightBottomPoint];
	
	[self line:leftTopPoint :rightTopPoint];
	[self line:OriPoint :rightBottomPoint];
	
	

    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)line:(NSPoint)point1 :(NSPoint)point2
{
	NSColor *lineColor = [NSColor blackColor];
	NSBezierPath *line = [NSBezierPath bezierPath];
	[line moveToPoint:point1];
	[line lineToPoint:point2];
    [line setLineWidth:1]; //
    [lineColor set]; //
    [line stroke];
}

@end

//
//  AppDelegate.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "AppDelegate.h"
 #import "ButtonView.h"

@implementation AppDelegate
//@synthesize window;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
	
	NSRect frame = NSMakeRect(0, 0, 320, 500);
	
	
 	NSUInteger styleMask =    NSTitledWindowMask;
	NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
	
	
  //	NSView *themeFrame = [[window contentView] superview];
//	NSView *firstSubview = [[themeFrame subviews] objectAtIndex:0];
//	[titleBarView setAutoresizingMask:(NSViewMinYMargin | NSViewWidthSizable)];
//	[themeFrame addSubview:titleBarView positioned:NSWindowBelow relativeTo:firstSubview];
	
	
	 window =  [[NSWindow alloc] initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered    defer:false];
	[ window setBackgroundColor:[NSColor whiteColor]];
 	[window makeKeyAndOrderFront:self];
	//- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag;

	
//	 window = [[NSWindow alloc] initWithContentRect:rect styleMask:0 backing:NSBackingStoreRetained defer:YES];
	// Insert code here to initialize your application
// ButtonViewController *button = [[ButtonViewController alloc] init];
 	
//        [self.window.contentView addSubview:button.view];
	ButtonView *button = [[ButtonView alloc] initWithFrame:rect];
 	
	[[ window contentView] addSubview:button];
	
	
/*	NSColor *lineColor = [NSColor blackColor];
	NSBezierPath *line = [NSBezierPath bezierPath];
	
	NSPoint leftTop = NSMakePoint(0, 480);
    [line moveToPoint:leftTop];
	
//    NSPoint
//    [line lineToPoint:];
    [line setLineWidth:1.0]; /// Make it easy to see
    [lineColor set]; /// Make future drawing the color of lineColor.
    [line stroke];*/
//	[window center] = NSMakePoint(100, 300);
//	[window set]
	
//	[window contentView].center =
	
//	NSRect rect  = NSMakeRect(0,0,320,480);
//	[self.window setFrame:rect display:YES];
	[ window setTitle:@"iphone simulator"];
	
	NSPoint leftTopPoint = NSMakePoint(0, 480);
	NSPoint OriPoint = NSMakePoint(0, 0);
	[self  line:leftTopPoint :OriPoint];
	
	NSPoint rightTopPoint = NSMakePoint(320, 480);
	NSPoint rightBottomPoint = NSMakePoint(320, 0);
	[self line:rightTopPoint :rightBottomPoint];
	
	[self line:leftTopPoint :rightTopPoint];
	[self line:OriPoint :rightBottomPoint];
	
	
 }

- (void)line:(NSPoint)point1 :(NSPoint)point2
{
	NSColor *lineColor = [NSColor blackColor];
	NSBezierPath *line = [NSBezierPath bezierPath];
	[line moveToPoint:point1];
	[line lineToPoint:point2];
    [line setLineWidth:1]; /// Make it easy to see
    [lineColor set]; /// Make future drawing the color of lineColor.
    [line stroke];
}

@end

//
//  main.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
int main(int argc, const char * argv[])
{
//	return NSApplicationMain(argc, argv);
//	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[NSApplication sharedApplication];
	
	AppDelegate *appDelegate = [[AppDelegate alloc] init];
	[NSApp setDelegate:appDelegate];
	[NSApp run];
//	[pool release];
	return 0;
}

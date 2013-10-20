//
//  main.m
//  VVTest
//
//  Created by wwegos on 13-10-21.
//  Copyright (c) 2013年 wwegos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
int main(int argc, const char * argv[])
{
	[NSApplication sharedApplication];
	
	AppDelegate *appDelegate = [[AppDelegate alloc] init];
	[NSApp setDelegate:appDelegate];
	[NSApp run];
    //	[pool release];
	return 0;
}

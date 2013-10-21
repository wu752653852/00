//
//  VVDocumenterManager.m
//  VVDocumenter-Xcode
//
//  Created by 王 巍 on 13-7-16.
//  Copyright (c) 2013年 OneV's Den. All rights reserved.
//

#import "VVDocumenterManager.h"
#import "MMenuItem.h"
#import "ButtonWindowController.h"

@interface VVDocumenterManager()

@end

@implementation VVDocumenterManager
+(void)pluginDidLoad:(NSBundle *)plugin {
     [self shared];
}

+(id) shared {
    static dispatch_once_t once;
    static id instance = nil;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunching:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}
/**
 *  Description
 *
 *  @param noti 1
 */


- (void) applicationDidFinishLaunching: (NSNotification*) noti {
     [MMenuItem SetMenu:@"contribute duction" :@"Edit" :@selector(wocao) :self];

 }

- (void)wocao
{
     if(buttonWindow == nil)
    {
        buttonWindow = [[ButtonWindowController alloc] init];
        [buttonWindow showWindow:buttonWindow];
    }
}



@end

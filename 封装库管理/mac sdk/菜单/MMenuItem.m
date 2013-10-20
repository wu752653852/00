//
//  MMenuItem.m
//  fengzhuang
//
//  Created by wwegos on 13-10-20.
//  Copyright (c) 2013年 wwegos. All rights reserved.
//

#import "MMenuItem.h"

@implementation MMenuItem
+ (void)SetMenu:(NSString *)title :(NSString *)to :(SEL)action :(id)father
{
    NSMenuItem *editMenuItem = [[NSApp mainMenu] itemWithTitle:to];
    if (editMenuItem) {
        [[editMenuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:title action:action keyEquivalent:@""];
        
        [newMenuItem setTarget:father];
        [newMenuItem setKeyEquivalentModifierMask: NSAlternateKeyMask];
        [[editMenuItem submenu] addItem:newMenuItem];
     }
 }
@end

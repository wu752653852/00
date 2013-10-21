//
//  MMenuItem.h
//  fengzhuang
//
//  Created by wwegos on 13-10-20.
//  Copyright (c) 2013年 wwegos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMenuItem : NSObject
+ (void)SetMenu:(NSString *)title :(NSString *)to :(SEL)action :(id)father;

@end

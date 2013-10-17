//
//  Button.h
//  Button
//
//  Created by apple on 13-10-17.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MButton : NSObject
+ (NSButton*)GetStringButton:(NSString *)title :(NSPoint)center :(SEL)fun :(id)father;
@end

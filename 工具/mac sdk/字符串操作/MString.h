//
//  MString.h
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MString : NSObject
+ (NSString *)GetStringFrom:(NSString *)str :(NSString *)begin :(NSString *)end;
+ (NSInteger)GetBeforeKeyNum:(NSString *)str :(NSString *)key;
+ (NSInteger)GetInCludeBeforKeyNum:(NSString *)str :(NSString *)key;

+ (bool)StringHaveString:(NSString *)str :(NSString *)c;
+ (int)getCharLen:(const char *)a;

+ (NSString *)GetDesktopDir:(NSString *)file;

@end

//
//  MMString.h
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMString : NSObject
+ (NSString *)GetStringFrom:(NSString *)str :(NSString *)begin :(NSString *)end;
+ (NSInteger)GetBeforeKeyNum:(NSString *)str :(NSString *)key;
+ (NSInteger)GetInCludeBeforKeyNum:(NSString *)str :(NSString *)key;

+ (bool)StringHaveString:(NSString *)str :(NSString *)c;
+ (int)getCharLen:(const char *)a;

+ (bool)StringBeginWithString:(NSString *)strFull :(NSString *)begin;
+ (bool)StringEndWithString:(NSString *)strFull :(NSString *)end;

+ (bool)StringEndIsEmpty:(NSString *)strFull;

+ (bool)StringEndRightIsString:(NSString *)strFull :(NSInteger)integer :(NSString *)str;
+ (NSString *)RemoveEndString:(NSString *)str :(NSString *)remove;

 

+ (NSString *)GetDesktopDir:(NSString *)file;



@end

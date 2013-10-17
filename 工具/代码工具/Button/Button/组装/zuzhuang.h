//
//  zuzhuang.h
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface zuzhuang : NSObject
{
	NSString *hPath;
	NSString *mPath;
	NSString *file;
	
	NSString *ToHFile;
	NSString *ToMFile;
}



- (id)init:(NSString *)hPath1 :(NSString *)mPath1 :(NSString *)file1;

- (NSString *)HGet;
- (NSString *)MGet;
//- (void)Export;
//- (void)ExportTo:(NSString *)headerPath :(NSString *)mmPath :(NSString *)read;
@end

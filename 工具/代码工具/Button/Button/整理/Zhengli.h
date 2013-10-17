//
//  Zhengli.h
//  封装库管理
//
//  Created by apple on 13-10-17.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zhengli : NSObject
{
	NSString *hPath;
	NSString *mPath;
	
	NSString *ToHFile;
	NSString *ToMFile;
}

- (id)init:(NSString *)hPath1 :(NSString *)mPath1;

- (id)init:(NSString *)h1 klk:(NSString *)m1 :(NSString *)hpath :(NSString *)mPath1;


- (void)Export;
- (void)ExportLian;

@end

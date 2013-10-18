//
//  zuzhuang.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "zuzhuang.h"
#import "MStringFile.h"
#import "GetHeader.h"
#import "GetMFile.h"
#import "MDebugUtils.h"
@implementation zuzhuang
- (id)init:(NSString *)hPath1 :(NSString *)mPath1 :(NSString *)file1
{
	if(self = [super init])
	{
		if(hPath1 == nil || mPath1 == nil)
		{
//			NSAlertView *alert = [[NSAlertView alloc] init];
//			[alert showsHelp];
			return nil;
		}
		hPath = hPath1;
		mPath = mPath1;
		file = file1;
		[self load];
	}
	return self;
}

- (void)load
{
	ToHFile = [MStringFile GetStringFromDir:hPath];
	ToMFile = [MStringFile GetStringFromDir:mPath];

	
	[MStringFile SaveFileWithTimeAdd:hPath :@"h"];
	[MStringFile SaveFileWithTimeAdd:mPath :@"m"];
	[MStringFile removeNotNewAtPath:hPath];

//    TEST_NSLog(@"%@", ToHFile);
	
	///////////////////////////////////////////////////////////////////////
// TEST_NSLog(@"%@", ToMFile);
}



- (NSString *)HGet
{
	GetHeader *he = [[GetHeader alloc] init:ToHFile :file];
	ToHFile = [he GetH];
	return ToHFile;
}

- (NSString *)MGet
{
	GetMFile *me = [[GetMFile alloc] init:ToMFile :file];
	ToMFile = [me GetM];
	return ToMFile;
}




- (void)GetInSert
{
 	GetHeader *he = [[GetHeader alloc] init:ToHFile :file];
	ToHFile = [he GetH];
	TEST_NSLog(@"%@", ToHFile);
	
	
	GetMFile *me = [[GetMFile alloc] init:ToMFile :file];
	ToMFile = [me GetM];
	TEST_NSLog(@"%@", ToMFile);
}


@end

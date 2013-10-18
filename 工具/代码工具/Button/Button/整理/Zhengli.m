//
//  Zhengli.m
//  封装库管理
//
//  Created by apple on 13-10-17.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "Zhengli.h"
#import "MStringFile.h"
#import "ZhengliH.h"
#import "ZhengliM.h"

@implementation Zhengli

- (id)init:(NSString *)hPath1 :(NSString *)mPath1
{
	if(self = [super init])
	{
		hPath = hPath1;
		mPath = mPath1;
		[self load];
	}
	return self;
}

- (id)init:(NSString *)h1 klk:(NSString *)m1 :(NSString *)hpath :(NSString *)mPath1
{
	if(self = [super init])
	{
		ToHFile = h1;
		ToMFile = m1;
		hPath = hpath;
		mPath = mPath1;
 	}
	return self;
}

- (void)load
{
	ToHFile = [MStringFile GetStringFromDir:hPath];
	ToMFile = [MStringFile GetStringFromDir:mPath];
}

- (void)ExportLian
{
	[self Zhengli];
	[MStringFile SaveStringToDir:ToHFile to:hPath];
	[MStringFile SaveStringToDir:ToMFile to:mPath];
}

- (void)Export
{
	[self Zhengli];
	bool result1 = [MStringFile SaveFileWithTimeAdd:hPath :@"h"];
	bool result2 = [MStringFile SaveFileWithTimeAdd:mPath :@"m"];
	[MStringFile removeNotNewAtPath:hPath];

	if(result1 && result2)
	{
 		[MStringFile SaveStringToDir:ToHFile to:hPath];
 		[MStringFile SaveStringToDir:ToMFile to:mPath];
	}
}

- (void)Zhengli
{
	
    ZhengliH *h = [[ZhengliH alloc] init:ToHFile];
	ToHFile = [h GetH];
    
	
	ZhengliM *m = [[ZhengliM alloc] init:ToMFile];
	ToMFile = [m GetM];
}



@end

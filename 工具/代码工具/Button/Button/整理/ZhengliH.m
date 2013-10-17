//
//  ZhengliH.m
//  封装库管理
//
//  Created by apple on 13-10-17.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "ZhengliH.h"
#import "MStringFile.h"
#import "MDebugUtils.h"

@implementation ZhengliH

- (id)init:(NSString *)str
{
	if(self = [super init])
	{
		ToHFile = str;
		//[NSMutableString stringWithString:str];
 	}
	return self;
}


- (NSString *)GetH
{
	[self ZhengliH];
	return ToHFile;
}


- (void)ZhengliH
{
	[self quchu_huiche];
	[self quchu_zhushi];
	[self quchu_huiche];
}

- (void)quchu_huiche
{
	 
	NSArray *arr = [ToHFile componentsSeparatedByString:@"\n"];
//	NSMutableArray *arr2 = [arr copy];
//	NSString *file;
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""] && ![a isEqualToString:@" "])
		{
			ToHFile = [ToHFile stringByAppendingFormat:@"\n%@",a];
			TEST_NSLog(@"%@", a);
		}
	}
	
	
	arr = [ToHFile componentsSeparatedByString:@" "];
	//	NSMutableArray *arr2 = [arr copy];
	//	NSString *file;
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""])
		{
			ToHFile = [ToHFile stringByAppendingFormat:@" %@",a];
		}
	}
 
	
//	TEST_NSLog(@"%@", ToHFile);
 	
}

- (void)quchu_zhushi
{
	NSArray *arr = [ToHFile componentsSeparatedByString:@"\n"];
	//	NSMutableArray *arr2 = [arr copy];
	//	NSString *file;
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
//	    TEST_NSLog(@"%@", a);
		NSArray *b = [a componentsSeparatedByString:@"//"];
		if([b count] > 1)
		{
			NSString *c = [b lastObject];
			NSArray *d = [a componentsSeparatedByString:c];
 				NSString *e = [d objectAtIndex:0];
				if(![e isEqualToString:@""] && ![e isEqualToString:@"//"])
				{
					ToHFile = [ToHFile stringByAppendingFormat:@"\n%@",e];
				}
 		}
		else
			//if([b count] == 0)
		{
				ToHFile = [ToHFile stringByAppendingFormat:@"\n%@",a];
			NSLog(@"%@", a);
		}
	}
//	TEST_NSLog(@"%@", ToHFile);
}

@end

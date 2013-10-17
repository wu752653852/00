//
//  MString.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "MString.h"
#import "MDebugUtils.h"
@implementation MString
+ (NSString *)GetStringFrom:(NSString *)str :(NSString *)begin :(NSString *)end
{
	NSArray *arra = [str componentsSeparatedByString:begin];
	
	if([arra count] > 1)
	{
		NSString *str2 = [arra objectAtIndex:1];
		
		NSArray *arrb = [str2 componentsSeparatedByString:end];
		if([arrb count] > 1)
		{
 			return [arrb objectAtIndex:0];
		}
	}
	//	return str3;
	return nil;
}

+ (NSInteger)GetBeforeKeyNum:(NSString *)str :(NSString *)key
{
	NSArray *arra = [str componentsSeparatedByString:key];
	if([arra count] > 0)
	{
		NSString *str1 = [arra objectAtIndex:0];
		NSInteger a = [str1 length];
///		TEST_NSLog(@"%@", str1);
//		TEST_NSLog(@"%d", (int)a);
		return a;
	}
    return -1;
}

+ (NSInteger)GetInCludeBeforKeyNum:(NSString *)str :(NSString *)key
{
	NSArray *arra = [str componentsSeparatedByString:key];
	if([arra count] > 0)
	{
		NSString *str1 = [arra objectAtIndex:0];
		
		return [str1 length] + [key length];
	}
    return -1;
}

+ (bool)StringHaveString:(NSString *)str :(NSString *)c
{
	NSArray *a = [str componentsSeparatedByString:c];
	if([a count] > 1)
	{
		return true;
	}
  const char *char_content = [str cStringUsingEncoding:NSASCIIStringEncoding];
	const char *cc = [c cStringUsingEncoding:NSASCIIStringEncoding];
	
//	for(int i = 0;i < )
	int ca =(int)[c length];
	//[MString getCharLen:cc];
//	NSLog(@"%d", ca);
	bool returnvalue = true;
	for(int i = 0;i < ca;i ++)
	{
		if(cc[i] != char_content[i])
		{
			returnvalue = false;
		}
	}
	int cb = [MString getCharLen:char_content];

	
	
	if(returnvalue == false)
	{
		for(int i = 0;i < ca;i ++)
		{
			if(cc[i] != char_content[cb - 1 - i])
			{
				returnvalue = false;
			}
		}
		
	}
	
	return returnvalue;
}

+ (int)getCharLen:(const char *)a
{
	int i = 0;
	do{
//		a[]
		i ++;
	}while (a[i] == '\0');
	return i - 1;
}


@end

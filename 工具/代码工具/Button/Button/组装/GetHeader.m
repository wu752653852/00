//
//  GetHeader.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "GetHeader.h"
#import "MString.h"
#import "MDebugUtils.h"
@implementation GetHeader
- (id)init:(NSString *)str :(NSString *)str1;
{
	if(self = [super init])
	{
		ToHFile = [NSMutableString stringWithString:str];
		file = str1;
	}
	return self;
}


- (NSString *)GetH
{
	[self AddHFile];
	return ToHFile;
}

- (void)AddHFile
{
	[self AddHeader];
 	[self AddHeaderFunc];
	[self AddDelegate];
	[self AddFunc];
}

- (NSInteger)GetHeaderPos
{
//	return 0;
	NSInteger a = [MString GetBeforeKeyNum:ToHFile :@"#import"];
    return a;
}



- (void)AddHeader
{
	NSString *header = [MString GetStringFrom:file :@"~header" :@"~before_func"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetHeaderPos];
	[ToHFile insertString:header atIndex:ina];
}

-(NSInteger)GetAddHeaderFuncPos
{
    NSInteger a1 = [MString GetBeforeKeyNum:ToHFile :@"@interface"];
	NSInteger b1 = [MString GetBeforeKeyNum:ToHFile :@"@protocol"];
	TEST_NSLog(@"%d", (int)a1);
	TEST_NSLog(@"%d", (int)b1);
	if(a1 == -1 && b1 != -1)
	{
		return b1;
	}
	if(b1 == -1 && a1 != -1)
	{
		return a1;
	}
	
	if(b1 < a1)
	{
		return b1;
	}
	else
	{
		return a1;
	}
}

- (void)AddHeaderFunc
{
	NSString *header = [MString GetStringFrom:file :@"~before_func" :@"~func_delegate"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetAddHeaderFuncPos];
	
	TEST_NSLog(@"%d", (int)ina);
	TEST_NSLog(@"%d", (int)[ToHFile length]);
	[ToHFile insertString:header atIndex:ina];

}




- (void)AddDelegate
{
	NSString *header = [MString GetStringFrom:file :@"~func_delegate" :@"~in_func"];

	
	header =  [MString RemoveEndString:header :@" "];
	header =  [MString RemoveEndString:header :@"\n"];
	header = [@"\n" stringByAppendingString:header];

 		
 	TEST_NSLog(@"%@", ToHFile);
	NSString *str = [MString GetStringFrom:ToHFile :@"@interface" :@"@end"];
 	
	NSString *str3 = [MString GetStringFrom:str :@"<" :@">"];
	NSInteger in2 ;
	if(str3 != nil)
	{
	    in2 = [MString GetInCludeBeforKeyNum:ToHFile :str3];
		header = [@",\n" stringByAppendingString:header];


 		[ToHFile insertString:header atIndex:in2];
	}
	else
	{
		NSString *str5 = [MString GetStringFrom:ToHFile :@"@interface" :@"{"];
		if(str5 != nil)
		{
			in2 = [MString GetInCludeBeforKeyNum:ToHFile :str5];
			header = [@"<" stringByAppendingFormat:@"%@>", header];
			
			[ToHFile insertString:header atIndex:in2];
		}
		else
		{
			NSString *str6 = [MString GetStringFrom:ToHFile :@"@interface" :@"@end"];
			if(str6 != nil)
			{
				in2 = [MString GetInCludeBeforKeyNum:ToHFile :str6];
				header = [@"<" stringByAppendingFormat:@"%@>", header];
				[ToHFile insertString:header atIndex:in2];
			}
		}
	}
}



- (void)AddFunc
{
	NSString *header = [MString GetStringFrom:file :@"~in_func" :@"~.m"];
//	NSInteger ina = [self GetAddFuncPos];
	
	NSString *str = [MString GetStringFrom:ToHFile :@"@interface" :@"@end"];
	NSString *str3 = [MString GetStringFrom:str :@"{" :@"}"];
	NSInteger in2;
	
	if(str3 != nil)
	{
	    in2 = [MString GetInCludeBeforKeyNum:ToHFile :str3];
		header = [@"\n" stringByAppendingString:header];
		[ToHFile insertString:header atIndex:in2];

	}
	else
	{
		NSString *str4 = [MString GetStringFrom:str :@">" :@"@end"];
		if(str4 != nil)
		{
	    	in2 = [MString GetInCludeBeforKeyNum:ToHFile :str4];
			header = [@"\n{\n" stringByAppendingFormat:@"%@\n}\n" ,header];
			[ToHFile insertString:header atIndex:in2];

		}
		else
		{
			NSString *str5 = [MString GetStringFrom:ToHFile :@"@interface" :@"@end"];
			if(str5 != nil)
			{
				in2 = [MString GetInCludeBeforKeyNum:ToHFile :str5];
				header = [@"\n{\n" stringByAppendingFormat:@"%@\n}\n" ,header];
				[ToHFile insertString:header atIndex:in2];
			}
		}
		
		
	}
	
}







@end

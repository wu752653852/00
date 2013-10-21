 
#import "GetHeader.h"
#import "MMString.h"
//#import "MDate.h"
#import "MMDate.h"

//#import "MDate.h"

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
	NSInteger a = [MMString GetBeforeKeyNum:ToHFile :@"#import"];
 return a;
}
- (void)AddHeader
{
	NSString *header = [MMString GetStringFrom:file :@"~header" :@"~before_func"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetHeaderPos];
	[ToHFile insertString:header atIndex:ina];
}
-(NSInteger)GetAddHeaderFuncPos
{
 NSInteger a1 = [MMString GetBeforeKeyNum:ToHFile :@"@interface"];
	NSInteger b1 = [MMString GetBeforeKeyNum:ToHFile :@"@protocol"];
	VVLog(@"%d", (int)a1);
	VVLog(@"%d", (int)b1);
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
	NSString *header = [MMString GetStringFrom:file :@"~before_func" :@"~func_delegate"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetAddHeaderFuncPos];
	
	VVLog(@"%d", (int)ina);
	VVLog(@"%d", (int)[ToHFile length]);
	[ToHFile insertString:header atIndex:ina];
}
- (void)AddDelegate
{
	NSString *header = [MMString GetStringFrom:file :@"~func_delegate" :@"~in_func"];
	
	header = [MMString RemoveEndString:header :@" "];
	header = [MMString RemoveEndString:header :@"\n"];
	header = [@"\n" stringByAppendingString:header];
 		
 	VVLog(@"%@", ToHFile);
	NSString *str = [MMString GetStringFrom:ToHFile :@"@interface" :@"@end"];
 	
	NSString *str3 = [MMString GetStringFrom:str :@"<" :@">"];
	NSInteger in2 ;
	if(str3 != nil)
	{
	 in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str3];
		header = [@",\n" stringByAppendingString:header];
 		[ToHFile insertString:header atIndex:in2];
	}
	else
	{
		NSString *str5 = [MMString GetStringFrom:ToHFile :@"@interface" :@"{"];
		if(str5 != nil)
		{
			in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str5];
			header = [@"<" stringByAppendingFormat:@"%@>", header];
			
			[ToHFile insertString:header atIndex:in2];
		}
		else
		{
			NSString *str6 = [MMString GetStringFrom:ToHFile :@"@interface" :@"@end"];
			if(str6 != nil)
			{
				in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str6];
				header = [@"<" stringByAppendingFormat:@"%@>", header];
				[ToHFile insertString:header atIndex:in2];
			}
		}
	}
}
- (void)AddFunc
{
	NSString *header = [MMString GetStringFrom:file :@"~in_func" :@"~.m"];
	
	NSString *str = [MMString GetStringFrom:ToHFile :@"@interface" :@"@end"];
	NSString *str3 = [MMString GetStringFrom:str :@"{" :@"}"];
	NSInteger in2;
	
	if(str3 != nil)
	{
	 in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str3];
		header = [@"\n" stringByAppendingString:header];
		[ToHFile insertString:header atIndex:in2];
	}
	else
	{
		NSString *str4 = [MMString GetStringFrom:str :@">" :@"@end"];
		if(str4 != nil)
		{
	 	in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str4];
			header = [@"\n{\n" stringByAppendingFormat:@"%@\n}\n" ,header];
			[ToHFile insertString:header atIndex:in2];
		}
		else
		{
			NSString *str5 = [MMString GetStringFrom:ToHFile :@"@interface" :@"@end"];
			if(str5 != nil)
			{
				in2 = [MMString GetInCludeBeforKeyNum:ToHFile :str5];
				header = [@"\n{\n" stringByAppendingFormat:@"%@\n}\n" ,header];
				[ToHFile insertString:header atIndex:in2];
			}
		}
	}
}
@end
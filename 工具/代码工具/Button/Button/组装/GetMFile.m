 
#import "GetMFile.h"
#import "MString.h"
#import "MDebugUtils.h"
@implementation GetMFile
- (id)init:(NSString *)str :(NSString *)str1
{
	if(self = [super init])
	{
		ToMFile = [NSMutableString stringWithString:str];
		file = str1;
	}
	return self;
}
- (NSString *)GetM
{
	[self AddMFile];
 	return ToMFile;
}
- (void)AddMFile
{
	[self AddViewDidLoad];
	[self AddFunc];
}
- (void)AddViewDidLoad
{
	NSString *header = [MString GetStringFrom:file :@"~viewdidload" :@"~delegate"];
	
	NSString *str = [MString GetStringFrom:ToMFile :@"[super viewDidLoad];" :@"}"];
	if(str != nil)
	{
		NSInteger in2 = [MString GetInCludeBeforKeyNum:ToMFile :str];
		header = [@"\n" stringByAppendingString:header];
		[ToMFile insertString:header atIndex:in2];
	}
	else
	{
		TEST_NSLog(@"%@",ToMFile);
		NSString *str2 = [MString GetStringFrom:ToMFile :@"[super initWithFrame" :@"return self"];
		TEST_NSLog(@"%@", str2);
		if(str2 != nil)
		{
			NSInteger in2 = [MString GetInCludeBeforKeyNum:ToMFile :str2];
			header = [@"\n" stringByAppendingString:header];
			[ToMFile insertString:header atIndex:in2];
		}
	}
	TEST_NSLog(@"%@", ToMFile);
}
- (NSInteger)GetFuncPos
{
	NSString *str = [MString GetStringFrom:ToMFile :@"@implementation" :@"@end"];
 	NSInteger in2 = [MString GetInCludeBeforKeyNum:ToMFile :str];
	return in2;
}
- (void)AddFunc
{
	NSString *header = [MString GetStringFrom:file :@"~delegate" :@"~end"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetFuncPos];
	[ToMFile insertString:header atIndex:ina];
}
@end
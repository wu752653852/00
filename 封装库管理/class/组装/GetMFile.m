 
#import "GetMFile.h"
#import "MMString.h"
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
	NSString *header = [MMString GetStringFrom:file :@"~viewdidload" :@"~delegate"];
	
	NSString *str = [MMString GetStringFrom:ToMFile :@"[super viewDidLoad];" :@"}"];
	if(str != nil)
	{
		NSInteger in2 = [MMString GetBeforeKeyNum:ToMFile :str];
		header = [@"\n" stringByAppendingString:header];
		[ToMFile insertString:header atIndex:in2];
	}
	else
	{
		VVLog(@"%@",ToMFile);
		NSString *str2 = [MMString GetStringFrom:ToMFile :@"[super initWithFrame" :@"return self"];
		VVLog(@"%@", str2);
		if(str2 != nil)
		{
			NSInteger in2 = [MMString GetInCludeBeforKeyNum:ToMFile :str2];
			header = [@"\n" stringByAppendingString:header];
			[ToMFile insertString:header atIndex:in2];
		}
	}
	VVLog(@"%@", ToMFile);
}
- (NSInteger)GetFuncPos
{
	NSString *str = [MMString GetStringFrom:ToMFile :@"@implementation" :@"@end"];
 	NSInteger in2 = [MMString GetInCludeBeforKeyNum:ToMFile :str];
	return in2;
}
- (void)AddFunc
{
	NSString *header = [MMString GetStringFrom:file :@"~delegate" :@"~end"];
	header = [@"\n" stringByAppendingString:header];
	NSInteger ina = [self GetFuncPos];
	[ToMFile insertString:header atIndex:ina];
}
@end
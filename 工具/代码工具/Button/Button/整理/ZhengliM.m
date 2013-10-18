 
#import "ZhengliM.h"
#import "MDebugUtils.h"
@implementation ZhengliM
- (id)init:(NSString *)str
{
	if(self = [super init])
	{
		ToMFile = str;
		//
	}
	return self;
}
- (NSString *)GetM
{
	[self ZhengliM];
	return ToMFile;
}
- (void)ZhengliM
{
	[self quchu_huiche];
	[self quchu_zhushi];
	[self quchu_huiche];
}
- (void)quchu_huiche
{
	NSArray *arr = [ToMFile componentsSeparatedByString:@"\n"];
	//
	//
	ToMFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""] && ![a isEqualToString:@"\n"] && ![a isEqualToString:@" "] )
		{
			ToMFile = [ToMFile stringByAppendingFormat:@"\n%@",a];
		}
	}
	
	
	arr = [ToMFile componentsSeparatedByString:@" "];
	//
	//
	ToMFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""])
		{
			ToMFile = [ToMFile stringByAppendingFormat:@" %@",a];
		}
	}
	
	
	TEST_NSLog(@"%@", ToMFile);
}
- (void)quchu_zhushi
{
	NSArray *arr = [ToMFile componentsSeparatedByString:@"\n"];
	//
	//
	ToMFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		//
		NSArray *b = [a componentsSeparatedByString:@"//"];
		if([b count] > 1)
		{
			NSString *c = [b lastObject];
			NSArray *d = [a componentsSeparatedByString:c];
			NSString *e = [d objectAtIndex:0];
			if(![e isEqualToString:@""] && ![e isEqualToString:@"//"])
			{
				ToMFile = [ToMFile stringByAppendingFormat:@"\n%@",e];
			}
 		}
		else
 		{
			ToMFile = [ToMFile stringByAppendingFormat:@"\n%@",a];
			NSLog(@"%@", a);
		}
	}
}
@end
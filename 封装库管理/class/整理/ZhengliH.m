 
#import "ZhengliH.h"
#import "MMStringFile.h"
#import "MMString.h"
 @implementation ZhengliH
- (id)init:(NSString *)str :(NSString *)time1
{
	if(self = [super init])
	{
		ToHFile = str;
		time = time1;

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
	[self AddTimeEqual];
}
- (void)quchu_huiche
{
	 
	NSArray *arr = [ToHFile componentsSeparatedByString:@"\n"];
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""] && ![a isEqualToString:@" "])
		{
			ToHFile = [ToHFile stringByAppendingFormat:@"\n%@",a];
			VVLog(@"%@", a);
		}
	}
	
	
	arr = [ToHFile componentsSeparatedByString:@" "];
	//
	//
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
		if(![a isEqualToString:@""])
		{
			ToHFile = [ToHFile stringByAppendingFormat:@" %@",a];
		}
	}
	
 	
}
- (void)quchu_zhushi
{
	NSArray *arr = [ToHFile componentsSeparatedByString:@"\n"];
	//
	//
	ToHFile = @"";
	for(int i = 0;i < [arr count];i ++)
	{
		NSString *a = [arr objectAtIndex:i];
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
			//
		{
				ToHFile = [ToHFile stringByAppendingFormat:@"\n%@",a];
			VVLog(@"%@", a);
		}
	}
}


- (void)AddTimeEqual
{
	NSArray *arr = [ToHFile componentsSeparatedByString:@"***"];
	
	
 	NSString *Tofile = @"";
 
    for(int i  =0;i < [arr count]; i ++)
	{
		NSString *str  = [arr objectAtIndex:i];
		NSInteger aa = [MMString GetInCludeBeforKeyNum:ToHFile :str];
		if([MMString StringEndRightIsString:ToHFile :aa :@"***"] && i != [arr count] - 1)
		{
  			str = [str stringByAppendingString:time];
		}
 		Tofile = [Tofile stringByAppendingString:str];

	}
	ToHFile = Tofile;
}

@end
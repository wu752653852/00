//
//  StringFile.m
//  cartoon
//
//  Created by apple on 13-10-15.
//
//

#import "MStringFile.h"
#import "MString.h"
//#import "GDataXMLDocument"
//#import "GDataXMLNode.h"

#import "MDebugUtils.h"
@implementation MStringFile
#define DESK [NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0]

+ (void)SaveStringToFile:(NSString *)string to:(NSString *)fileName
{
     NSString *desk = [DESK stringByAppendingFormat:@"/%@", fileName];

	
	[[NSFileManager defaultManager] createFileAtPath:desk contents:[string dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

+ (void)SaveStringToDir:(NSString *)string to:(NSString *)fileName
{
//	NSString *desk = [DESK stringByAppendingFormat:@"/%@", fileName];
	
	
	[[NSFileManager defaultManager] createFileAtPath:fileName contents:[string dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

+ (NSString *)GetStringFromFile:(NSString *)fileName
{
 
	
	NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
 
	
 	NSString *str = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	return str;
}

+ (NSString *)GetStringFromDir:(NSString *)fileName
{
	
 	NSString *str = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
	return str;
}


+ (void)SetHeaderAndMFilePath:(NSString **)header :(NSString **)mfile :(NSString *)cankao
{
	NSString *str = [cankao lastPathComponent];
	NSArray *a = [str componentsSeparatedByString:@"."];
	str = [a objectAtIndex:1];
	if([str isEqualToString:@"h"])
	{
		*header = cankao;
		NSArray *arr = [cankao componentsSeparatedByString:str];
		NSString *str2 = [arr objectAtIndex:0];
//		NSString *str3 = [[a objectAtIndex:0] stringByAppendingString:@".m"];
		NSString *path = [str2 stringByAppendingFormat:@"%@", @"m"];
		TEST_NSLog(@"%@", path);
		if([[NSFileManager defaultManager] fileExistsAtPath:path])
		{
			*mfile = path;
		}
		else
		{
			NSString *path = [str2 stringByAppendingFormat:@"%@", @"mm"];

//			NSString *str4 = [[a objectAtIndex:0] stringByAppendingString:@".mm"];
//			NSString *path2 = [str2 stringByAppendingFormat:@"/%@", @"mm"];
			if([[NSFileManager defaultManager] fileExistsAtPath:path])
			{
				*mfile = path;
			}
 		}
	}
	else if([str isEqualToString:@"mm"] || [str isEqualToString:@"m"])
	{
		*mfile = cankao;
		str = [cankao lastPathComponent];
//		NSString *str = [[a objectAtIndex:0] stringByAppendingString:@"h"];
	
		NSArray *arr = [str componentsSeparatedByString:@"."];
		NSString *str2 = [arr objectAtIndex:0];
		NSArray *arr2 = [cankao componentsSeparatedByString:str];
		NSString *str4 = [arr2 objectAtIndex:0];
		
// 		NSString *str2 = [a objectAtIndex:0];
		NSString *path = [str2 stringByAppendingFormat:@".%@", @"h"];
		NSString *path2 = [str4 stringByAppendingString:path];
		TEST_NSLog(@"%@", path2);
		if([[NSFileManager defaultManager] fileExistsAtPath:path2])
		{
			*header = path2;
		}
	}
		
}

+ (bool)SaveFileWithTimeAdd:(NSString *)path :(NSString *)addStr
{
	
	NSString *path1 = [path lastPathComponent];
//	TEST_NSLog(@"%@", hPath);
	NSArray *array = [path1 componentsSeparatedByString:@"."];
	NSString *fen = [array objectAtIndex:0];
	NSArray *array2 = [path componentsSeparatedByString:path1];
	NSString *fen2 = [[array2 objectAtIndex:0] stringByAppendingString:fen];
	
	//	NSString *path1 = [array objectAtIndex:0];
	/////////////////////////////
	NSDate *myDate = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit) fromDate:myDate];
	NSInteger year = [components year];
	NSInteger month = [components month];
	NSInteger day = [components day];
	NSInteger hour = [components hour] ;
	NSInteger minute = [components minute];
	NSInteger second = [components second];
	/////////////////////////////////////////////
	////////////////////////////
 	
	NSString *str = [NSString stringWithFormat:@"_%d_%d_%d_%d_%d_%d_%@", (int)year, (int)month, (int)day,(int)hour, (int)minute,(int)second ,addStr];
	path1 = [fen2 stringByAppendingString:str];
	TEST_NSLog(@"%@", path1);
	
	NSFileManager *f = [NSFileManager defaultManager];
	return  [f moveItemAtPath:path toPath:path1 error:nil];
}

+ (void)BackStepNearTime:(NSString *)path
{
 	NSString *str = [path lastPathComponent];
	NSArray *b = [str componentsSeparatedByString:@"."];
	NSString *str3 = [b objectAtIndex:0];
	NSArray *a = [path componentsSeparatedByString:str];
	NSString *str1 = [a objectAtIndex:0];
	NSArray *dirContents = [[NSFileManager defaultManager]
							contentsOfDirectoryAtPath:str1 error:nil];
	NSMutableArray *hArr = [[NSMutableArray alloc] init];
 
	for (NSString *tString in dirContents)
	{
		if([tString hasSuffix:@"_h"])
		{
		   	NSArray *array = [tString componentsSeparatedByString:@"_"];
			[hArr addObject:array];
		}
	}
	TEST_NSLog(@"%@", hArr);
	
	NSInteger BigYear = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:1] integerValue] > BigYear)
		{
			BigYear = [[arr objectAtIndex:1] integerValue];
		}
	}
	
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
		if([[arr objectAtIndex:1] integerValue] != BigYear)
		{
			[hArr removeObject:arr];
		}
	}
	///////////////
	NSInteger BigMonth = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:2] integerValue] > BigMonth && [[arr objectAtIndex:1] integerValue] == BigYear)
		{
			BigMonth = [[arr objectAtIndex:2] integerValue];
		}
	}
	
 
    ////////////////////////
	NSInteger BigDay = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:3] integerValue] > BigDay && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear))
		{
			BigDay = [[arr objectAtIndex:3] integerValue];
		}
	}
	
 
	///////////////////////
	NSInteger BigHour = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:4] integerValue] > BigHour && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay))
		{
			BigHour = [[arr objectAtIndex:4] integerValue];
		}
	}
	
 
	///////////////////////
	NSInteger BigMinute = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:5] integerValue] > BigMinute && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay && [[arr objectAtIndex:4] integerValue] == BigHour))
		{
			BigMinute = [[arr objectAtIndex:5] integerValue];
		}
	}
	
 
	//////////////////////////
	NSInteger BigSecond = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:6] integerValue] > BigSecond && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay && [[arr objectAtIndex:4] integerValue] == BigHour && [[arr objectAtIndex:5] integerValue] == BigMinute))
		{
			BigSecond = [[arr objectAtIndex:6] integerValue];
		}
	}
	

 
	
	
    NSString *hPath = [NSString stringWithFormat:@"%@_%d_%d_%d_%d_%d_%d_h",str3, (int)BigYear, (int)BigMonth, (int)BigDay, (int)BigHour, (int)BigMinute, (int)BigSecond];
	TEST_NSLog(@"%@", hPath);
	NSString *mPath = [NSString stringWithFormat:@"%@_%d_%d_%d_%d_%d_%d_m", str3, (int)BigYear, (int)BigMonth, (int)BigDay, (int)BigHour, (int)BigMinute, (int)BigSecond];
    TEST_NSLog(@"%@", str1);
 NSString *h1  = [str1 stringByAppendingString:hPath];
	    TEST_NSLog(@"%@", h1);
 NSString *m1= [str1 stringByAppendingString:mPath];
	
	NSFileManager *f = [NSFileManager defaultManager];

	for (NSString *tString in dirContents)
	{
		if([tString hasSuffix:@"_h"] || [tString hasSuffix:@"_m"])
			if([MString StringHaveString:tString :str3])
 			if(![tString isEqualToString:hPath] && ![tString isEqualToString:mPath])
			{
       	        NSString *hPath1 = [str1 stringByAppendingString:tString];
				NSLog(@"%@", hPath1);
				if([f fileExistsAtPath:hPath1])
				{
					[f removeItemAtPath:hPath1 error:nil];
				}
			}
	}

	
//	NSString *hPath1 = [h1 stringByAppendingString:hPath];
//	NSString *mPath1 = [m1 stringByAppendingString:mPath];
	NSString *tohpath = [str1 stringByAppendingFormat:@"%@.h",str3];
	NSString *tompath = [str1 stringByAppendingFormat:@"%@.m",str3];
	TEST_NSLog(@"%@,%@, %@",tohpath,str3, h1);
	
//	  [f removeITem\:hPath toPath:tohpath error:nil];
	if([f fileExistsAtPath:h1] && [f fileExistsAtPath:m1])
	{
		bool result1 = [MStringFile SaveFileWithTimeAdd:tohpath :@"h"];
		bool result2 = [MStringFile SaveFileWithTimeAdd:tompath :@"m"];
 		if(result1 && result2)
		{
		    [f removeItemAtPath:tohpath error:nil];
			[f removeItemAtPath:tompath error:nil];

		
			[f moveItemAtPath:h1 toPath:tohpath error:nil];
			[f moveItemAtPath:m1 toPath:tompath error:nil];
		}
	}
}


+ (NSMutableArray *)getFileListAtPathWithHouZhui:(NSString *)houzhui :(NSString *)dir
{
	NSArray *dirContents = [[NSFileManager defaultManager]
							contentsOfDirectoryAtPath:dir error:nil];
	NSMutableArray *arr2 = [[NSMutableArray alloc] init];
	for(int i = 0;i  < [dirContents count];i ++)
	{
		NSString *tString = [dirContents objectAtIndex:i];
		if([tString hasSuffix:houzhui])
		{
			NSString *path = [dir stringByAppendingFormat:@"/%@", tString];
		//	NSLog(@"%@", path);
			[arr2 addObject:path];
		}
	}
	return arr2;
}

+ (void)removeNotNewAtPath:(NSString *)path
{
 	NSString *str = [path lastPathComponent];
	NSArray *b = [str componentsSeparatedByString:@"."];
	NSString *str3 = [b objectAtIndex:0];
	NSArray *a = [path componentsSeparatedByString:str];
	NSString *str1 = [a objectAtIndex:0];
	NSArray *dirContents = [[NSFileManager defaultManager]
							contentsOfDirectoryAtPath:str1 error:nil];
	NSMutableArray *hArr = [[NSMutableArray alloc] init];
	
	for (NSString *tString in dirContents)
	{
		if([tString hasSuffix:@"_h"])
		{
		   	NSArray *array = [tString componentsSeparatedByString:@"_"];
			[hArr addObject:array];
		}
	}
	TEST_NSLog(@"%@", hArr);
	
	NSInteger BigYear = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:1] integerValue] > BigYear)
		{
			BigYear = [[arr objectAtIndex:1] integerValue];
		}
	}
	
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
		if([[arr objectAtIndex:1] integerValue] != BigYear)
		{
			[hArr removeObject:arr];
		}
	}
	///////////////
	NSInteger BigMonth = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:2] integerValue] > BigMonth && [[arr objectAtIndex:1] integerValue] == BigYear)
		{
			BigMonth = [[arr objectAtIndex:2] integerValue];
		}
	}
	
	
    ////////////////////////
	NSInteger BigDay = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:3] integerValue] > BigDay && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear))
		{
			BigDay = [[arr objectAtIndex:3] integerValue];
		}
	}
	
	
	///////////////////////
	NSInteger BigHour = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:4] integerValue] > BigHour && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay))
		{
			BigHour = [[arr objectAtIndex:4] integerValue];
		}
	}
	
	
	///////////////////////
	NSInteger BigMinute = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:5] integerValue] > BigMinute && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay && [[arr objectAtIndex:4] integerValue] == BigHour))
		{
			BigMinute = [[arr objectAtIndex:5] integerValue];
		}
	}
	
	
	//////////////////////////
	NSInteger BigSecond = 0;
	for(int i = 0;i < [hArr count];i ++)
	{
		NSArray *arr  =[hArr objectAtIndex:i];
        if([[arr objectAtIndex:6] integerValue] > BigSecond && ([[arr objectAtIndex:2] integerValue] == BigMonth  && [[arr objectAtIndex:1] integerValue] == BigYear && [[arr objectAtIndex:3] integerValue] == BigDay && [[arr objectAtIndex:4] integerValue] == BigHour && [[arr objectAtIndex:5] integerValue] == BigMinute))
		{
			BigSecond = [[arr objectAtIndex:6] integerValue];
		}
	}
	
	
	
	
	
    NSString *hPath = [NSString stringWithFormat:@"%@_%d_%d_%d_%d_%d_%d_h",str3, (int)BigYear, (int)BigMonth, (int)BigDay, (int)BigHour, (int)BigMinute, (int)BigSecond];
	TEST_NSLog(@"%@", hPath);
	NSString *mPath = [NSString stringWithFormat:@"%@_%d_%d_%d_%d_%d_%d_m", str3, (int)BigYear, (int)BigMonth, (int)BigDay, (int)BigHour, (int)BigMinute, (int)BigSecond];
    TEST_NSLog(@"%@", str1);
//	NSString *h1  = [str1 stringByAppendingString:hPath];
//	TEST_NSLog(@"%@", h1);
//	NSString *m1= [str1 stringByAppendingString:mPath];
	
	NSFileManager *f = [NSFileManager defaultManager];
	
	for (NSString *tString in dirContents)
	{
		if([tString hasSuffix:@"_h"] || [tString hasSuffix:@"_m"])
			if([MString StringHaveString:tString :str3])
 			if(![tString isEqualToString:hPath] && ![tString isEqualToString:mPath])
			{
       	        NSString *hPath1 = [str1 stringByAppendingString:tString];
				NSLog(@"%@", hPath1);
				if([f fileExistsAtPath:hPath1])
				{
					[f removeItemAtPath:hPath1 error:nil];
				}
			}
	}
	
}


@end

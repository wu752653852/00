 
#import "zuzhuang.h"
#import "MMStringFile.h"
#import "GetHeader.h"
#import "GetMFile.h"
 @implementation zuzhuang
- (id)init:(NSString *)hPath1 :(NSString *)mPath1 :(NSString *)file1
{
	if(self = [super init])
	{
		if(hPath1 == nil || mPath1 == nil)
		{
			return nil;
		}
		hPath = hPath1;
		mPath = mPath1;
		file = file1;
		[self load];
	}
	return self;
}
- (void)load
{
	ToHFile = [MMStringFile GetStringFromDir:hPath];
	ToMFile = [MMStringFile GetStringFromDir:mPath];
	
	[MMStringFile SaveFileWithTimeAdd:hPath :@"h"];
	[MMStringFile SaveFileWithTimeAdd:mPath :@"m"];
	[MMStringFile removeNotNewAtPath:hPath];
	
	
}
- (NSString *)HGet
{
	GetHeader *he = [[GetHeader alloc] init:ToHFile :file];
	ToHFile = [he GetH];
	return ToHFile;
}
- (NSString *)MGet
{
	GetMFile *me = [[GetMFile alloc] init:ToMFile :file];
	ToMFile = [me GetM];
	return ToMFile;
}
- (void)GetInSert
{

	
 	GetHeader *he = [[GetHeader alloc] init:ToHFile :file];
	ToHFile = [he GetH];
	VVLog(@"%@", ToHFile);
	
	
	GetMFile *me = [[GetMFile alloc] init:ToMFile :file];
	ToMFile = [me GetM];
	VVLog(@"%@", ToMFile);
}
@end
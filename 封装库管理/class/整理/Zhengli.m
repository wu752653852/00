 
#import "Zhengli.h"
#import "ZhengliH.h"
#import "ZhengliM.h"
#import "MMDate.h"
#import "MMStringFile.h"

@implementation Zhengli
- (id)init:(NSString *)hPath1 :(NSString *)mPath1
{
	if(self = [super init])
	{
		hPath = hPath1;
		mPath = mPath1;
		[self load];
	}
	return self;
}
- (id)init:(NSString *)h1 klk:(NSString *)m1 :(NSString *)hpath :(NSString *)mPath1
{
	if(self = [super init])
	{
		ToHFile = h1;
		ToMFile = m1;
		hPath = hpath;
		mPath = mPath1;
 	}
	return self;
}
- (void)load
{
	ToHFile = [MMStringFile GetStringFromDir:hPath];
	ToMFile = [MMStringFile GetStringFromDir:mPath];
}
- (void)ExportLian
{
	[self Zhengli];
	[MMStringFile SaveStringToDir:ToHFile to:hPath];
	[MMStringFile SaveStringToDir:ToMFile to:mPath];
}
- (void)Export
{
	[self Zhengli];
	bool result1 = [MMStringFile SaveFileWithTimeAdd:hPath :@"h"];
	bool result2 = [MMStringFile SaveFileWithTimeAdd:mPath :@"m"];
	[MMStringFile removeNotNewAtPath:hPath];
	if(result1 && result2)
	{
 		[MMStringFile SaveStringToDir:ToHFile to:hPath];
 		[MMStringFile SaveStringToDir:ToMFile to:mPath];
	}
}
- (void)Zhengli
{
	MMDate *m = [[MMDate alloc] init];
	NSString *ti = [NSString stringWithFormat:@"_%d_%d_%d", m.hour,m.minute,m.second];
	
	
	ZhengliH *h = [[ZhengliH alloc] init:ToHFile :ti];
	ToHFile = [h GetH];
	
	ZhengliM *m1 = [[ZhengliM alloc] init:ToMFile :ti];
	ToMFile = [m1 GetM];
}
@end
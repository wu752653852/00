 
#import <Foundation/Foundation.h>
@interface zuzhuang : NSObject
{
	NSString *hPath;
	NSString *mPath;
	NSString *file;
	
	NSString *ToHFile;
	NSString *ToMFile;
}

- (id)init:(NSString *)hPath1 :(NSString *)mPath1 :(NSString *)file1;
- (NSString *)HGet;
- (NSString *)MGet;

@end
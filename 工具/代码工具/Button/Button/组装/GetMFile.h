//
//  GetMFile.h
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetMFile : NSObject
{
	NSMutableString *ToMFile;
	NSString *file;
}

- (id)init:(NSString *)str :(NSString *)str1;

- (NSString *)GetM;
@end

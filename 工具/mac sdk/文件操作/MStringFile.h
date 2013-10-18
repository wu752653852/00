//
//  StringFile.h
//  cartoon
//
//  Created by apple on 13-10-15.
//
//

#import <Foundation/Foundation.h>

@interface MStringFile : NSObject
+ (void)SaveStringToFile:(NSString *)string to:(NSString *)fileName;
+ (NSString *)GetStringFromFile:(NSString *)fileName;

+ (void)SaveStringToDir:(NSString *)string to:(NSString *)fileName;
+ (NSString *)GetStringFromDir:(NSString *)fileName;

//+ (NSArray *)GetStringFromFile:(NSString *)fileName :(NSString *)selectName;


+ (void)SetHeaderAndMFilePath:(NSString **)header :(NSString **)mfile :(NSString *)cankao;

+ (bool)SaveFileWithTimeAdd:(NSString *)path :(NSString *)addStr;


+ (void)BackStepNearTime:(NSString *)path;


+ (NSMutableArray *)getFileListAtPathWithHouZhui:(NSString *)houzhui :(NSString *)dir;

+ (void)removeNotNewAtPath:(NSString *)path;



@end

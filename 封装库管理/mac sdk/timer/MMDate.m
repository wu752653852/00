//
//  MDate.m
//  VVTest
//
//  Created by apple on 13-10-21.
//  Copyright (c) 2013年 wwegos. All rights reserved.
//

#import "MMDate.h"

@implementation MMDate
@synthesize year;
@synthesize month;
@synthesize day;
@synthesize hour;
@synthesize minute;
@synthesize second;

- (id)init
{
	if(self = [super init])
	{
		NSDate *date = [NSDate date];
		NSCalendar *calendar = [NSCalendar currentCalendar];
		NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit) fromDate:date];
		  year = (int)[components year];
		  month = (int)[components month];
		  day = (int)[components day];
		  hour = (int)[components hour] ;
		  minute = (int)[components minute];
		  second = (int)[components second];
	}
	return self;
}

 @end

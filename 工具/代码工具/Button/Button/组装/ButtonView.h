//
//  ButtonView.h
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ButtonView : NSView<NSTextFieldDelegate,
NSTableViewDelegate,NSValidatedUserInterfaceItem>
{
	NSTextField *text;
	
	NSTextField *text2;
	NSMutableArray *array_mut;
	NSMutableArray *buttonArray;
}
@end

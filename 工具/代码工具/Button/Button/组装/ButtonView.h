 
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
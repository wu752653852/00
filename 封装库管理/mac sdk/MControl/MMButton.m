 
#import "MMButton.h"
@implementation MMButton
+ (NSButton*)GetStringButton:(NSString *)title :(NSPoint)center :(SEL)fun :(id)father
{
	NSButton *button = [[NSButton alloc] init];
	button.title = title;
	[button sizeToFit];
	NSRect rect = CGRectMake(center.x - button.frame.size.width / 2, 480 - center.y - button.frame.size.height / 2, button.frame.size.width, button.frame.size.height);
	[button setFrame:rect];
	
	[button setTarget:father];
	[button setAction:fun];
 	
	return button;
}
@end
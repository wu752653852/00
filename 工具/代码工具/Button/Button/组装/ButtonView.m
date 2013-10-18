//
//  ButtonView.m
//  Button
//
//  Created by apple on 13-10-16.
//  Copyright (c) 2013年 manboker. All rights reserved.
//

#import "ButtonView.h"
#import "MStringFile.h"
#import "zuzhuang.h"
#import "MButton.h"
#import "MDebugUtils.h"
#import "Zhengli.h"
#import "MString.h"
@implementation ButtonView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self load];
/// 		[self setAcceptsTouchEvents:YES];
//		[self setWantsRestingTouches:YES]; // for thumb
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

- (void)load
{

	if(text == nil)
 	 text = [[NSTextField alloc] initWithFrame:CGRectMake(120, 480 - 40, 160, 30)];
	text.delegate = self;
	[text setSelectable:YES];
	[text setEditable:YES];
  	[self addSubview:text];
 	[text becomeFirstResponder];
 
 	
	
	if(text2 == nil)
	
			text2 = [[NSTextField alloc] initWithFrame:CGRectMake(120, 240, 160, 30)];
		text2.delegate = self;
	 
		[self addSubview:text2];
	
		
	[self loadButton];
  
	
 	/////////////
	{
		NSRect rect = CGRectMake(0, 480 - 40, 60, 30);
		
		NSButton *button  = [[NSButton alloc] init];
		NSImage *image =[NSImage imageNamed:@"exit.png"];
		[button setImage:image];
		[self addSubview:button];
		[button setFrame:rect];
		[button setTarget:self];
		[button setAction:@selector(JISuan2)];
	}
	
 
	
	{
		NSRect rect = CGRectMake(0, 480 - 40, 60, 30);
		
		NSButton *button  = [[NSButton alloc] init];
		NSImage *image =[NSImage imageNamed:@"exit.png"];
		[button setImage:image];
		[self addSubview:button];
		[button setFrame:rect];
		[button setTarget:self];
		[button setAction:@selector(JISuan2)];
	}
	
	{
		NSRect rect = CGRectMake(240, 40, 60, 30);
		
		NSButton *button  = [[NSButton alloc] init];
		NSImage *image =[NSImage imageNamed:@"chexiao.png"];
		[button setImage:image];
		[self addSubview:button];
		[button setFrame:rect];
		[button setTarget:self];
		[button setAction:@selector(JISuan4)];
	}
	
	{
		NSRect rect = CGRectMake(240, 400, 60, 30);
		
		NSButton *button  = [[NSButton alloc] init];
		NSImage *image =[NSImage imageNamed:@"zhengli.png"];
		[button setImage:image];
		[self addSubview:button];
		[button setFrame:rect];
		[button setTarget:self];
		[button setAction:@selector(JISuan5)];
	}
	
 
}

- (void)loadButton
{
	if(array_mut == nil)
	{
		array_mut = [[NSMutableArray alloc] init];
	}
	
	if(buttonArray == nil)
	{
		buttonArray = [[NSMutableArray alloc] init];
	}
	
    if([array_mut count] > 0)
	{
		[array_mut removeAllObjects];
	}
	
	if([buttonArray count] > 0)
	{
		[buttonArray removeAllObjects];
	}
	NSString *path112 = [MString GetDesktopDir:@"/tool/模板"];
	if([[text2 stringValue] length] < 1)
	{
 		
   		
		  
		
    	NSMutableArray *array_mu0t = [MStringFile getFileListAtPathWithHouZhui:@"txt" :path112];
		array_mut = [array_mu0t mutableCopy];
	}
	else
	{
		NSArray *array_o = [MStringFile getFileListAtPathWithHouZhui:@"txt" :path112];
    	TEST_NSLog(@"%d", (int)[array_o count]);
		for(NSString *str in array_o)
		{
  			NSString *str1 = [str lastPathComponent];
			//			NSArray *a = [str1 componentsSeparatedByString:[text2 stringValue]];
			if([MString StringHaveString:str1 :[text2 stringValue]])
			{
				NSLog(@"%@", str1);
				//				[array_o removeObject:str];
				[array_mut addObject:str];
			}
		}
		//	array_mut = [array_o mutableCopy];
		
		/*for(int i = 0;i < [array_mut count];i ++)
		 {
		 NSString *str = [array_mut objectAtIndex:i];
		 NSString *str1 = [str lastPathComponent];
		 NSArray *a = [str1 componentsSeparatedByString:[text2 stringValue]];
		 TEST_NSLog(@"%@, %d", str1, (int)[a count]);
		 
		 if([a count] < 2)
		 {
		 NSLog(@"%@", str1);
		 
		 [array_mut removeObjectAtIndex:i];
		 }
		 }*/
	}
	
	//	NSTableView *tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 40, 119, 480 - 60)];
	//	tableView.delegate = self;
	//	NSScrollView *scroll  =[[NSScrollView alloc] initWithFrame:NSMakeRect(0, 40, 200, 480 )];
	
	
	for(int i = 0;i < [array_mut count];i ++)
	{
		NSString *str = [[array_mut objectAtIndex:i] lastPathComponent];
		
		NSLog(@"%@", str);
		NSButton *button = [MButton GetStringButton:str :NSMakePoint(60 , 60 * (i + 1)) :@selector(JISuan3:) :self];
		button.tag = i;
		[buttonArray addObject:button];
     	[self addSubview:button];
 	}
}

- (void)JISuan
{
	NSString *str = [MStringFile GetStringFromFile:@"button.txt"];
	TEST_NSLog(@"%@", str);
	
	[self save:str];
}

- (void)JISuan2
{
    exit(0);
}

- (void)JISuan3:(id)sender
{
    if([text stringValue] != nil && [[text stringValue] length] > 1)
	{
		NSString *hPath;
		NSString *mPath;
		[MStringFile SetHeaderAndMFilePath:&hPath :&mPath :[text stringValue]];
		
		NSString *dir = [array_mut objectAtIndex:[sender tag]];
		NSString *str = [MStringFile GetStringFromDir:dir];

		
		TEST_NSLog(@"%@, %@", hPath, mPath);
		zuzhuang *zu = [[zuzhuang alloc] init:hPath :mPath :str];
         NSString *h = [zu HGet];
		NSString *m = [zu MGet];
	    Zhengli *zheng = [[Zhengli alloc] init:h klk:m :hPath :mPath];
 
//		- (id)init:(NSString *)h1 klk:(NSString *)m1
   
		[zheng ExportLian];
	}
}



- (void)save:(NSString *)str
{
	[MStringFile SaveStringToFile:str to:@"uu"];
}

- (void)JISuan4
{
	if([text stringValue] != nil && [[text stringValue] length] > 1)
	{
		[MStringFile BackStepNearTime:[text stringValue]];
	}
}

- (void)JISuan5
{
	if([text stringValue] != nil && [[text stringValue] length] > 1)
	{
		NSString *hPath;
		NSString *mPath;
		[MStringFile SetHeaderAndMFilePath:&hPath :&mPath :[text stringValue]];
		Zhengli *zheng = [[Zhengli alloc] init:hPath :mPath];
		[zheng Export];
//		NSString *ToHFile = [MStringFile GetStringFromDir:hPath];
//		NSString *ToMFile = [MStringFile GetStringFromDir:mPath];
//		bool result1 = [MStringFile SaveFileWithTimeAdd:hPath :@"h"];
//		bool result2 = [MStringFile SaveFileWithTimeAdd:mPath :@"m"];
//		if(result1 && result2)
//		{
			
//		}
	}
}

- (void)JISuan99
{
 	for(int i = 0;i < [buttonArray count];i ++)
	{
		NSButton *button = [buttonArray objectAtIndex:i];
		[button removeFromSuperview];
	}
		
	[self loadButton];
}



- (void)controlTextDidChange:(NSNotification *)obj
{
 	[self JISuan99];
}

/*
- (NSView *)hitTest:(NSPoint)aPoint
{
    // pass-through events that don't hit one of the visible subviews
    for (NSView *subView in [self subviews]) {
        if (![subView isHidden] && [subView hitTest:aPoint])
            return subView;
    }
	
    return nil;
}



- (void)mouseDragged:(NSEvent *)theEvent
{
	[self JISuan99];

    [super mouseDragged:theEvent];
}
	*/

- (NSView *)findNextSiblingBelowEventLocation:(NSEvent *)theEvent {
	// Translate the event location to view coordinates
	NSPoint location = [theEvent locationInWindow];
	NSPoint convertedLocation = [self convertPointFromBase:location];
	
	// Find next view below self
	NSArray *siblings = [[self superview] subviews];
	NSView *viewBelow = nil;
	for (NSView *view in siblings) {
		if (view != self) {
			NSView *hitView = [view hitTest:convertedLocation];
			if (hitView != nil) {
				viewBelow = hitView;
			}
		}
	}
	return viewBelow;
}

- (void)mouseDown:(NSEvent *)theEvent {
	[self JISuan99];

	NSView *viewBelow = [self findNextSiblingBelowEventLocation:theEvent];
	if (viewBelow) {
		[[self window] makeFirstResponder:viewBelow];
	}
	[super mouseDown:theEvent];
}



@end

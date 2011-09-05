//
//  RumexCustomTabBar.m
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import "RXCustomTabBar.h"

@implementation RXCustomTabBar

@synthesize buttons;



- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self hideTabBar];
	[self addCustomElements];
}

- (void)hideTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

- (void)hideNewTabBar 
{
    for (UIButton *button in self.buttons) {
        button.hidden = YES;
    }
}

- (void)showNewTabBar 
{
    for (UIButton *button in self.buttons) {
        button.hidden = NO;
    }
}

-(NSMutableArray *)buttons {
    if (buttons == nil) 
        buttons = [NSMutableArray array];
    return buttons;
}

-(int) buttonWidth {
    return 80;
}

-(void) addCustomElement:(NSString*)normalImage selectedImage:(NSString*)selectedImage which:(int)which {
	UIImage *btnImage = [UIImage imageNamed:normalImage];
	UIImage *btnImageSelected = [UIImage imageNamed:selectedImage];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
	btn1.frame = CGRectMake(which*[self buttonWidth], 430, 80, 50); // Set the frame (size and position) of the button)
	[btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
	[btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
	[btn1 setTag:which]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
	[btn1 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
    [self.buttons addObject:btn1];
    [self.view addSubview:btn1];
	// Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
	[btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addCustomElements
{
    [self addCustomElement:@"NavBar_01.png" selectedImage:@"NavBar_01_s.png" which:0];
    [self addCustomElement:@"NavBar_02.png" selectedImage:@"NavBar_02_s.png" which:1];
    [self addCustomElement:@"NavBar_03.png" selectedImage:@"NavBar_03_s.png" which:2];
    [self addCustomElement:@"NavBar_04.png" selectedImage:@"NavBar_04_s.png" which:3];
    NSLog(@"yes %d", [self.buttons count]);
	
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
    NSLog(@"what's up %@", self.buttons);
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    for (int i=0; i<[self.buttons count]; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        button.selected = (tabID == i);
        NSLog(@"see we're %d and we're selected? %d", i, button.selected);
    }
	self.selectedIndex = tabID;
	
	
}

@end

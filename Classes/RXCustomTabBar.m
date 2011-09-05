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
    if (!self.buttons)
        self.buttons = [NSMutableArray array];
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


-(int) buttonWidth {
    return 80;
}

-(void) addCustomElement:(NSString*)normalImage selectedImage:(NSString*)selectedImage which:(int)which {
	UIImage *btnImage = [UIImage imageNamed:normalImage];
	UIImage *btnImageSelected = [UIImage imageNamed:selectedImage];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn1.frame = CGRectMake(which*[self buttonWidth], 430, 80, 50); 
	[btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; 
    [btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; 
	[btn1 setTag:which]; 
	[btn1 setSelected:true]; 
    NSLog(@"made it %d", which);
    [self.buttons addObject:btn1];
    [self.view addSubview:btn1];
	[btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addCustomElements
{
    int i = 0;
    [self addCustomElement:@"NavBar_01.png" selectedImage:@"NavBar_01_s.png" which:i++];
    [self addCustomElement:@"NavBar_02.png" selectedImage:@"NavBar_02_s.png" which:i++];
    [self addCustomElement:@"NavBar_03.png" selectedImage:@"NavBar_03_s.png" which:i++];
    [self addCustomElement:@"NavBar_04.png" selectedImage:@"NavBar_04_s.png" which:i++];
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    for (int i=0; i<[self.buttons count]; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        button.selected = (tabID == i);
    }
	self.selectedIndex = tabID;
	
	
}

-(void)dealloc {
    self.buttons = nil;
}

@end

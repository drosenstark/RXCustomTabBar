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

-(void)viewDidLoad {
	[self hideTabBar];

}



-(NSMutableArray *)buttons {
    if (!buttons)
        self.buttons = [NSMutableArray array];
    return buttons;

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

- (int) buttonHeight {
    return 50;
}

-(int) buttonWidth {
    return 80;
}

- (void) layoutButtons {
    int totalWidthOfButtons = [self.buttons count]*[self buttonWidth];
    float startingX = self.view.frame.size.width/2 - totalWidthOfButtons/2;
    
    
    for (int i=0; i<[self.buttons count]; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        button.frame = CGRectMake(startingX + i*[self buttonWidth], self.view.frame.size.height - [self buttonHeight], [self buttonWidth], [self buttonHeight]); 
    }
}

-(void) addCustomElement:(NSString*)normalImage selectedImage:(NSString*)selectedImage {
    int which = [self.buttons count];
	UIImage *btnImage = [UIImage imageNamed:normalImage];
	UIImage *btnImageSelected = [UIImage imageNamed:selectedImage];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; 
    [btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; 
	[btn1 setTag:which]; 
	[btn1 setSelected:true]; 
    [self.buttons addObject:btn1];
    [self.view addSubview:btn1];
	[btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
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

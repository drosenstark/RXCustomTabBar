//
//  Was RumexCustomTabBar.m
//

#import "RXCustomTabBar.h"

@implementation RXCustomTabBar

@synthesize buttons, buttonWidth, buttonHeight;

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
    self.tabBar.hidden = YES;
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
	UIImage *buttonImage = [UIImage imageNamed:normalImage];
	UIImage *buttonImageSelected = [UIImage imageNamed:selectedImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage:buttonImage forState:UIControlStateNormal]; 
    [button setBackgroundImage:buttonImageSelected forState:UIControlStateSelected]; 
	[button setTag:which]; 
	[button setSelected:true]; 
    [self.buttons addObject:button];
    [self.view addSubview:button];
	[button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
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

//
//  Was RumexCustomTabBar.m
//

#import "RXCustomTabBar.h"

@implementation RXCustomTabBar

@synthesize buttons, buttonWidth, buttonHeight, useRealButtonWidth;

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
    int totalWidthOfButtons = 0;
    if (useRealButtonWidth) {
        totalWidthOfButtons = 0;
        for (UIButton *button in self.buttons) {
            totalWidthOfButtons += button.frame.size.width;
        }
    } else 
        totalWidthOfButtons = [self.buttons count]*[self buttonWidth];

    float startingX = self.view.frame.size.width/2 - totalWidthOfButtons/2;
    
    for (int i=0; i<[self.buttons count]; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        float width = useRealButtonWidth ? button.frame.size.width : [self buttonWidth];
        button.frame = CGRectMake(startingX + i*width, self.view.frame.size.height - [self buttonHeight], width, [self buttonHeight]); 
    }
}


-(void) addButton:(UIButton*)button asTab:(int)tabId {
	[button setTag:tabId]; 
	[button setSelected:true]; 
    [self.buttons addObject:button];
    [self.view addSubview:button];
	[button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

}

-(void) addButtonWithImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage {
	UIImage *buttonImage = [UIImage imageNamed:normalImage];
	UIImage *buttonImageSelected = [UIImage imageNamed:selectedImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage:buttonImage forState:UIControlStateNormal]; 
    [button setBackgroundImage:buttonImageSelected forState:UIControlStateSelected]; 
    [self addButton:button asTab:[self.buttons count]];
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

//
//  Was RumexCustomTabBar.m
//

#import "RXCustomTabBar.h"

@implementation RXCustomTabBar

@synthesize buttons, buttonWidth, buttonHeight, useRealButtonWidth;

-(void)viewDidLoad {
	[self hideTabBar];

}


- (void) addChildViewControllerDeprecated:(UIViewController *)childController {
    // iOS 5.0 code
    [super addChildViewController:childController];
    // iOS 4.0 code
    NSMutableArray *controllers = [self.viewControllers mutableCopy];
    [controllers addObject:childController];
    [self setViewControllers:controllers animated:NO];
}



-(NSMutableArray *)buttons {
    if (!buttons)
        self.buttons = [NSMutableArray array];
    return buttons;

}

- (void)hideTabBar
{
    self.tabBar.hidden = YES;
    CGRect frame = self.tabBar.frame;
    UIView *newTabBar = [[[UIView alloc] initWithFrame:CGRectMake(0,frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - frame.size.height)] autorelease];
    newTabBar.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:.1];
    [self.tabBar.superview addSubview:newTabBar];
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
    if (![self.buttons containsObject:button])
        [self.buttons addObject:button];
    if (button.superview != self.view) {
        [self.view addSubview:button];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }

}

-(void) addButtonWithText:(NSString*)text {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [self addButton:button asTab:[self.buttons count]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button-normal-blue.png"] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"button-normal.png"] forState:UIControlStateNormal];
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

- (void) redoButtonSetup {
    NSLog(@"buttons count %d", [self.buttons count]);
    for (int i=0; i<[self.buttons count]; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        [self addButton:button asTab:i];
    }

}


-(void)dealloc {
    self.buttons = nil;
}

@end

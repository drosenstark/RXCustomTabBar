//
//  RumexCustomTabBar.h
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXCustomTabBar : UITabBarController {
}

@property (nonatomic, retain) IBOutletCollection(UIButton) NSMutableArray *buttons;
@property (nonatomic, assign) int buttonWidth;
@property (nonatomic, assign) int buttonHeight;
@property (nonatomic, assign) BOOL useRealButtonWidth;

- (void) addChildViewControllerDeprecated:(UIViewController *)childController;
- (void) hideTabBar;
- (void) selectTab:(int)tabID;

- (void) hideNewTabBar;
- (void) showNewTabBar;
- (void) addButton:(UIButton*)button asTab:(int)tabId;
- (void) addButtonWithImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage;
- (void) addButtonWithText:(NSString*)text;
- (void) layoutButtons;
- (void) redoButtonSetup;

@end

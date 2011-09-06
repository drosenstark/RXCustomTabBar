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

@property (nonatomic, retain) NSMutableArray *buttons;
@property (nonatomic, assign) int buttonWidth;
@property (nonatomic, assign) int buttonHeight;


-(void) hideTabBar;
-(void) selectTab:(int)tabID;

-(void) hideNewTabBar;
-(void) showNewTabBar;
-(void) addCustomElement:(NSString*)normalImage selectedImage:(NSString*)selectedImage;
- (void) layoutButtons;

@end

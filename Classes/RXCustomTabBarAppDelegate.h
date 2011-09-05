//
//  RumexCustomTabBarAppDelegate.h
//  RumexCustomTabBar
//
//  Created by Oliver Farago on 18/11/2010.
//  Copyright 2010 Rumex IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXCustomTabBarAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

@end

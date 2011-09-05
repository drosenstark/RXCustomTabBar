//
//  ViewController.m
//  RXCustomTab
//
//  Created by Daniel Rosenstark on 9/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void) makeViewController:(UIColor*)color {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    controller.view.backgroundColor = color;
    [self addChildViewController:controller];
    
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeViewController:[UIColor blueColor]];
    [self makeViewController:[UIColor greenColor]];
    [self makeViewController:[UIColor redColor]];
    [self makeViewController:[UIColor purpleColor]];

    int i = 0;
    [self addCustomElement:@"NavBar_01.png" selectedImage:@"NavBar_01_s.png" which:i++];
    [self addCustomElement:@"NavBar_02.png" selectedImage:@"NavBar_02_s.png" which:i++];
    [self addCustomElement:@"NavBar_03.png" selectedImage:@"NavBar_03_s.png" which:i++];
    [self addCustomElement:@"NavBar_04.png" selectedImage:@"NavBar_04_s.png" which:i++];


}

-(void)viewDidAppear:(BOOL)animated {
    [self layoutButtons];
    [self selectTab:0];


}





@end

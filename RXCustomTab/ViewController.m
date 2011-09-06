//
//  ViewController.m
//  RXCustomTab
//
//  Created by Daniel Rosenstark on 9/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize test;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    id retVal = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSLog(@"what? %@", [retVal test]);
    return retVal;
}


- (void) makeViewController:(UIColor*)color {
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    controller.view.backgroundColor = color;
    [self addChildViewControllerDeprecated:controller];
    
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"how many %d %@", self.buttons.count, self.test);
    
    self.buttonWidth = 80;
    self.buttonHeight = 50;
    
    [self makeViewController:[UIColor blueColor]];
    [self makeViewController:[UIColor greenColor]];
    [self makeViewController:[UIColor redColor]];
    [self makeViewController:[UIColor purpleColor]];
    
//    self.useRealButtonWidth = YES;


    /*
    [self addButtonWithImage:@"NavBar_01.png" selectedImage:@"NavBar_01_s.png"];
    [self addButtonWithImage:@"NavBar_02.png" selectedImage:@"NavBar_02_s.png"];
    [self addButtonWithImage:@"NavBar_03.png" selectedImage:@"NavBar_03_s.png"];
    [self addButtonWithImage:@"NavBar_04.png" selectedImage:@"NavBar_04_s.png"];
     */
    
    [self addButtonWithText:@"what?"];
    [self addButtonWithText:@"what?"];
    [self addButtonWithText:@"what?"];
    [self addButtonWithText:@"what?"];

    [self redoButtonSetup];

}

-(void)viewDidAppear:(BOOL)animated {
    [self layoutButtons];
    [self selectTab:0];


}





@end

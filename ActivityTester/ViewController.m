//
//  ViewController.m
//  ActivityTester
//
//  Created by dan schnabel on 2015-10-30.
//  Copyright (c) 2015 dan schnabel. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

ActIndCircleOne    *activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_repeatButton setEnabled:NO];
    [_repeatButton setAlpha:0.3];
    
    activityIndicator = [[ActIndCircleOne alloc] init];
    [activityIndicator setHidden:NO];

    CGRect tempFrame = CGRectMake(10, 30, 300, 369);    // This is the frame of the image, as shown in the Main Storybouard
    [activityIndicator setFrame:tempFrame];

    [self.view addSubview:activityIndicator];
    [activityIndicator start];
    
    [self performSelector:@selector(stopTheIndicator) withObject:nil afterDelay:10];
    [self performSelector:@selector(hideTheIndicator) withObject:nil afterDelay:13];
}

-(void) stopTheIndicator {
    [activityIndicator stop];
}

-(void) hideTheIndicator {
    [activityIndicator setHidden:YES];
    [_repeatButton setEnabled:YES];
    [_repeatButton setAlpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)repeatButtonPress:(id)sender {
    [_repeatButton setEnabled:NO];
    [_repeatButton setAlpha:0.3];
    [activityIndicator setHidden:NO];
    [activityIndicator start];
    [self performSelector:@selector(stopTheIndicator) withObject:nil afterDelay:10];
    [self performSelector:@selector(hideTheIndicator) withObject:nil afterDelay:13];
}

@end

//
//  ViewController.h
//  ActivityTester
//
//  Created by dan schnabel on 2015-10-30.
//  Copyright (c) 2015 dan schnabel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ActIndCircleOne.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *repeatButton;

- (IBAction)repeatButtonPress:(id)sender;

@end


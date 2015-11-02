//
//  ActIndCircleOne.h
// 
//
//  Created by dan schnabel on 2015-10-30.
//  Copyright (c) 2015 dan schnabel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActIndCircleOne : UIView {
    NSTimer    *animationTimer;
    float       trueFrameSize;        // Although setFrame may be anything, the trueFrameSize of the activity indicator is 50x50
    CGPoint     movingCircleCentre;
    float       movingCircleStep;     // How much the moving circle moves every 0.02 seconds
}


@property (nonatomic) NSInteger actIndSize;

-(ActIndCircleOne *) init;
-(void) setFrame:(CGRect)frame;
-(void) start;
-(void) stop;

@end

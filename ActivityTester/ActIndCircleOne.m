//
//  ActIndCircleOne.m
//
//
//  Created by dan schnabel on 2015-10-30.
//  Copyright (c) 2015 dan schnabel. All rights reserved.
//

#import "ActIndCircleOne.h"

@implementation ActIndCircleOne

@synthesize actIndSize;

CGFloat     AIWhiteColour[4] = {1,1,1,1};


- (void)drawRect:(CGRect)rect {
    CGRect    movingCircleRect;
    float     movingCircleRadius;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColor(context, AIWhiteColour);
    CGContextSetFillColor(context, AIWhiteColour);
    
    //
    //    Draw the outline circle
    //
    UIBezierPath *outlineCirclePath = [UIBezierPath bezierPathWithOvalInRect:rect];
    [outlineCirclePath stroke];
    
    //
    //    Draw the moving circle
    //
    movingCircleRadius = MIN(movingCircleCentre.y, rect.size.height - movingCircleCentre.y);     // This is the minimum of the distance to the top or the bottom of the outline circle
    movingCircleRect.origin.x = movingCircleCentre.x - movingCircleRadius;
    movingCircleRect.origin.y = movingCircleCentre.y - movingCircleRadius;
    movingCircleRect.size.width = 2 * movingCircleRadius;
    movingCircleRect.size.height = 2 * movingCircleRadius;
    UIBezierPath *movingCirclePath = [UIBezierPath bezierPathWithOvalInRect:movingCircleRect];
    [movingCirclePath fill];
}

-(ActIndCircleOne *) init {
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setAlpha:0.3];
    return self;
}

-(void) setFrame:(CGRect)frame {
    //
    //   This method sets up the position of the activity indicator.
    //
    //   It is position as a 50x50 view at the centre of the specified frame,
    //   although it may be smaller if the either the width or the height of the
    //   specified frame is smaller.
    //
    CGPoint  centrePoint;
    CGRect   trueFrame;
    
    trueFrameSize = MIN(frame.size.width, frame.size.height);
    trueFrameSize = MIN(trueFrameSize, 50);
    centrePoint.x = frame.origin.x + frame.size.width / 2;
    centrePoint.y = frame.origin.y + frame.size.height / 2;
    trueFrame.size.width = trueFrameSize;
    trueFrame.size.height = trueFrameSize;
    trueFrame.origin.x = centrePoint.x - trueFrameSize / 2;
    trueFrame.origin.y = centrePoint.y - trueFrameSize / 2;

    [super setFrame:trueFrame];
}

-(void) start {
    //
    //   Calling this method starts the animation of the activity indicator
    //
    movingCircleCentre = CGPointMake(trueFrameSize / 2, 0);
    movingCircleStep = trueFrameSize / 40;
    animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(animationStep) userInfo:nil repeats:YES];
}

-(void) animationStep {
    //
    //  This method increments or decrements the position y-value of the movingCircleCentre
    //
    movingCircleCentre.y += movingCircleStep;
    if (movingCircleCentre.y >= trueFrameSize) {
        //
        //   Reached or passed the maximum - set to the maximum (which is the height of the outline circle) and reverse the step
        //
        movingCircleCentre.y = trueFrameSize;
        movingCircleStep = -movingCircleStep;
    }
    if (movingCircleCentre.y <= 0) {
        //
        //   Reached or passed the minimum - set to the minimum (which is zero) and reverse the step
        //
        movingCircleCentre.y = 0;
        movingCircleStep = -movingCircleStep;
    }
    [self setNeedsDisplay];
}


-(void) stop {
    //
    //  Calling this method stops the animation of the activity timer
    //
    [animationTimer invalidate];
    movingCircleCentre = CGPointMake(trueFrameSize / 2, 0);
    movingCircleStep = trueFrameSize / 100;
    [self setNeedsDisplay];
}

@end

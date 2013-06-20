//
//  JCMath.m
//  MyNeuralNetwork
//
//  Created by Jon Como on 11/26/12.
//  Copyright (c) 2012 Jon Como. All rights reserved.
//

#import "JCMath.h"

@implementation JCMath

#pragma Math functions

+(float)angleFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2
{
    float angle;
    
    float dx = point2.x - point1.x;
    float dy = point2.y - point1.y;
    
    angle = atan2f(dy, dx);
    
    return angle;
}

+(double)distanceBetweenPoint:(CGPoint)point1 andPoint:(CGPoint)point2 sorting:(BOOL)sorting
{
    double dx = (point2.x-point1.x);
    double dy = (point2.y-point1.y);
    return sorting ? dx*dx + dy*dy : sqrt(dx*dx + dy*dy);
}

+(CGPoint)pointFromPoint:(CGPoint)point pushedBy:(float)pushAmount inDirection:(float)radians
{
    point.x += pushAmount * cosf(radians);
    point.y += pushAmount * sinf(radians);
    
    return point;
}

@end
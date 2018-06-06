//
//  UIView+GradientColor.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "UIView+GradientColor.h"

typedef NS_OPTIONS(NSUInteger, UIGradientColorDirection)
{
    UIGradientColorDirectionLeftToRight,
    UIGradientColorDirectionRightToLeft,
    UIGradientColorDirectionTopToBottom,
    UIGradientColorDirectionBottomToTop
};

@implementation UIView (GradientColor)

- (void)setGradientColors:(NSArray *)colors byDirection:(NSUInteger)direction
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = colors;
    switch (direction) {
        case UIGradientColorDirectionLeftToRight:
        {
            gradient.startPoint = CGPointMake(0, 0.5);
            gradient.endPoint = CGPointMake(1, 0.5);
        break;
        }
        case UIGradientColorDirectionRightToLeft:
        {
            gradient.startPoint = CGPointMake(1, 0.5);
            gradient.endPoint = CGPointMake(0, 0.5);
            break;
        }
        case UIGradientColorDirectionTopToBottom:
        {
            gradient.startPoint = CGPointMake(0.5, 0);
            gradient.endPoint = CGPointMake(0.5, 1);
            break;
        }
        case UIGradientColorDirectionBottomToTop:
        {
            gradient.endPoint = CGPointMake(0.5, 0);
            gradient.startPoint = CGPointMake(0.5, 1);
            break;
        }
        default:
        break;
    }
    [self.layer addSublayer:gradient];
}
    
@end

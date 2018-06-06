//
//  UIView+Corner.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "UIView+Corner.h"
#import "KeUIKitMacros.h"

@implementation UIView (Corner)

- (void)cornerWithSize:(CGSize)size byRoundingCorners:(UIRectCorner)corners
{
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = nil;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    [self.layer addSublayer:maskLayer];
    self.layer.mask = maskLayer;
}
    
@end

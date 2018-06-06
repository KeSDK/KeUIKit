//
//  UIView+GradientColor.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIGradientColorDirection)
{
    UIGradientColorDirectionLeftToRight,
    UIGradientColorDirectionRightToLeft,
    UIGradientColorDirectionTopToBottom,
    UIGradientColorDirectionBottomToTop
};

@interface UIView (GradientColor)
    
- (void)setGradientColors:(NSArray *)colors byDirection:(UIGradientColorDirection)direction;

@end

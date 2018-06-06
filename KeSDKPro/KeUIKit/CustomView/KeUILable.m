//
//  KeUILable.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeUILable.h"
#import "UIView+Corner.h"
#import "UIView+GradientColor.h"
#import "KeUIKitMacros.h"
#import "UIView+ReadLayer.h"
#import "NSString+StringSize.h"
#import "UILabel+AddContentInsets.h"

#define kUILableMARGIN 12
#define kCornerSize 12

@implementation KeUILable
{
    CGFloat maxWidth;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        maxWidth = [UIScreen mainScreen].bounds.size.width - 50;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = HEXCOLOR(0xFFB100).CGColor;
        self.rectCorner = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight;
        self.gradientColors = [NSArray arrayWithObjects:
                               (id)HEXACOLOR(0xFFD000, 1.0).CGColor,
                               (id)HEXACOLOR(0xFFA000, 1.0).CGColor,
                               nil];

        self.yf_contentInsets = UIEdgeInsetsMake(kUILableMARGIN, kUILableMARGIN, kUILableMARGIN, kUILableMARGIN);
    }
    return self;
}
    
- (void)refreshGradientColors
{
    [self setGradientColors:self.gradientColors byDirection:UIGradientColorDirectionLeftToRight];
}

- (void)refreshRectCorner
{
    [self setCornerWithSize:CGSizeMake(kCornerSize, kCornerSize) byRoundingCorners:self.rectCorner];
}
    
#pragma mark - set
 
- (void)setMaxUIWidth:(CGFloat)width
{
    maxWidth = width;
}

- (void)setGradientColors:(NSArray *)gradientColors
{
    _gradientColors = gradientColors;
    [self setGradientColors:gradientColors byDirection:UIGradientColorDirectionLeftToRight];
}

- (void)setRectCorner:(UIRectCorner)rectCorner
{
    _rectCorner = rectCorner;
    [self setCornerWithSize:CGSizeMake(kCornerSize, kCornerSize) byRoundingCorners:_rectCorner];
}
    
- (void)setText:(NSString *)text
{
    CGSize size = [NSString getSizeWithContent:text font:self.font width:maxWidth];

    self.frame = CGRectMake(self.getOriginX, self.getOriginY, size.width + kUILableMARGIN * 2, size.height + kUILableMARGIN * 2);
    [self.layer setNeedsLayout];
    [self.layer layoutIfNeeded];

    [self refreshGradientColors];
    [self refreshRectCorner];
    [super setText:text];
}


@end

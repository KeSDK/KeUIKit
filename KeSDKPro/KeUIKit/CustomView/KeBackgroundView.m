//
//  KeBackgroundView.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/7.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeBackgroundView.h"

@interface KeBackgroundView ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) CAGradientLayer *gradient;
@property (nonatomic, strong) UIView *contentView;
    
@end;

@implementation KeBackgroundView
{
    CGSize contentSize;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // set defaut config
        [self baseConfig];
        
        [self setLayerWithBorderWidth:1.0f andColor:HEXCOLOR(0xFFB100).CGColor];
        
        self.cornerSize = CGSizeMake(kCornerSize, kCornerSize);
        
        self.rectCorner = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
        
        self.direction = UIGradientColorDirectionRightToLeft;
        self.gradientColors = [NSArray arrayWithObjects:
                               (id)HEXACOLOR(0xFFD000, 1.0).CGColor,
                               (id)HEXACOLOR(0xFFA000, 1.0).CGColor,
                               nil];
        [self refreshUI];
    }
    return self;
}

- (instancetype)initKeUILableWithFrame:(CGRect)frame
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                             direction:(UIGradientColorDirection)direction
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseConfig];
        self.rectCorner = rectCorner;
        self.cornerSize = cornerSize;
        self.gradientColors = gradientColors;
        self.direction = direction;
        [self refreshUI];
    }
    return self;
}

- (void)baseConfig
{
    self.insets = UIEdgeInsetsMake(kUILableMARGIN, kUILableMARGIN, kUILableMARGIN, kUILableMARGIN);
}

#pragma mark - public
    
- (void)setContentView:(UIView *)contentView
{
    [self addSubview:contentView];
    _contentView = contentView;
}

- (void)setSingleColor:(UIColor *)color
{
    self.gradientColors = [NSArray arrayWithObjects:
                           (id)color.CGColor,
                           (id)color.CGColor,
                           nil];
}
    
- (void)setContentSize:(CGSize)size
{
    contentSize = size;
}

- (void)setLayerWithBorderWidth:(CGFloat)border andColor:(CGColorRef) color
{
    self.layer.borderWidth = border;
    self.layer.borderColor = color;
}

- (void)refreshUI
{
    contentSize = self.contentView.frame.size;
    self.frame = CGRectMake(self.getOriginX, self.getOriginY, contentSize.width + self.insets.left + self.insets.right, contentSize.height  + self.insets.top + self.insets.bottom);
    if (self.contentView) {
        self.contentView.frame = CGRectMake(self.insets.left, self.insets.top, self.contentView.getSizeWidth, self.contentView.getSizeHeight);
    }
    [self refreshRectCorner];
    [self refreshGradientColors];
}

#pragma mark - private
    
- (void)refreshGradientColors
{
    [self configGradient];
    [self.layer setNeedsLayout];
    [self.layer layoutIfNeeded];
}
    
- (void)refreshRectCorner
{
    [self configMaskLayer];
    [self.layer setNeedsLayout];
    [self.layer layoutIfNeeded];
}
    
- (void)configGradient
{
    if (!self.gradient) {
        self.gradient = [CAGradientLayer layer];
        [self.layer addSublayer:self.gradient];
    }
    self.gradient.frame = self.bounds;
    self.gradient.colors = self.gradientColors;
    switch (self.direction) {
        case UIGradientColorDirectionLeftToRight:
        {
            self.gradient.startPoint = CGPointMake(0, 0.5);
            self.gradient.endPoint = CGPointMake(1, 0.5);
            break;
        }
        case UIGradientColorDirectionRightToLeft:
        {
            self.gradient.startPoint = CGPointMake(1, 0.5);
            self.gradient.endPoint = CGPointMake(0, 0.5);
            break;
        }
        case UIGradientColorDirectionTopToBottom:
        {
            self.gradient.startPoint = CGPointMake(0.5, 0);
            self.gradient.endPoint = CGPointMake(0.5, 1);
            break;
        }
        case UIGradientColorDirectionBottomToTop:
        {
            self.gradient.endPoint = CGPointMake(0.5, 0);
            self.gradient.startPoint = CGPointMake(0.5, 1);
            break;
        }
        default:
        break;
    }
}

- (void)configMaskLayer
{
    if (!self.maskLayer) {
        self.maskLayer = [CAShapeLayer layer];
    }
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:self.rectCorner cornerRadii:self.cornerSize];
    self.maskLayer.frame = bounds;
    self.maskLayer.path = maskPath.CGPath;
    self.layer.mask = self.maskLayer;
}

@end

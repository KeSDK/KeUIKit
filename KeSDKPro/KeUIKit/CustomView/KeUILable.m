//
//  KeUILable.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeUILable.h"
#import "KeUIKitMacros.h"
#import "UIView+ReadLayer.h"
#import "NSString+StringSize.h"

#define kUILableMARGIN 12
#define kCornerSize 12

@interface KeUILable ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) CAGradientLayer *gradient;

@end;

@implementation KeUILable
{
    CGFloat maxWidth;
    UIEdgeInsets insets;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        maxWidth = [UIScreen mainScreen].bounds.size.width - 50;
        [self setLayerWithBorderWidth:1.0f andColor:HEXCOLOR(0xFFB100).CGColor];
        insets = UIEdgeInsetsMake(kUILableMARGIN, kUILableMARGIN, kUILableMARGIN, kUILableMARGIN);

        // set defaut config
        self.cornerSize = CGSizeMake(kCornerSize, kCornerSize);

        self.rectCorner = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
        
        self.direction = UIGradientColorDirectionRightToLeft;
        self.gradientColors = [NSArray arrayWithObjects:
                               (id)HEXACOLOR(0xFFD000, 1.0).CGColor,
                               (id)HEXACOLOR(0xFFA000, 1.0).CGColor,
                               nil];
        [self addSubview:self.showLable];
    }
    return self;
}

- (void)setMaxUIWidth:(CGFloat)width
{
    maxWidth = width;
}

- (void)setText:(NSString *)text
{
    CGSize size = [NSString getSizeWithContent:text font:self.showLable.font width:maxWidth];
    
    self.frame = CGRectMake(self.getOriginX, self.getOriginY, size.width + kUILableMARGIN * 2, size.height  + kUILableMARGIN * 2);
    self.showLable.frame = CGRectMake(self.showLable.getOriginX, self.showLable.getOriginY, size.width, size.height);
    

    [self refreshUI];
    [self.showLable setText:text];
}
    
- (void)setLayerWithBorderWidth:(CGFloat)border andColor:(CGColorRef) color
{
    self.layer.borderWidth = border;
    self.layer.borderColor = color;
}
    
- (void)refreshUI
{
    [self refreshRectCorner];
    [self refreshGradientColors];
}
 
#pragma mark - private

- (void)refreshGradientColors
{
    [self setGradientColors:self.gradientColors];
    [self.layer setNeedsLayout];
    [self.layer layoutIfNeeded];
}

- (void)refreshRectCorner
{
    [self setRectCorner:self.rectCorner];
    [self.layer setNeedsLayout];
    [self.layer layoutIfNeeded];
}

- (void)setRectCorner:(UIRectCorner)corner withSize:(CGSize)size
{
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = nil;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corner cornerRadii:size];
    self.maskLayer.frame = bounds;
    self.maskLayer.path = maskPath.CGPath;
    [self.layer addSublayer:self.maskLayer];
    self.layer.mask = self.maskLayer;
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
    
#pragma mark - set

    
- (void)setCornerSize:(CGSize)cornerSize
{
    _cornerSize = cornerSize;
    [self refreshUI];
}

- (void)setDirection:(UIGradientColorDirection)direction
{
    _direction = direction;
    [self refreshUI];
}
    
- (void)setGradientColors:(NSArray *)gradientColors
{
    _gradientColors = gradientColors;
    [self configGradient];
}

- (void)setRectCorner:(UIRectCorner)rectCorner
{
    _rectCorner = rectCorner;
    [self configMaskLayer];
}

#pragma mark - get

- (UILabel *)showLable
{
    if (!_showLable) {
        _showLable = [[UILabel alloc] initWithFrame:CGRectMake(insets.left, insets.top, 0, 0)];
        _showLable.numberOfLines = 0;
        _showLable.lineBreakMode = NSLineBreakByCharWrapping;

        _showLable.text = @"dssss";
    }
    return _showLable;
}

@end

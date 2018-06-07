//
//  KeBackgroundView.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/7.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeUIKitMacros.h"
#import "UIView+ReadLayer.h"
#import "NSString+StringSize.h"

#define kCornerSize 12
#define kUILableMARGIN 12
typedef NS_OPTIONS(NSUInteger, UIGradientColorDirection)
{
    UIGradientColorDirectionLeftToRight,
    UIGradientColorDirectionRightToLeft,
    UIGradientColorDirectionTopToBottom,
    UIGradientColorDirectionBottomToTop
};

@interface KeBackgroundView : UIView

@property (nonatomic, assign) UIRectCorner rectCorner;
@property (nonatomic, assign) CGSize cornerSize;
@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, assign) UIGradientColorDirection direction;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, strong) UIView *contentView;

- (instancetype)initKeUILableWithFrame:(CGRect)frame
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                             direction:(UIGradientColorDirection)direction;
- (void)setContentView:(UIView *)contentView;
- (void)setSingleColor:(UIColor *)color;
- (void)setContentSize:(CGSize)size;
- (void)setLayerWithBorderWidth:(CGFloat)border andColor:(CGColorRef) color;
- (void)refreshUI;
    
@end

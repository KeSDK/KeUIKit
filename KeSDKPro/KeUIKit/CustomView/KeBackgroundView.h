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
@property (nonatomic, assign) UIEdgeInsets insets; // 用于设置内间距

/**
 * 初始化方法
 * @param frame 设置frame
 * @param rectCorner 设置圆角方向
 * @param cornerSize 设置圆角大小
 * @param gradientColors 设置渐变颜色
 * @param direction 设置渐变颜色方向
 */
- (instancetype)initKeUILableWithFrame:(CGRect)frame
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                             direction:(UIGradientColorDirection)direction;
/**
 * 设置内容view
 * @param contentView 内部将会add这个view
 */
- (void)setContentView:(UIView *)contentView;
    
/**
 * 设置背景为单色
 * @param color 背景颜色
 */
- (void)setSingleColor:(UIColor *)color;
 
/**
 * 设置边框宽度及边框颜色
 * @param color 背景颜色
 */
- (void)setLayerWithBorderWidth:(CGFloat)border andColor:(CGColorRef) color;
    
/**
 * 自定义边框形状
 * @param path 设置路径，用来设置边框
 */
- (void)configLayerShapeByBezierPath:(UIBezierPath *)path;
    
/**
 * 刷新UI，可以刷新布局及ui的大小，样式，颜色等
 */
- (void)refreshUI;
    
@end

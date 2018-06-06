//
//  KeUILable.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCornerSize 12
typedef NS_OPTIONS(NSUInteger, UIGradientColorDirection)
{
    UIGradientColorDirectionLeftToRight,
    UIGradientColorDirectionRightToLeft,
    UIGradientColorDirectionTopToBottom,
    UIGradientColorDirectionBottomToTop
};

@interface KeUILable : UIView
    
@property (nonatomic, assign) UIRectCorner rectCorner;
@property (nonatomic, assign) CGSize cornerSize;
@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, assign) UIGradientColorDirection direction;

- (instancetype)initKeUILableWithFrame:(CGRect)frame
                                  text:(NSString *)text
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                            direction:(UIGradientColorDirection)direction;
- (void)setMaxUIWidth:(CGFloat)width;
- (void)setText:(NSString *)text;
- (NSString *)getText;
- (void)setLayerWithBorderWidth:(CGFloat)border andColor:(CGColorRef) color;

@end

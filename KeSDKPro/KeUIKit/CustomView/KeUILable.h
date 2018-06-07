//
//  KeUILable.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeBackgroundView.h"


@interface KeUILable : KeBackgroundView

- (instancetype)initKeUILableWithFrame:(CGRect)frame
                                  text:(NSString *)text
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                            direction:(UIGradientColorDirection)direction;
- (void)setMaxUIWidth:(CGFloat)width;
- (void)setText:(NSString *)text;
- (NSString *)getText;

@end

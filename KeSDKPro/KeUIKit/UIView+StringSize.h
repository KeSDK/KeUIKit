//
//  UIView+StringSize.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (StringSize)

+ (CGSize)getSizeWithAttributes:(NSString *)content font:(UIFont *)font;
+ (CGSize)getSizeWithAttributes:(NSString *)content width:(CGFloat)width font:(UIFont *)font;
    
@end

//
//  UIView+StringSize.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Foundation/Foundation.h"

@interface NSString (StringSize)

+ (CGSize)getSizeWithContent:(NSString *)content font:(UIFont *)font;
+ (CGSize)getSizeWithContent:(NSString *)content font:(UIFont *)font width:(CGFloat)width;
    
@end

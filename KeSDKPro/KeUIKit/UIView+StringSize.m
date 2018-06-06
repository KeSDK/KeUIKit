//
//  UIView+StringSize.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "UIView+StringSize.h"

@implementation UIView (StringSize)
    
+ (CGSize)getSizeWithAttributes:(NSString *)content font:(UIFont *)font;
{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    return [content sizeWithAttributes:attrDict];
}
    
+ (CGSize)getSizeWithAttributes:(NSString *)content width:(CGFloat)width font:(UIFont *)font
{
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    return [content boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

@end

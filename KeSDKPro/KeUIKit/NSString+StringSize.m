//
//  UIView+StringSize.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)
    
+ (CGSize)getSizeWithContent:(NSString *)content font:(UIFont *)font;
{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    return [content sizeWithAttributes:attrDict];
}
    
+ (CGSize)getSizeWithContent:(NSString *)content font:(UIFont *)font width:(CGFloat)width
{
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    return [content boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

@end

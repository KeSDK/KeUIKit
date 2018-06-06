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
    
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    CGSize size = [content sizeWithAttributes:attrDict];
    CGFloat height = size.height;
    CGFloat mwidth = size.width;
    if (size.width >= width) {
        height = ceil(size.width/width) * size.height;
        mwidth = width;
    }
    return CGSizeMake(mwidth, height);
    
//    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
//    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
//    attrDict[NSFontAttributeName] = font;
//    return [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDict context:nil].size;
}

@end

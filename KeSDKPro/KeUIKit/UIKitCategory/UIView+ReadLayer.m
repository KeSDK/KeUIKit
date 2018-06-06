//
//  UIView+ReadLayer.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "UIView+ReadLayer.h"

@implementation UIView (ReadLayer)

- (CGFloat)getOriginX
{
    return self.frame.origin.x;
}
    
- (CGFloat)getOriginY
{
    return self.frame.origin.y;
}
    
- (CGFloat)getSizeWidth
{
    return self.frame.size.width;
}
    
- (CGFloat)getSizeHeight
{
    return self.frame.size.height;
}
    
@end

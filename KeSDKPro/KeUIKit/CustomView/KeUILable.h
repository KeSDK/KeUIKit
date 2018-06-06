//
//  KeUILable.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeUILable : UILabel
    
@property (nonatomic, assign) UIRectCorner rectCorner;
@property (nonatomic, strong) NSArray *gradientColors;

- (void)setMaxUIWidth:(CGFloat)width;

@end

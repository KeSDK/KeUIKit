//
//  KeDrapWindow.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/13.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeWindow.h"

typedef void(^clickedWindow)(void);

@interface KeDrapWindow : KeWindow

- (instancetype)initDrapWindowWithFrame:(CGRect)frame ContentView:(UIView *)view;
- (void)setclickedWindow:(clickedWindow)block;

@end

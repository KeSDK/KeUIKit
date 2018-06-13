//
//  KeDragWindow.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/12.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeWindow : UIWindow

- (instancetype)initWindowWithFrame:(CGRect)frame ContentView:(UIView *)view;
- (instancetype)initWindowWithFrame:(CGRect)frame rootViewController:(UIViewController *)rootViewController;

- (void)setContentView:(UIView *)view;
- (void)destoryWindow;
- (void)showWindow;
- (void)hiddenWindow;

@end

//
//  KeWindow.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/12.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeWindow.h"

@interface KeWindow ()

@property (nonatomic, weak) UIView *contentView;

@end

@implementation KeWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configBasicAttributes];
    }
    return self;
}

- (instancetype)initWindowWithFrame:(CGRect)frame ContentView:(UIView *)view
{
    self = [self initWithFrame:frame];
    if (self) {
        view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.contentView = view;
        self.rootViewController  = [UIViewController new];
        [self addSubview:self.contentView];
    }
    return self;
}

- (instancetype)initWindowWithFrame:(CGRect)frame rootViewController:(UIViewController *)rootViewController
{
    self = [self initWithFrame:frame];
    if (self) {
        self.rootViewController = rootViewController;
    }
    return self;
}

- (void)configBasicAttributes
{
    self.backgroundColor = [UIColor clearColor];
    self.windowLevel = UIWindowLevelAlert + 2;
    [self makeKeyAndVisible];

}

- (void)setContentView:(UIView *)view
{
    [self.contentView removeFromSuperview];
    _contentView = view;
    _contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:self.contentView];
}

- (void)destoryWindow
{
    self.contentView = nil;
    self.rootViewController = nil;
    [self resignKeyWindow];
    [self removeFromSuperview];
}

- (void)showWindow
{
    self.hidden = NO;
}

- (void)hiddenWindow
{
    self.hidden = YES;
}

@end

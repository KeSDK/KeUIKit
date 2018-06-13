//
//  KeDrapWindow.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/13.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeDrapWindow.h"
#import "KeUIKitMacros.h"

#define kAnimateDuration 0.3

@interface KeDrapWindow ()

@property (nonatomic, strong) clickedWindow clickWindowBlock;

@end

@implementation KeDrapWindow

- (instancetype)initDrapWindowWithFrame:(CGRect)frame ContentView:(UIView *)view
{
    self = [super initWindowWithFrame:frame ContentView:view];
    if (self) {
        [self configShadow];
        [self configGestureRecognizer];
    }
    return self;
}

- (instancetype)initWindowWithFrame:(CGRect)frame rootViewController:(UIViewController *)rootViewController
{
    self = [super initWindowWithFrame:frame rootViewController:rootViewController];
    if (self) {
        [self configShadow];
        [self configGestureRecognizer];
    }
    return self;
}

- (void)configShadow
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,0);
    self.layer.shadowOpacity = 0.3f;
    self.layer.shadowRadius = 3;
}

- (void)setclickedWindow:(clickedWindow)block
{
    self.clickWindowBlock = block;
}

- (void)configGestureRecognizer
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
    //
    pan.delaysTouchesBegan = NO;
    [self addGestureRecognizer:pan];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [self addGestureRecognizer:tap];
}

- (void)click:(UITapGestureRecognizer*)tap
{
    if (self.clickWindowBlock) {
        self.clickWindowBlock();
    }
}

- (void)locationChange:(UIPanGestureRecognizer*)pan
{
    CGPoint panPoint =  [pan locationInView:[[UIApplication sharedApplication] keyWindow]];
    if(pan.state == UIGestureRecognizerStateChanged) {
        self.center = CGPointMake(panPoint.x, panPoint.y);
    } else if(pan.state == UIGestureRecognizerStateEnded) {
        [self changeLocationDrapPoint:panPoint];
    } else {}
}

- (void)changeLocationDrapPoint:(CGPoint)point
{
    CGFloat topSpace = IS_IPHONE_X ? 44 : 0;
    CGFloat bottomSpace = IS_IPHONE_X? 34 : 0;
    if (self.frame.origin.y < topSpace) {
        point.y = topSpace + self.frame.size.height/2;
    }
    if ((point.y + self.frame.size.height) > (SCREEN_HEIGHT - bottomSpace)) {
        point.y = SCREEN_HEIGHT - bottomSpace - self.frame.size.height/2;
    }
    if (point.x <= SCREEN_WIDTH/2) {
        point.x = self.frame.size.width/2;
        [UIView animateWithDuration:kAnimateDuration animations:^{
            self.center = point;
        }];
    } else {
        point.x = SCREEN_WIDTH - self.frame.size.width/2;
        [UIView animateWithDuration:kAnimateDuration animations:^{
            self.center = point;
        }];
    }
}

@end

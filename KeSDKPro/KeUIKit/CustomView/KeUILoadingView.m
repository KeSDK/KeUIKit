//
//  KeUILoadingView.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/7.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeUILoadingView.h"
#import "KeUIKitMacros.h"
#import "UIView+ReadLayer.h"

@implementation KeUILoadingView
{
    NSInteger cColor;
}
    
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger color = 0x009FFF;
        self.loadingContentColor = color;
        self.lineWidth = 4;
    }
    return self;
}

- (instancetype)initKeUILoadingViewWithFrame:(CGRect)frame loadingColor:(NSInteger)color andLineWidth:(CGFloat)lineWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        self.loadingContentColor = color;
        self.lineWidth = lineWidth;
    }
    return self;
}
    
- (void)drawRect:(CGRect)rect
{
    //创建圆环
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.getSizeWidth/2, self.getSizeHeight/2) radius:45 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    //圆环遮罩
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = self.lineWidth;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineDashPhase = 0.8;
    shapeLayer.path = bezierPath.CGPath;
    [self.layer setMask:shapeLayer];

    cColor = self.loadingContentColor & 0xFF0000;
    //颜色渐变
    NSArray *colors = [NSArray arrayWithObjects:
                              (id)HEXACOLOR(self.loadingContentColor, 1).CGColor,
                              (id)HEXACOLOR(self.loadingContentColor - cColor/3, 1).CGColor,
                              nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.shadowPath = bezierPath.CGPath;
    NSLog(@"%f %f",self.getSizeWidth, self.getSizeHeight);
    gradientLayer.frame = CGRectMake(0, 0, self.getSizeWidth, self.getSizeHeight/2);
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
    
    NSArray *colors1 = [NSArray arrayWithObjects:
                               (id)HEXACOLOR(self.loadingContentColor - cColor/3, 1).CGColor,
                               (id)HEXACOLOR(0xFFFFFF, 1).CGColor,
                               nil];
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.shadowPath = bezierPath.CGPath;
    gradientLayer1.frame = CGRectMake(0, self.getSizeHeight/2, self.getSizeWidth, self.getSizeHeight/2);
    gradientLayer1.startPoint = CGPointMake(1, 0.5);
    gradientLayer1.endPoint = CGPointMake(0, 0.5);
    [gradientLayer1 setColors:[NSArray arrayWithArray:colors1]];
    [self.layer addSublayer:gradientLayer];
    [self.layer addSublayer:gradientLayer1];
}

    
#pragma mark - animatoion
    
- (void)startAnimation
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2.0*M_PI];
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.duration = 0.5;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnnimation"];
}

- (void)stopAnimation
{
    [self.layer removeAllAnimations];
}


@end

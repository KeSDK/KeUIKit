//
//  ViewController.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "ViewController.h"
#import "KeUILable.h"
#import "UIView+Corner.h"
#import "UIView+GradientColor.h"
#import "KeUIKitMacros.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 80, 40)];
    [self.view addSubview:bt];
    [bt setTitle:@"click" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    
}

- (IBAction)click:(id)sender
{
    KeUILable *keLable = [[KeUILable alloc] initWithFrame:CGRectMake(100, 150, 100, 40)];
    [self.view addSubview:keLable];
//    [keLable setMaxUIWidth:100];

    [keLable setText:@"课kkkk"];
    
    UILabel *jfv = [[UILabel alloc] initWithFrame:CGRectMake(150, 320, 120, 40)];
    
    [self.view addSubview:jfv];
    
    jfv.textAlignment =  NSTextAlignmentCenter;
    [jfv setCornerWithSize:CGSizeMake(20, 20) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = jfv.bounds;
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.colors = [NSArray arrayWithObjects:
                       (id)HEXACOLOR(0xFFD000, 1.0).CGColor,
                       (id)HEXACOLOR(0xFFA000, 1.0).CGColor,
                       nil];
    [jfv.layer addSublayer:gradient];
    [jfv setText:@"联系不到商家"];
}

@end

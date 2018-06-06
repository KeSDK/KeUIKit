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
    
@property (nonatomic, strong) KeUILable *keLable4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(20, 600, 80, 40)];
    [self.view addSubview:bt];
    [bt setTitle:@"click" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];


    UIButton *bt2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 600, 80, 40)];
    [self.view addSubview:bt2];
    [bt2 setTitle:@"begin" forState:UIControlStateNormal];
    [bt2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
    self.keLable4 = [[KeUILable alloc] initKeUILableWithFrame:CGRectMake(20, 250, 100, 40)
                                                         text:@"rehwbawkdb"
                                                   RectCorner:UIRectCornerTopRight | UIRectCornerBottomRight
                                                   cornerSize:CGSizeMake(kCornerSize, kCornerSize)
                                               gradientColors:[NSArray arrayWithObjects:
                                                               (id)HEXACOLOR(0xFF8C43, 1.0).CGColor,
                                                               (id)HEXACOLOR(0xFF6633, 1.0).CGColor,
                                                               nil]
                                                    direction:UIGradientColorDirectionRightToLeft];
    [self.view addSubview:self.keLable4];
}

- (IBAction)click:(id)sender
{
    KeUILable *keLable = [[KeUILable alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
    [self.view addSubview:keLable];
    [keLable setText:@"课kadalwdhlahwdlhadwhallnanashdlahdlhdahahdlhdanwknqnwwqqwewhdladhlahwdlldaldjaljdahwdlahwdhalwdhalwhdawkdhawhdlahwdlhawhdlkkk"];
//
    KeUILable *keLable2 = [[KeUILable alloc] initWithFrame:CGRectMake(20, 150, 100, 40)];
    [self.view addSubview:keLable2];
    [keLable2 setGradientColors:[NSArray arrayWithObjects:
                                 (id)HEXACOLOR(0x1EE7DD, 1.0).CGColor,
                                 (id)HEXACOLOR(0x06C1AE, 1.0).CGColor,
                                 nil]];
    [keLable2 setLayerWithBorderWidth:1.0f andColor:HEXCOLOR(0x06C1AE).CGColor];
    [keLable2 setText:@"柯LDANLWDNhdlkkk"];
    
    KeUILable *keLable3 = [[KeUILable alloc] initKeUILableWithFrame:CGRectMake(20, 200, 100, 40)
                                                               text:@"radnwdkbwakdbawkdbakwdbkawdbawkdb"
                                                         RectCorner:UIRectCornerTopRight | UIRectCornerBottomRight
                                                         cornerSize:CGSizeMake(kCornerSize, kCornerSize)
                                                     gradientColors:[NSArray arrayWithObjects:
                                                                     (id)HEXACOLOR(0x009FFF, 1.0).CGColor,
                                                                     (id)HEXACOLOR(0x0055FF, 1.0).CGColor,
                                                                     nil]
                                                          direction:UIGradientColorDirectionRightToLeft];
    [self.view addSubview:keLable3];

}
    
- (IBAction)add:(id)sender
{
    [self.keLable4 setText:[[self.keLable4 getText] stringByAppendingString:@"哈哈ddada"]];
}

@end

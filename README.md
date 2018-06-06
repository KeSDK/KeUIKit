# KeUIKit
About some custom UIs tool. 


## KeUILable
可自动根据字体改变大小的UILable

### KeUILable简介
- 支持自定义lable圆角
- 支持背景渐变
- 支持根据content，自动化调整lable大小。

### 使用 例：
```
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
```

### 演示
![](https://github.com/KeSDK/KeUIKit/blob/master/IMG_3724.GIF)

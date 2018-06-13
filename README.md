# KeUIKit
About some custom UIs tool. 


## KeBackgroundView
可用于当任何控件的背景。
- 支持背景渐变色，及渐变方向。
- 支持自定义背景圆角方向及大小。
- 支持自定义背景边框形状
- 支持设置以内容view为相对对象的内距。
- 支持背景根据内容（view）及内距，改变自己的大小。

### 基本使用
``` oc
// 设置内容view
- (void)setContentView:(UIView *)contentView;
// 当改变内容view的size时候，需要刷新
- (void)refreshUI;
// 设置内距
self.insets = UIEdgeInsetsMake(kUILableMARGIN, kUILableMARGIN, kUILableMARGIN, kUILableMARGIN);
```

## KeUILable
可自动根据字体改变大小的UILable，继承自 KeBackgroundView

### KeUILable简介
- 支持自定义lable圆角
- 支持背景渐变
- 支持根据content，自动化调整lable大小。

### 使用 例：
``` Objective-C
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


## KeUILoadingView
一个带有动画效果的加载提示。

### 简介
- 提供设置加载圈颜色，可自动进行渐变。
- 提供可设置加载圈的边框大小。
- 提供开始动画及结束动画。

### 用法
``` oc
    LV = [[KeUILoadingView alloc] initWithFrame:CGRectMake(20, 300, 100, 100)];
    [self.view addSubview:LV];
    [LV startAnimation];
    
    [LV stopAnimation]; // 停止动画
```

### 演示
![](https://github.com/KeSDK/KeUIKit/blob/master/loadingpic.png)

## KeWindow
用于于针对任何view，controller，制定个上最层窗口。

## KeDrapWindow
用于针对任何view，controller，制定个上最层悬浮窗口，支持拖拽。
## 使用 eg:
``` oc
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.whiteColor;
    self.drapWindow = [[KeDrapWindow alloc] initDrapWindowWithFrame:CGRectMake(20, 60, 80, 150) ContentView:view];

    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = UIColor.blueColor;
    UIButton *btview2 = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0, 80, 80)];
    [btview2 setTitle:@"click" forState:UIControlStateNormal];
    [btview2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btview2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:btview2];
    self.drapWindow2 = [[KeDrapWindow alloc] initDrapWindowWithFrame:CGRectMake(200, 60, 80, 150) ContentView:view2];
    [self.drapWindow2 setclickedWindow:^{
        NSLog(@"drapWindow2");
    }];
    
    MmViewController *vc = [[MmViewController alloc] init];
    self.drapWindow3 = [[KeDrapWindow alloc] initWindowWithFrame:CGRectMake(200, 300, 80, 150)  rootViewController:vc];
    
```
### 演示结果
![](https://github.com/KeSDK/KeUIKit/blob/dev/drap.png)



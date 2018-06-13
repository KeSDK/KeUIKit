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
#import "KeUILoadingView.h"
#import "KeUIKitMacros.h"
#import "MyTableViewCell.h"
#import "KeDrapWindow.h"
#import "MmViewController.h"

#define LoadingCount 10

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
    
@property (nonatomic, strong) KeUILable *keLable4;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) KeDrapWindow *drapWindow;
@property (nonatomic, strong) KeDrapWindow *drapWindow2;
@property (nonatomic, strong) KeDrapWindow *drapWindow3;
    
@end

@implementation ViewController
{
    KeUILoadingView *LV;
    UITableView *tb;
    BOOL isloading;
    NSInteger num;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
   // vc.view.frame = CGRectMake(200, 300, 80, 150) ;
    self.drapWindow3 = [[KeDrapWindow alloc] initWindowWithFrame:CGRectMake(200, 300, 80, 150)  rootViewController:vc];
    
    
    self.list = [[NSMutableArray alloc] init];
    
    for (NSInteger i=LoadingCount; i > 0; --i)
    {
        NSString *s = [@"kesion" stringByAppendingFormat:@"%lu",num+i];
        [self.list addObject:s];
    }
    num+=LoadingCount;
    
    
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0, [UIScreen mainScreen].bounds.size.width, 80)];
 //   [self.view addSubview:bt];
    bt.backgroundColor = UIColor.grayColor;
    [bt setTitle:@"click" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
   // LV = [[KeUILoadingView alloc] initWithFrame:CGRectMake(20, 10, 20, 20)];
    
    tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)];
  //  tb.tableHeaderView = bt;
   // tb.tableFooterView = bt;
    
    [self.view addSubview:tb];
    tb.delegate = self;
    tb.dataSource = self;

    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//
//    UIButton *bt2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 600, 80, 40)];
//    [self.view addSubview:bt2];
//    [bt2 setTitle:@"begin" forState:UIControlStateNormal];
//    [bt2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [bt2 addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
//
//    self.keLable4 = [[KeUILable alloc] initKeUILableWithFrame:CGRectMake(20, 250, 100, 40)
//                                                         text:@"rehwbawkdb"
//                                                   RectCorner:UIRectCornerTopRight | UIRectCornerBottomRight
//                                                   cornerSize:CGSizeMake(kCornerSize, kCornerSize)
//                                               gradientColors:[NSArray arrayWithObjects:
//                                                               (id)HEXACOLOR(0xFF8C43, 1.0).CGColor,
//                                                               (id)HEXACOLOR(0xFF6633, 1.0).CGColor,
//                                                               nil]
//                                                    direction:UIGradientColorDirectionRightToLeft];
//    [self.view addSubview:self.keLable4];
    

}
    
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.isDragging && scrollView.contentOffset.y < -40 && !isloading) {
        isloading = YES;
        NSLog(@"loading");
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0, [UIScreen mainScreen].bounds.size.width, 80)];
        bt.backgroundColor = UIColor.grayColor;
        [bt setTitle:@"click" forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            self->tb.tableHeaderView = bt;
        }];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^{
          
                
                self->tb.tableHeaderView = nil;
                NSMutableArray *clist = [[NSMutableArray alloc] init];
                for (NSInteger i=LoadingCount; i > 0; --i)
                {
                    NSString *s = [@"kesion" stringByAppendingFormat:@"%lu",self->num+i];
                    [clist addObject:s];
                }
                self->num+=LoadingCount;
                NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, clist.count)];
                [self.list insertObjects:clist atIndexes:indexes];

                [self->tb reloadData];
                self->tb.contentOffset = CGPointMake(0, (clist.count-1)*50);
                
                
                self->isloading = NO;
//                [UIView animateWithDuration:0.5 animations:^{
//
//                }];
            });
        });
    } else {

    }
}
    
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}
    

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //两个参数的方法  表示 从cell空闲队列中去名字叫@“cell”的单元格，如果没有取到，tableView会根据我们之前注册样式，帮我们创建一个cell使用，如果取到，就使用取出来的
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.redColor;
    [self.drapWindow setContentView:view];
}

- (IBAction)click:(id)sender
{
//    tb.tableHeaderView = nil;
//    KeUILable *keLable = [[KeUILable alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
//    [self.view addSubview:keLable];
//    [keLable setText:@"课kadalwdhlahwdlhadwhallnanashdlahdlhdahahdlhdanwknqnwwqqwewhdladhlahwdlldaldjaljdahwdlahwdhalwdhalwhdawkdhawhdlahwdlhawhdlkkk"];
////
//    KeUILable *keLable2 = [[KeUILable alloc] initWithFrame:CGRectMake(20, 150, 100, 40)];
//    [self.view addSubview:keLable2];
//    [keLable2 setGradientColors:[NSArray arrayWithObjects:
//                                 (id)HEXACOLOR(0x1EE7DD, 1.0).CGColor,
//                                 (id)HEXACOLOR(0x06C1AE, 1.0).CGColor,
//                                 nil]];
//    [keLable2 setLayerWithBorderWidth:1.0f andColor:HEXCOLOR(0x06C1AE).CGColor];
//    [keLable2 setText:@"柯LDANLWDNhdlkkk"];
//
//    KeUILable *keLable3 = [[KeUILable alloc] initKeUILableWithFrame:CGRectMake(20, 200, 100, 40)
//                                                               text:@"radnwdkbwakdbawkdbakwdbkawdbawkdb"
//                                                         RectCorner:UIRectCornerTopRight | UIRectCornerBottomRight
//                                                         cornerSize:CGSizeMake(kCornerSize, kCornerSize)
//                                                     gradientColors:[NSArray arrayWithObjects:
//                                                                     (id)HEXACOLOR(0x009FFF, 1.0).CGColor,
//                                                                     (id)HEXACOLOR(0x0055FF, 1.0).CGColor,
//                                                                     nil]
//                                                          direction:UIGradientColorDirectionRightToLeft];
//    [self.view addSubview:keLable3];
//
//
    if (!LV) {
        LV = [[KeUILoadingView alloc] initWithFrame:CGRectMake(20, 300, 100, 100)];
        [self.view addSubview:LV];
    }
    [LV startAnimation];
}
    
- (IBAction)add:(id)sender
{
    [LV stopAnimation];
    [self.keLable4 setText:[[self.keLable4 getText] stringByAppendingString:@"哈哈ddada"]];
}

@end

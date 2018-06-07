//
//  KeUILoadingView.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/7.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeUILoadingView : UIView

@property (nonatomic, assign) NSInteger loadingContentColor;
@property (nonatomic, assign) CGFloat lineWidth;
    
- (instancetype)initKeUILoadingViewWithFrame:(CGRect)frame loadingColor:(NSInteger)color andLineWidth:(CGFloat)lineWidth;
- (void)startAnimation;
- (void)stopAnimation;
    
@end

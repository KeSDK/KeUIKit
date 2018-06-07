//
//  KeUILable.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/6.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeUILable.h"
#import "KeUIKitMacros.h"
#import "UIView+ReadLayer.h"
#import "NSString+StringSize.h"

@interface KeUILable ()

@property (nonatomic, strong) UILabel *showLable;

@end;

@implementation KeUILable
{
    CGFloat maxWidth;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        maxWidth = [UIScreen mainScreen].bounds.size.width - 50;
        [self setContentView:self.showLable];
    }
    return self;
}

- (instancetype)initKeUILableWithFrame:(CGRect)frame
                                  text:(NSString *)text
                            RectCorner:(UIRectCorner)rectCorner
                            cornerSize:(CGSize)cornerSize
                        gradientColors:(NSArray *)gradientColors
                             direction:(UIGradientColorDirection)direction
{
    self = [super initKeUILableWithFrame:frame RectCorner:rectCorner cornerSize:cornerSize gradientColors:gradientColors direction:direction];
    if (self) {
        maxWidth = [UIScreen mainScreen].bounds.size.width - 50;
        [self setContentView:self.showLable];
        [self setText:text];
    }
    return self;
}

#pragma mark - public
    
- (void)setMaxUIWidth:(CGFloat)width
{
    maxWidth = width;
}

- (void)setText:(NSString *)text
{
    CGSize size = [NSString getSizeWithContent:text font:self.showLable.font width:maxWidth];
    self.showLable.frame = CGRectMake(self.showLable.getOriginX, self.showLable.getOriginY, size.width, size.height);
    [self refreshUI];
    [self.showLable setText:text];
}

- (NSString *)getText
{
    return self.showLable.text;
}

#pragma mark - get

- (UILabel *)showLable
{
    if (!_showLable) {
        _showLable = [[UILabel alloc] initWithFrame:CGRectMake(self.insets.left, self.insets.top, 0, 0)];
        _showLable.numberOfLines = 0;
        _showLable.lineBreakMode = NSLineBreakByCharWrapping;
        _showLable.text = @"lable";
    }
    return _showLable;
}

@end

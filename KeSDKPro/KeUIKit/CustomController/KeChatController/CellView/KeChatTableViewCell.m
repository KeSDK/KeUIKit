//
//  KeChatTableViewCell.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/9.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeChatTableViewCell.h"

@implementation KeChatTableViewCell

- (instancetype)initWithMessageType:(KeMessageType)messageType
{
    NSString *reuseId = [[self class] getreuseIdWithMessageType:&messageType];
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    if (self) {
        
    }
    return self;
}

+ (NSString *)getreuseIdWithMessageType:(KeMessageType *)type
{
    return [NSString stringWithFormat:@"%@%ld", NSStringFromClass([self class]), (long)type];
}

+ (CGFloat)getHeightByContent:(KeChatContent *)content
{
    return KeChatDefaultCellHeight;
}

@end

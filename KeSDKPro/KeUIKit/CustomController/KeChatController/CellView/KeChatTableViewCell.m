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
    NSString *reuseId = [[self class] getreuseIdWithMessageType:messageType];
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    if (self) {
        
    }
    return self;
}

- (void)postEventByKey:(NSString *)key withEventInfo:(KeChatEvent *)eventInfo
{
    if (self.eventDelegate && [self.eventDelegate respondsToSelector:@selector(getEventBlockWithKey:)]) {
        keChatEventBlock block = [self.eventDelegate getEventBlockWithKey:key];
        dispatch_async(dispatch_get_main_queue(), ^{
            block([eventInfo copy]);
        });
    }
}

#pragma mark class method

+ (NSString *)getreuseIdWithMessageType:(KeMessageType)type
{
    return [NSString stringWithFormat:@"%@%ld", NSStringFromClass([self class]), (long)type];
}

+ (CGFloat)getHeightByContent:(KeChatContent *)content
{
    return KeChatDefaultCellHeight;
}

@end

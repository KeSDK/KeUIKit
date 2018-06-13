//
//  KeChatEvent.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/10.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "KeChatEvent.h"

@implementation KeChatEvent
    
+ (instancetype)eventWithContent:(KeChatContent *)content userInfo:(NSDictionary *)userInfo
{
    KeChatEvent *event = [[KeChatEvent alloc] init];
    event.content = content;
    event.userInfo = userInfo;
    return event;
}

@end

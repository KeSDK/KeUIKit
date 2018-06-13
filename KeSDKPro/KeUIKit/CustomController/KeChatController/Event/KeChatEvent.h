//
//  KeChatEvent.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/10.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KeChatContent.h"

@class KeChatEvent;

typedef void(^keChatEventBlock)(KeChatEvent *event);

@protocol KeChatEventDelegate <NSObject>

- (void)registerEventWithKey:(NSString *)key forBlock:(keChatEventBlock)block;
- (void)cancelBlockEventByKey:(NSString *)key;
- (keChatEventBlock)getEventBlockWithKey:(NSString *)key;

@end

@interface KeChatEvent : NSObject

@property (nonatomic, strong) KeChatContent *content;
@property (nonatomic, strong) NSDictionary *userInfo;
    
+ (instancetype)eventWithContent:(KeChatContent *)content userInfo:(NSDictionary *)userInfo;

@end

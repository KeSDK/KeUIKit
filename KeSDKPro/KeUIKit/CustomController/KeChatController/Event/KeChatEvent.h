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

@interface KeChatEvent : NSObject

@property (nonatomic, strong) KeChatContent *content;
@property (nonatomic, weak) UIViewController *currentController;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSDictionary *userInfo;
    
+ (instancetype)eventWithContent:(KeChatContent *)content currentController:(UIViewController *)currentController indexPath:(NSIndexPath *)indexPath userInfo:(NSDictionary *)userInfo;

@end

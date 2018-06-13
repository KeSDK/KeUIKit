//
//  KeContent.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/9.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KeMessageType)
{
    KeMessageTypeSelf,
    KeMessageTypeOther
};

@interface KeChatContent : NSObject
    
@property (nonatomic, strong) NSString *identifier;

@end

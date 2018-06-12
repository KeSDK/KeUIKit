//
//  KeChatTableViewCell.h
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/9.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeChatContent.h"
#import "KeChatEvent.h"


#define KeChatDefaultCellHeight 12

@interface KeChatTableViewCell : UITableViewCell

@property (nonatomic, weak) id<KeChatEventDelegate> eventDelegate;

+ (NSString *)getreuseIdWithMessageType:(KeMessageType)type;
+ (CGFloat)getHeightByContent:(KeChatContent *)content;

- (instancetype)initWithMessageType:(KeMessageType)messageType;
- (void)postEventByKey:(NSString *)key withEventInfo:(KeChatEvent *)eventInfo;


@end

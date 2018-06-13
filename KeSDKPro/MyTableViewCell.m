//
//  MyTableViewCell.m
//  KeSDKPro
//
//  Created by 柯建芳 on 2018/6/9.
//  Copyright © 2018年 柯建芳. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()
    

    
@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lable = [[UILabel alloc] init];
        [self.contentView addSubview:self.lable];
    }
    return self;
}
    
    
@end

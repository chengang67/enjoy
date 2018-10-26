//
//  FlowItemCell.m
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "FlowItemCell.h"

@implementation FlowItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(BCirculateProcess *)model{
    self.suggestion.text = model.dp_content;
    self.name.text = model.dp_username;
    self.date.text = [StringUtils timestampToTime:model.dp_createtime andFormatter:@"YYYY-MM-dd"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

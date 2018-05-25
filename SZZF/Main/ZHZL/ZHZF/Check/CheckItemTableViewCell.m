//
//  CheckItemTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CheckItemTableViewCell.h"

@implementation CheckItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(BeventModel2 *)model{
    NSString *type = @"";
    switch (model.pe_event_type) {
        case 1:
            type = @"事件";
            break;
        case 2:
            type = @"部件";
            break;
        case 3:
            type = @"检查类";
            break;
        default:
            break;
    };
    
    self.event_no.text = model.pe_case;
    self.event_type.text = type;
    self.event_super.text = model.et_name2;
    self.event_litter.text = model.et_name3;
    self.event_content.text = model.pe_content;
    self.event_state.text = model.cs_name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

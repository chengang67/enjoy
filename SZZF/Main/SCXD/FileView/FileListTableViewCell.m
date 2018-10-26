//
//  FileListTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "FileListTableViewCell.h"

@implementation FileListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(BDocument *)model{
    self.title.text = model.d_title;
    self.date.text = [NSString stringWithFormat:@"%@  %@",model.d_remark,[StringUtils timestampToTime:model.d_createtime andFormatter:@"YYYY-MM-dd"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

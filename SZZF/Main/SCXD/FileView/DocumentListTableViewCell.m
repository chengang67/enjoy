//
//  DocumentListTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "DocumentListTableViewCell.h"

@implementation DocumentListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(BNotice *)notice{
    self.title.text = notice.n_title;
    self.content.text = notice.n_content;
    self.date.text = [NSString stringWithFormat:@"%@   %@",notice.n_signature, [StringUtils timestampToTime:notice.n_createtime andFormatter:@"YYYY-MM-dd"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

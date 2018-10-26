//
//  HistoryTestTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HistoryTestTableViewCell.h"
#import "UIView+SDAutoLayout.h"
@implementation HistoryTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   // self.contentView.backgroundColor = [UIColor redColor];
    self.title.font = [UIFont systemFontOfSize:15];
    self.title.textColor = [UIColor blueColor];
    self.title.sd_layout
    .leftSpaceToView(self.contentView, 8)
    .topSpaceToView(self.contentView, 10)
    .widthIs(100)
    .heightIs(21);

    self.content.sd_layout
    .leftSpaceToView(self.title, 0)
    .topEqualToView(self.title)
    .rightSpaceToView(self.contentView, 8)
    .autoHeightRatio(0);
    self.title.text =@"111";
    self.content.text =@"111";
//    self.title.frame = CGRectMake(0, 0, 100, 20);
//    self.content.frame =CGRectMake(110, 0, 100, 20);
//    self.title.text= @"1111";
//    self.content.text= @"1111";
    
}
- (void)setModel:(TestObject *)model{
//    _model = model;
//    _title.text = model.title;
//    _content.text = model.content;
//
//    [self setupAutoHeightWithBottomViewsArray:@[_title, _content] bottomMargin:10];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

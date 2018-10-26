//
//  HistoryTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor redColor];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 8)
    .topSpaceToView(self.contentView, 10)
    .widthIs(100)
    .heightIs(21);
    
    self.contentLable.sd_layout
    .leftSpaceToView(self.titleLabel, 0)
    .topEqualToView(self.titleLabel)
    .rightSpaceToView(self.contentView, 8)
    .autoHeightRatio(0);
}

-(void)config:(BeventModel2 *)model row:(NSInteger)row{
//    if (row ==0) {
//        self.titleLabel.text =@"市级编号：";
//        self.contentLable.text = @"201522554122255454122114455221145555";
//    }else if (row == 1){
//        self.titleLabel.text =@"问题来源：";
//        self.contentLable.text = @"一般事件";
//    }else if (row == 2){
//        self.titleLabel.text =@"市级编号：";
//        self.contentLable.text = @"一般201522554122255454122114455221145555";
//    }else if (row == 3){
//        self.titleLabel.text =@"问题分类：";
//        self.contentLable.text = @"一般事件一般事件一般事件一般事件一般事件一般事件一般事件一般事件一般事件一般事件一般事件一般事件";
//    }else{
//        self.titleLabel.text =@"问题来源：";
//        self.contentLable.text = @"一般事件";
//    }
//    [self.contentView sd_addSubviews:@[self.titleLabel, self.contentLable]];
//    self.contentLable.sd_layout
//    .topEqualToView(self.titleLabel)
//    .leftSpaceToView(self.titleLabel, 10)
//    .autoHeightRatio(0);
//
  
}

- (void)setModel:(TestObject *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLable.text = model.content;
    UILabel *label = self.contentLable;
    [self setupAutoHeightWithBottomView:label bottomMargin:10];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

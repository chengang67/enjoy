//
//  FileItemCell.m
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "FileItemCell.h"

@implementation FileItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(NSString *)fileName{
    self.fileName.text = fileName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

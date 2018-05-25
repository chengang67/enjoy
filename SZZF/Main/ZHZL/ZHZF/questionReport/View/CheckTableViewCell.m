//
//  CheckTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CheckTableViewCell.h"

@implementation CheckTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.check_option.delegate = self;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    self.mBevent.pe_check_opinion = textView.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkResultClick:(id)sender {
    NSArray *dataSources = @[@"通过", @"不通过"];
    [BRStringPickerView showStringPickerWithTitle:@"核查结果" dataSource:dataSources defaultSelValue:@"通过" isAutoSelect:YES themeColor:[UIColor blueColor] resultBlock:^(id selectValue) {
        self.mBevent.pe_check_result = selectValue;
        self.check_result.text = selectValue;
    } cancelBlock:^{
        NSLog(@"点击了背景视图或取消按钮");
    }];
}
@end

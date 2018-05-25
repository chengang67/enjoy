//
//  suggestionCell.m
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "suggestionCell.h"

@implementation suggestionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    for (UIButton *btn in self.checkBtnArray) {
        [btn setImage:[UIImage imageNamed:@"btn_unselect"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"btn_select"] forState:UIControlStateSelected];
    }
    self.suggestion.delegate = self;
}

#pragma mark -UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    self.infoModel.circulateProcess.dp_content = textView.text;
}

-(void)config:(id)model{
    self.infoModel = model;
    NSArray *array = [StringUtils componentSeparatedByString:self.infoModel.document.d_circulate];
    NSInteger count = array == nil ? 0 :array.count;
    self.circulateCount.text = [NSString stringWithFormat:@"%ld人",count];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkBtnClick:(id)sender {
    UIButton * btn =sender;
    btn.selected = !btn.selected;

    switch (btn.tag) {
        case 0:
            {
                if (btn.selected) {
                    self.infoModel.circulateProcess.dp_username = [User currentUser].u_name;
                }else{
                    self.infoModel.circulateProcess.dp_username = @"";
                }
                self.sign.text = self.infoModel.circulateProcess.dp_username;
            }
            break;
        case 1:
            {
                UIButton *btn2 = _checkBtnArray[2];
                [btn2 setSelected:NO];
                if (btn.selected) {
                   [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotify_Banjie_Cirlulate" object:self userInfo:@{@"isCirculate": @"0",@"isSelect":@"1"}];
                }else{
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotify_Banjie_Cirlulate" object:self userInfo:@{@"isCirculate": @"0",@"isSelect":@"0"}];
                }
                
            }
            break;
        case 2:
            {
                UIButton *btn1 = _checkBtnArray[1];
                [btn1 setSelected:NO];
                if (btn.selected) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotify_Banjie_Cirlulate" object:self userInfo:@{@"isCirculate": @"1",@"isSelect":@"1"}];
                }else{
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotify_Banjie_Cirlulate" object:self userInfo:@{@"isCirculate": @"1",@"isSelect":@"0"}];
                }
            }
            break;
        default:
            break;
    }
}


@end

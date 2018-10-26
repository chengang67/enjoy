//
//  ContentTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ContentTableViewCell.h"
@implementation ContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentDesc.delegate = self;
    
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
    self.questionStyle.text = type;
    self.superStyle.text = model.et_name2;
    self.litterStyle.text = model.et_name3;
    self.locationGrid.text = model.pe_address;
    self.contentDesc.text = model.pe_content;

}

- (void)textViewDidEndEditing:(UITextView *)textView{
    self.mBEventModel.pe_content = textView.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)styleBtnClick:(id)sender {
    NSArray *dataSources = @[@"事件", @"部件", @"检查类"];
    [BRStringPickerView showStringPickerWithTitle:@"问题类型" dataSource:dataSources defaultSelValue:@"事件" isAutoSelect:YES themeColor:[UIColor blueColor] resultBlock:^(id selectValue) {
        if (![self.questionStyle.text isEqualToString:selectValue]) {
            self.mBEventModel.pe_source = selectValue;
            self.questionStyle.text = self.mBEventModel.pe_source;
            if ([selectValue isEqualToString:@"事件"]) {
                self.mBEventModel.pe_event_type = 1;
                [self getSuperStyleDataWithEt_type:@"1" Et_level:@"1" Et_parentid:@""];
            }else if ([selectValue isEqualToString:@"部件"]){
                self.mBEventModel.pe_event_type = 2;
                [self getSuperStyleDataWithEt_type:@"2" Et_level:@"1" Et_parentid:@""];
            }else if ([selectValue isEqualToString:@"检查类"]) {
                self.mBEventModel.pe_event_type = 3;
                [self getSuperStyleDataWithEt_type:@"3" Et_level:@"1" Et_parentid:@""];
            }
            self.superStyle.text = @"";
            self.mBEventModel.pe_type_two = -1;
            self.litterStyle.text = @"";
            self.mBEventModel.pe_type_three = -1;
        }
    } cancelBlock:^{
        NSLog(@"点击了背景视图或取消按钮");
    }];
}

- (IBAction)superStyleBtnClick:(id)sender {
    if (self.mBEventModel.pe_source.length >0
        &&self.superStyleModelArray !=NULL) {
        NSMutableArray *dataSources = [NSMutableArray new];
        for (SuperStyleModel *model in self.superStyleModelArray) {
            [dataSources addObject:model.et_name];
        }
        SuperStyleModel * defaultModel =self.superStyleModelArray[0];
        [BRStringPickerView showStringPickerWithTitle:@"问题大类" dataSource:dataSources defaultSelValue:defaultModel.et_name isAutoSelect:YES themeColor:[UIColor blueColor] resultBlock:^(id selectValue) {
            self.superStyle.text = selectValue;
            self.mBEventModel.et_name2 = selectValue;
            NSString * et_parnetid ;
            for (SuperStyleModel *model in self.superStyleModelArray) {
                if ([model.et_name isEqualToString:selectValue]) {
                    et_parnetid = [NSString stringWithFormat:@"%ld",(long)model.et_id];
                    self.mBEventModel.pe_type_two = model.et_id;
                }
            }
            if ([self.questionStyle.text isEqualToString:@"事件"]) {
                [self getSuperStyleDataWithEt_type:@"1" Et_level:@"2" Et_parentid:et_parnetid];
            }else if ([self.questionStyle.text isEqualToString:@"部件"]){
                [self getSuperStyleDataWithEt_type:@"2" Et_level:@"2" Et_parentid:et_parnetid];
            }else if ([self.questionStyle.text isEqualToString:@"检查类"]) {
                [self getSuperStyleDataWithEt_type:@"3" Et_level:@"2" Et_parentid:et_parnetid];
            }
        } cancelBlock:^{
            NSLog(@"点击了背景视图或取消按钮");
        }];
    } else{
        [self makeToast:@"请选择问题类型"];
    }
    
}
- (IBAction)litterStyleBtnClick:(id)sender {
    if (self.mBEventModel.pe_source.length > 0
        && self.mBEventModel.pe_source.length > 0
        && self.litterStyleModelArray !=NULL) {
        NSMutableArray *dataSources = [NSMutableArray new];
        for (SuperStyleModel *model in self.litterStyleModelArray) {
            [dataSources addObject:model.et_name];
        }
        SuperStyleModel *defaultModel =self.litterStyleModelArray[0];
        [BRStringPickerView showStringPickerWithTitle:@"问题小类" dataSource:dataSources defaultSelValue:defaultModel.et_name isAutoSelect:YES themeColor:[UIColor blueColor] resultBlock:^(id selectValue) {
            self.litterStyle.text = selectValue;
            self.mBEventModel.et_name3 = selectValue;
            for (SuperStyleModel *model in self.litterStyleModelArray) {
                if ([model.et_name isEqualToString:selectValue]) {
                    //et_parnetid = [NSString stringWithFormat:@"%ld",(long)model.et_id];
                    self.mBEventModel.pe_type_three = model.et_id;
                }
            }
        } cancelBlock:^{
            NSLog(@"点击了背景视图或取消按钮");
        }];
    }else{
        [self makeToast:@"请选择问题类型和问题大类"];
    }
    
}



-(void) getSuperStyleDataWithEt_type:(NSString *)et_type Et_level:(NSString *)et_level Et_parentid:(NSString *)et_parentid {
    [BeventTypeModel getEventStyleWithEt_type:et_type et_level:et_level et_parentid:et_parentid successed:^(id model) {
        switch ([et_level integerValue]) {
            case 1:
                self.superStyleModelArray = model;
                break;
            case 2:
                self.litterStyleModelArray = model;
                break;
            default:
                break;
        }
        
    } failed:^(NSString *msg) {
        
    }];
}

@end

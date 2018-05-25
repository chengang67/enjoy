//
//  DealTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "DealTableViewCell.h"

@implementation DealTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reportBtnClick:(id)sender {
    self.reportBtn.enabled = NO;
    [EventUploadModel UploadEventWithEventModel:self.mBEventModel Type:self.tag successed:^(id model) {
        if (model == false) {
            self.reportBtn.enabled = YES;
        }else{
            self.reportBtn.enabled = YES;
            [self.rootVC dismissViewControllerAnimated:YES completion:nil];
            [SVProgressHUD showSuccessWithStatus:@"案件上传成功！"];
            [self.rootVC.navigationController popViewControllerAnimated:YES];
        }
    } failed:^(NSString *msg) {
        self.reportBtn.enabled = YES;
    }];
}

- (IBAction)saveBtnClick:(id)sender {
    
}
@end

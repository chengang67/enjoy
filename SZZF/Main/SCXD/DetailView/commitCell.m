//
//  commitCell.m
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "commitCell.h"

@implementation commitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fun:) name:@"kNotify_Banjie_Cirlulate" object:nil];
}

-(void)config:(id)model{
    self.infoModel = model;
}

- (IBAction)ommitBtnClick:(id)sender {
    if (self.infoModel.circulateProcess.dp_content ==nil) {
        [SVProgressHUD showErrorWithStatus:@"请填写审阅意见"];
        return;
    }
    if (!self.isSelect) {
        [SVProgressHUD showErrorWithStatus:@"请选择办结或审阅"];
        return;
    }
    if (self.infoModel.circulateProcess.dp_username ==nil) {
        [SVProgressHUD showErrorWithStatus:@"请签字"];
        return;
    }
    if (self.infoModel.document.d_circulate == nil && self.isCirculate) {
        [SVProgressHUD showErrorWithStatus:@"请选择传阅人"];
        return;
    }

    NSString *u_id = [User currentUser].u_id;
    NSDictionary *dic;
    NSString *url;
    if (!self.isCirculate) {
        dic = [NSDictionary dictionaryWithObjectsAndKeys:u_id,@"u_id",u_id,@"dp_userid",
               @(self.infoModel.document.d_id),@"dp_documentid",
               self.infoModel.circulateProcess.dp_username,@"dp_username",
               self.infoModel.circulateProcess.dp_content,@"dp_content",nil];
        url = @"banjieDocument";
    }else{
        dic = [NSDictionary dictionaryWithObjectsAndKeys:u_id,@"u_id",u_id,@"dp_userid",               @(self.infoModel.document.d_id),@"dp_documentid",self.infoModel.circulateProcess.dp_username,@"dp_username",
               self.infoModel.circulateProcess.dp_content,@"dp_content",
               self.infoModel.document.d_circulate,@"d_circulate",nil];
        url = @"circulateDocument";
    }
    [CommitDocumentModel commitDocumentInfo:dic Url:url successed:^(id model) {
        [self.rootVC.navigationController popViewControllerAnimated:YES];
    } failed:^(NSString *msg) {
        
    }];
}

-(void)fun:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    if ([[dic objectForKey:@"isCirculate"] isEqualToString:@"0"]) {
        self.isCirculate = NO;
    }else if([[dic objectForKey:@"isCirculate"] isEqualToString:@"1"]){
        self.isCirculate = YES;
    }
    if ([[dic objectForKey:@"isSelect"] isEqualToString:@"0"]) {
        self.isSelect = NO;
    }else{
        self.isSelect = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

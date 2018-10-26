//
//  fileCell.m
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "fileCell.h"

@implementation fileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

-(void)config:(id)model{
    if ([model isKindOfClass:[NoticeInfoModel class]]) {
        NoticeInfoModel *noticeModel = model;
        self.fileArray = [StringUtils componentSeparatedByString:noticeModel.notice.n_attachment];
    }else{
        DocumentInfoModel *documentModel = model;
        self.fileArray = [StringUtils componentSeparatedByString:documentModel.document.d_attachment];
    }
    [self.fileTableView reloadData];
}

#pragma mark -- UITableViewDelegate UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fileArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FileItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileitemcell"];
    [ cell config:self.fileArray[indexPath.row] ];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSString *encodedString=[[NSString stringWithFormat:@"%@%@",kBaseImageUrl, self.fileArray[indexPath.row]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:encodedString] ];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

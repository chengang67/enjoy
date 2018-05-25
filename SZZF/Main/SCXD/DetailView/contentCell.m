//
//  contentCell.m
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "contentCell.h"
#import "fileCell.h"
#import "NSObject+CGSize.h"
@implementation contentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)config:(id)model{
    if ([model isKindOfClass:[NoticeInfoModel class]]) {
        NoticeInfoModel *noticeModel = model;
        self.title.text = noticeModel.notice.n_title;
        self.content.text = noticeModel.notice.n_content;
        self.date.text = [NSString stringWithFormat:@"%@  %@",noticeModel.notice.n_remark,[StringUtils timestampToTime:noticeModel.notice.n_createtime andFormatter:@"YYYY-MM-dd"]];
        //self.readCount.text = [NSString stringWithFormat:@"%ld人已读", (long)noticeModel.status0];
        self.readCount.hidden = YES;
        self.contentHeight.constant = [self cellContentViewWith:noticeModel.notice.n_content];
        NSLog(@"这是内容%@",noticeModel.notice.n_content);
        
    }else{
        DocumentInfoModel *documentModel = model;
        self.title.text = documentModel.document.d_title;
        self.content.text = documentModel.document.d_content;
        self.date.text = [NSString stringWithFormat:@"%@  %@",documentModel.document.d_remark,[StringUtils timestampToTime:documentModel.document.d_createtime andFormatter:@"YYYY-MM-dd"]];
       // self.readCount.text = [NSString stringWithFormat:@"%ld人已读", (long)documentModel.status0];
        self.readCount.hidden = YES;
        self.contentHeight.constant = [self cellContentViewWith:documentModel.document.d_content];
    }
   
}

- (CGFloat)cellContentViewWith:(NSString *)str
{
    CGFloat width = screenWidth -30;
    CGSize size = [NSObject getSizeWithString:str labelWidth:width textFont:15];
    return size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

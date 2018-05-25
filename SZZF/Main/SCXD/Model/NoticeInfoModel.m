//
//  NoticeInfoModel.m
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NoticeInfoModel.h"

@implementation NoticeInfoModel
+(void)getNoticeInfo:(NSInteger)noticeid successed:(ModelBlock)success failed:(FailBlock)fail{
    NSString *u_id = [User currentUser].u_id;
    [HTTPTool getCacheRequestWithUrlString:@"noticeInfo" parameters:@{@"u_id":u_id,@"notice_id": @(noticeid)} cacheTime:0 succeed:^(id data) {
        NSLog(@"详情==%@",data);
        NoticeInfoModel *model = [NoticeInfoModel mj_objectWithKeyValues:[data objectForKey:@"data"]];
        success(model);
    } fail:^(NSString *error) {
        fail(error);
    }];
}
@end

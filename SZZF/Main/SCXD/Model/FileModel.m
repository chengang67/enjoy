//
//  FileModel.m
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "FileModel.h"

@implementation FileModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"rows" : @"BDocument",
             };
}

+(void)getFileListWithState:(NSString*)state limit:(NSInteger)limit offset:(NSInteger)offset successed:(ModelBlock)success failed:(FailBlock)fail{
    NSString *u_id = [User currentUser].u_id;
    [HTTPTool getCacheRequestWithUrlString:@"documentList" parameters:@{@"limit":@(limit),@"offset":@(offset),@"u_id":u_id,@"type":state} cacheTime:0 succeed:^(id data) {
        NSDictionary *dic = data;
        dic = [data objectForKey:@"data"];
        FileModel *model = [FileModel mj_objectWithKeyValues:dic];
        success(model.rows);
    } fail:^(NSString *error) {
        fail(error);
    }];
}

+(void)getFileCountsuccessed:(ModelBlock)success failed:(FailBlock)fail{
    NSString *u_id = [User currentUser].u_id;
    [HTTPTool getCacheRequestWithUrlString:@"documentCount" parameters:@{@"u_id":u_id} cacheTime:0 succeed:^(id data) {
        FileModel *model = [FileModel mj_objectWithKeyValues:[data objectForKey:@"data"]];
        success(model);
    } fail:^(NSString *error) {
        fail(error);
    }];
}
@end

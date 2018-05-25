//
//  DocumentInfoModel.m
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "DocumentInfoModel.h"

@implementation DocumentInfoModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"documentprocess" : @"BCirculateProcess",
             };
}

+(void)getDocumentInfo:(NSInteger)documentid successed:(ModelBlock)success failed:(FailBlock)fail{
    NSString *u_id = [User currentUser].u_id;
    [HTTPTool getCacheRequestWithUrlString:@"documentInfo" parameters:@{@"u_id":u_id,@"document_id": @(documentid)} cacheTime:0 succeed:^(id data) {
        DocumentInfoModel *model = [DocumentInfoModel mj_objectWithKeyValues:[data objectForKey:@"data"]];
        success(model);
    } fail:^(NSString *error) {
        fail(error);
    }];
}

@end

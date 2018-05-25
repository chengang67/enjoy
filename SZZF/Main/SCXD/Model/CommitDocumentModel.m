//
//  CommitDocumentModel.m
//  SZZF
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CommitDocumentModel.h"

@implementation CommitDocumentModel
+(void)commitDocumentInfo:(NSDictionary *)dic Url:(NSString *)url successed:(ModelBlock)success failed:(FailBlock)fail{

    [HTTPTool getCacheRequestWithUrlString:url parameters:dic cacheTime:0 succeed:^(id data) {
        BaseModel *model =[BaseModel mj_objectWithKeyValues:data];
        if ([model.message isEqualToString:@"成功"]) {
            [SVProgressHUD showSuccessWithStatus:@"审阅完成！"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"审阅失败！"];
        }
    } fail:^(NSString *error) {
        fail(error);
    }];
}
@end

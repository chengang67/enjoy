//
//  CommitDocumentModel.h
//  SZZF
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"
#import "DocumentInfoModel.h"
@interface CommitDocumentModel : BaseModel
+(void)commitDocumentInfo:(NSDictionary *)dic Url:(NSString *)url successed:(ModelBlock)success failed:(FailBlock)fail;
@end

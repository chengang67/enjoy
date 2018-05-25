//
//  NoticeInfoModel.h
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"
#import "BNotice.h"
@interface NoticeInfoModel : BaseModel
@property(nonatomic, assign)NSInteger status0;//未读数量

@property(nonatomic, assign)NSInteger status1;//已读数量

@property(nonatomic, strong)BNotice *notice;

+(void)getNoticeInfo:(NSInteger)noticeid successed:(ModelBlock)success failed:(FailBlock)fail;
@end

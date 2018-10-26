//
//  HistoryCountModel.h
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface HistoryCountModel : BaseModel
@property(nonatomic, assign)NSInteger hss;//核实数
@property(nonatomic, assign)NSInteger hcs;//核查数
@property(nonatomic, assign)NSInteger sbs;//上报数
@property(nonatomic, assign)NSInteger jrsbs;//今日上报数
@property(nonatomic, strong)NSString *u_name;//用户

/**
 获取历史案件数量
 @param u_id 用户id
 */
+(void)getHistoryEventCountWithU_id:(NSString *)u_id successed:(ModelBlock)success failed:(FailBlock)fail;
@end

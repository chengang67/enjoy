//
//  EventCheckModel.h
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface EventCheckModel : BaseModel
@property (strong, nonatomic) NSArray *data;//大类数组

/**
 获取现场核查数据

 @param u_id 用户id
 @param limit 分页
 @param offset 分页
 @param block <#block description#>
 @param success <#success description#>
 @param fail <#fail description#>
 */
+(void)getEventListWithU_id:(NSString *)u_id limit:(NSInteger)limit offset:(NSInteger)offset block:(NSString *)block successed:(ModelBlock)success failed:(FailBlock)fail;


/**
 获取历史案件列表

 @param u_id <#u_id description#>
 @param limit <#limit description#>
 @param offset <#offset description#>
 @param type <#type description#>
 @param success <#success description#>
 @param fail <#fail description#>
 */
+(void)getHistoryEventListWithU_id:(NSString *)u_id limit:(NSInteger)limit offset:(NSInteger)offset type:(NSInteger)type successed:(ModelBlock)success failed:(FailBlock)fail;

@end

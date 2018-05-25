//
//  BeventModel2.h
//  SZZF
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BeventModel.h"

@interface BeventModel2 : BeventModel
/**
 * 来源
 */
@property(nonatomic, strong)NSString * ps_name;
@property(nonatomic, strong)NSString * ps_name1;
@property(nonatomic, strong)NSString * ps_name2;
@property(nonatomic, strong)NSString * ps_name3;
/**
 * 事件类型
 */
@property(nonatomic, strong)NSString * et_name1;
@property(nonatomic, strong)NSString * et_name2;
@property(nonatomic, strong)NSString * et_name3;
@property(nonatomic, strong)NSString *et_name;

@property(nonatomic, strong)NSString *eg_name;

@property(nonatomic, strong)NSString *eg_name1;
@property(nonatomic, strong)NSString *eg_name2;
@property(nonatomic, strong)NSString * eg_name3;

/**
 * 等级
 */
@property(nonatomic, strong)NSString *el_name;


/**
 * 派单人名称
 */
@property(nonatomic, strong)NSString * u_name ;



/**
 *处置类型
 */
@property(nonatomic, strong)NSString * manage_type_name;

/**
 * 恢复人
 */
@property(nonatomic, strong)NSString * renew_name;
/**
 * 派单人
 */
@property(nonatomic, strong)NSString * send_single_name;
/**
 * 申请人
 */
@property(nonatomic, strong)NSString *apple_name;
/**
 * 案卷状态
 */
@property(nonatomic, strong)NSString * casestatus_name;
/**
 *  派发部门
 */
@property(nonatomic, strong)NSString * send_dpt_name;
/**
 * 签收人
 */
@property(nonatomic, strong)NSString * signin_name;
/**
 * 延期申请ren
 */
@property(nonatomic, strong)NSString * extensionreq_name;
/**
 * 延期审核人
 */
@property(nonatomic, strong)NSString * extensioncheck_name;
/**
 * 中止人
 */
@property(nonatomic, strong)NSString * discontinue_name;
/**
 * 撤回人
 */
@property(nonatomic, strong)NSString * revocation_name;
/**
 * 录入人
 */
@property(nonatomic, strong)NSString * enter_name;

/**
 * 办结人
 */
@property(nonatomic, strong)NSString * banjie_name;

/**
 * 上报人
 */
@property(nonatomic, strong)NSString * report_name;

/**
 * 案件状态
 */
@property(nonatomic, strong)NSString *cs_name;
/**
 * 评价情况  true 满意 false 不满意
 */

@property(nonatomic, assign)BOOL estimate_situation;
/**
 * 平台名称
 */
@property(nonatomic, strong)NSString * platform_name;

@property(nonatomic, strong)NSString * withdept_name;
/**
 * 镇名称
 */
@property(nonatomic, strong)NSString *town_name;
/**
 * 监督员
 */
@property(nonatomic, strong)NSString * supervisor_name;
/**
 * 立案人
 */
@property(nonatomic, strong)NSString * lauser_name;


@end

//
//  Process.h
//  SZZF
//
//  Created by Apple on 2018/3/7.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Process : NSObject

extern NSString *const REGISTER = @"问题登记";

extern NSString *const REPORT = @"问题上报";

extern NSString *const FAST_REPORT = @"快速上报";

extern NSString *const INVALID = @"作废";

extern NSString *const CHECK_OUT = @"核实派发";

extern NSString *const VERIFICATION_OUT = @"核查派发";

extern NSString *const CLOSE = @"结案";

extern NSString *const CLOSE_APPLY = @"结案申请";

extern NSString *const ONE_POSTPONED_APPLY = @"一级缓办申请";

extern NSString *const ONE_POSTPONED_APPROVAL = @"一级缓办审批";

extern NSString *const TWO_POSTPONED_APPLY = @"二级缓办申请";

extern NSString *const THREE_POSTPONED_APPLY = @"三级缓办申请";

extern NSString *const TWO_CHARGE_ACCOUNT_APPLY = @"二级挂账申请";

extern NSString *const THREE_CHARGE_ACCOUNT_APPLY = @"三级挂账申请";

extern NSString *const ONE_CHARGE_ACCOUNT_APPROVAL = @"一级挂账审核";

extern NSString *const TWO_CHARGE_ACCOUNT_APPROVAL = @"二级挂账审核";

extern NSString *const TWO_EXTENSION_APPLY = @"二级延期申请";

extern NSString *const TWO_ROLLBACK_APPLY = @"二级回退申请";

extern NSString *const SYNERGY_DISPATCH = @"协同派发";

extern NSString *const NOT_GO_VERIFICATION = @"核查不通过";

extern NSString *const GO_VERIFICATION = @"核查通过";
@end

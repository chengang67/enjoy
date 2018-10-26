//
//  EventUploadModel.m
//  SZZF
//
//  Created by Apple on 2018/3/7.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "EventUploadModel.h"

@implementation EventUploadModel

+(void)UploadEventWithEventModel:(BeventModel2 *)evnetModel Type:(NSInteger)type successed:(ModelBlock)success failed:(FailBlock)fail{
    NSString * u_id = [User currentUser].u_id;
    NSDictionary *dic = nil;
    if (type == 0) {
        //上报
        if (!evnetModel.pe_event_type  || !evnetModel.pe_type_two || !evnetModel.pe_type_three
            || !evnetModel.pe_lat || !evnetModel.pe_lng || evnetModel.pe_content_accessory == nil
            || evnetModel.pe_content ==nil) {
            [SVProgressHUD showErrorWithStatus:@"参数不完整！"];
            return ;
        }
        dic = @{
                @"u_id":u_id,
                @"process":REPORT,
                @"pe_event_type":@(evnetModel.pe_event_type),
                @"pe_type_two":@(evnetModel.pe_type_two),
                @"pe_type_three":@(evnetModel.pe_type_three),
                @"pe_lat":[NSString stringWithFormat:@"%f",evnetModel.pe_lat],
                @"pe_lng":[NSString stringWithFormat:@"%f",evnetModel.pe_lng],
                @"pe_address":evnetModel.pe_address,
                @"pe_content_accessory":evnetModel.pe_content_accessory,
                @"pe_content":evnetModel.pe_content
                };
    }else if (type == 1){
        //核查
        if (evnetModel.pe_check_opinion == nil  || evnetModel.pe_results_accessory == nil || evnetModel.pe_check_result == nil) {
            [SVProgressHUD showErrorWithStatus:@"参数不完整！"];
            return ;
        }
        dic = @{
                @"u_id":u_id,
                @"id":@(evnetModel.pe_id),
                @"process":![evnetModel.pe_check_result isEqualToString:@"通过"] ? NOT_GO_VERIFICATION :GO_VERIFICATION,
                @"pe_check_opinion":evnetModel.pe_check_opinion,
                @"pe_results_accessory":evnetModel.pe_results_accessory,
                @"pe_check_result":evnetModel.pe_check_result
                };
    }else if (type == 2){
        //核实
    }else if (type == 3){
        //简易案件
        if (!evnetModel.pe_event_type  || !evnetModel.pe_type_two || !evnetModel.pe_type_three
            || !evnetModel.pe_lat || !evnetModel.pe_lng || evnetModel.pe_content_accessory == nil
            || evnetModel.pe_content ==nil) {
            [SVProgressHUD showErrorWithStatus:@"参数不完整！"];
            return ;
        }
        dic = @{
                @"u_id":u_id,
                @"process":FAST_REPORT,
                @"pe_event_type":@(evnetModel.pe_event_type),
                @"pe_type_two":@(evnetModel.pe_type_two),
                @"pe_type_three":@(evnetModel.pe_type_three),
                @"pe_lat":[NSString stringWithFormat:@"%f",evnetModel.pe_lat],
                @"pe_lng":[NSString stringWithFormat:@"%f",evnetModel.pe_lng],
                @"pe_address":evnetModel.pe_address,
                @"pe_content_accessory":evnetModel.pe_content_accessory,
                @"pe_results_accessory":evnetModel.pe_results_accessory,
                @"pe_content":evnetModel.pe_content
                };
    }
    
    [HTTPTool getCacheRequestWithUrlString:@"flow" parameters:dic cacheTime:0 succeed:^(id data) {
        success(data);
    } fail:^(NSString *error) {
        fail(error);
    }];
}

@end

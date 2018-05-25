//
//  BeventTypeModel.h
//  SZZF
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface BeventTypeModel : BaseModel
//
//@property(nonatomic, assign) NSInteger id;
//
//@property(nonatomic, assign) NSInteger et_id;
//
//@property(nonatomic, strong) NSString *et_name;
//
//@property(nonatomic, assign) NSInteger et_parentid;
//
//@property(nonatomic, strong) NSString *et_parentname;
//
//@property(nonatomic, assign) NSInteger et_level;
//
//
//
//@property(nonatomic, assign) NSInteger et_cl_limit;    //处置时限
//@property(nonatomic, assign) NSInteger et_cl_limitunit;//处置时限单位
//
///**
// * 编码
// */
//@property(nonatomic, strong) NSString * et_code;
///**
// * 符号
// */
//@property(nonatomic, strong) NSString * et_symbol;
///**
// * 备注
// */
//@property(nonatomic, strong) NSString * et_remark;
///**
// * 类型 1.事件 2.部件 3 检查类
// */
//@property(nonatomic, assign) NSInteger et_type;
///**
// * 图层表名
// */
//@property(nonatomic, strong) NSString * et_layer;
///**
// * 是否为末级
// */
//@property(nonatomic, assign) NSInteger et_lastlevel;
///**
// * 是否位井盖
// */
//@property(nonatomic, assign) NSInteger et_iscover;

@property (strong, nonatomic) NSArray *data;//大类数组


+(void)getEventStyleWithEt_type:(NSString*)et_type et_level:(NSString *)et_level et_parentid:(NSString *)et_parentid successed:(ModelBlock)success failed:(FailBlock)fail;

@end

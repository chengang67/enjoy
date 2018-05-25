//
//  BDocument.h
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDocument : NSObject
@property(nonatomic, assign)NSInteger id;

@property(nonatomic, assign)NSInteger d_id;

@property(nonatomic, copy)NSString * d_title;

@property(nonatomic, copy)NSString * d_content;

/**
 * 状态（0未发布 1发布 2传阅 3审阅 4 删除）
 */
@property(nonatomic, assign)NSInteger d_status;

@property(nonatomic, assign)NSInteger d_type;

@property(nonatomic, assign)NSInteger d_priority;

@property(nonatomic, copy)NSString * d_createtime;

@property(nonatomic, copy)NSString * d_updatetime;

@property(nonatomic, copy)NSString * d_remark;

@property(nonatomic, copy)NSString * d_attachment;

@property(nonatomic, copy)NSString * d_circulate;

@property(nonatomic, copy)NSString * d_office;

@property(nonatomic, copy)NSString * d_name;

@property(nonatomic, copy)NSString * d_nature;

@property(nonatomic, copy)NSString * d_intime;

@property(nonatomic, copy)NSString * d_signature;

@end

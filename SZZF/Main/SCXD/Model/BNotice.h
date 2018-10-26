//
//  BNotice.h
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNotice : NSObject

@property(nonatomic, assign)NSInteger id;

@property(nonatomic, assign)NSInteger n_id;

@property(nonatomic, copy)NSString * n_title;

@property(nonatomic, copy)NSString * n_content;

/**
 * 状态（0录入 1发布 2撤销 3删除）
 */
@property(nonatomic, assign)NSInteger n_status;

@property(nonatomic, assign)NSInteger n_type;

@property(nonatomic, assign)NSInteger n_priority;

@property(nonatomic, copy)NSString * n_createtime;

@property(nonatomic, copy)NSString *n_updatetime;

@property(nonatomic, copy)NSString *  n_remark;

@property(nonatomic, copy)NSString * n_attachment;

@property(nonatomic, copy)NSString * n_signature;//落款



@end

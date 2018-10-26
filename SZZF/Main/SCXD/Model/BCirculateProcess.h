//
//  BCirculateProcess.h
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCirculateProcess : NSObject
@property(nonatomic, assign)NSInteger d_status;

@property(nonatomic, assign)NSInteger dp_userid;

@property(nonatomic, assign)NSInteger dp_documentid;

@property(nonatomic, copy)NSString * dp_content;

@property(nonatomic, assign)NSInteger dp_id;

@property(nonatomic, copy)NSString * dp_username;

@property(nonatomic, assign)NSInteger dp_status;

@property(nonatomic, copy)NSString * dp_createtime;

@property(nonatomic, copy)NSString * dp_remark;
@end

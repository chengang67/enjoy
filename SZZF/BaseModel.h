//
//  BaseModel.h
//  SZZF
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
typedef void(^ModelBlock)(id model);
typedef void(^FailBlock)(NSString *msg);

@property(nonatomic, assign)NSInteger code;
@property(nonatomic, copy)NSString * message;
@property(nonatomic, assign)NSInteger success;
@end

//
//  CirculateModel.h
//  SZZF
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CirculateModel : NSObject

@property(nonatomic, strong)NSMutableArray *data;


+(void)getCirculatesuccessed:(ModelBlock)success failed:(FailBlock)fail;

@end

#import "BDepartment.h"
@interface CirculateListModel : NSObject


@property(nonatomic, strong)BDepartment *department;
@property (strong, nonatomic) NSArray *users;//大类数组total
@end




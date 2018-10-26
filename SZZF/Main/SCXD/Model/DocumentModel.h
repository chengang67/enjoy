//
//  DocumentModel.h
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDocument.h"
@interface DocumentModel : NSObject

@property (strong, nonatomic) NSArray *rows;//大类数组total
@property (assign, nonatomic) NSInteger countRead;
@property (assign, nonatomic) NSInteger countUnRead;

+(void)getFileListWithState:(NSString*)state limit:(NSInteger)limit offset:(NSInteger)offset successed:(ModelBlock)success failed:(FailBlock)fail;

+(void)getDoucmentCountsuccessed:(ModelBlock)success failed:(FailBlock)fail;
@end

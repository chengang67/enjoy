//
//  EventUploadModel.h
//  SZZF
//
//  Created by Apple on 2018/3/7.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"
#import "Process.h"
@interface EventUploadModel : BaseModel

+(void)UploadEventWithEventModel:(BeventModel2 *)evnetModel Type:(NSInteger)type successed:(ModelBlock)success failed:(FailBlock)fail;
@end

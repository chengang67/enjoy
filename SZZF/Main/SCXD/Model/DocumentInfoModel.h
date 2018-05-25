//
//  DocumentInfoModel.h
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"
#import "BDocument.h"
#import "BCirculateProcess.h"
@interface DocumentInfoModel : BaseModel

@property(nonatomic, assign)NSInteger status0;//未读数量
@property(nonatomic, assign)NSInteger status1;//已读数量
@property(nonatomic, strong)BDocument *document;
@property(nonatomic, strong)BCirculateProcess *circulateProcess;
@property (strong, nonatomic) NSArray *documentprocess;//大类数组total

+(void)getDocumentInfo:(NSInteger)documentid successed:(ModelBlock)success failed:(FailBlock)fail;

@end

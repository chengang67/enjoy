//
//  commitCell.h
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentInfoModel.h"
#import "CommitDocumentModel.h"
@interface commitCell : UITableViewCell

- (IBAction)ommitBtnClick:(id)sender;
@property(nonatomic, strong)DocumentInfoModel * infoModel;
@property(nonatomic, assign)BOOL isCirculate;
@property(nonatomic, assign)BOOL isSelect;
@property(nonatomic, strong)UITableViewController *rootVC;

-(void)config:(id)model;
@end

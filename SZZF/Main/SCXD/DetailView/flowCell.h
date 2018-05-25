//
//  flowCell.h
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentInfoModel.h"
#import "BCirculateProcess.h"
#import "FlowItemCell.h"

@interface flowCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *flowTableView;
@property(nonatomic, strong)DocumentInfoModel *infoModel;

-(void)config:(DocumentInfoModel*)model;

@end

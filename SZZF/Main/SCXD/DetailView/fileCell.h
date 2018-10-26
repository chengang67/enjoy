//
//  fileCell.h
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileItemCell.h"
#import "NoticeInfoModel.h"
#import "DocumentInfoModel.h"
#import "SCXDFileViewController.h"
@interface fileCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *fileTableView;
@property(nonatomic,strong) NSArray *fileArray;
@property(nonatomic, strong)SCXDFileViewController *fileVc;
@property(nonatomic, strong)UITableViewController *rootVC;

-(void)config:(id)model;
@end

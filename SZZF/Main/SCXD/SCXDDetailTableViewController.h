//
//  SCXDDetailTableViewController.h
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fileCell.h"
#import "contentCell.h"
#import "flowCell.h"
#import "suggestionCell.h"
#import "commitCell.h"
#import "NoticeInfoModel.h"
#import "DocumentInfoModel.h"
#import "SCXDCirculateTableViewController.h"

@interface SCXDDetailTableViewController : UITableViewController<SCXDCirculateTableViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic, assign)BOOL isDocument;
@property(nonatomic, assign)NSInteger file_id;
@property(nonatomic, strong)DocumentInfoModel *documentModel;
@property(nonatomic, strong)NoticeInfoModel *noticeModel;
@property(nonatomic, strong)SCXDCirculateTableViewController *circulateVC;
@end

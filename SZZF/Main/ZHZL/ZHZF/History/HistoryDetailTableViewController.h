//
//  HistoryDetailTableViewController.h
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryTableViewCell.h"
#import "SDAutoLayout.h"
#import "TestObject.h"
#import "HistoryTestTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface HistoryDetailTableViewController : UITableViewController

@property(nonatomic, strong)NSMutableArray *array;
@end

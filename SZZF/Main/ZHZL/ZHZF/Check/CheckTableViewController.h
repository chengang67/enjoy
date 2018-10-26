//
//  CheckTableViewController.h
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckTableViewController : UITableViewController
@property(nonatomic, assign)int pageSize;
@property(nonatomic, assign)int currentPage;
@property(nonatomic, strong)NSMutableArray *bEventArray;
@property(nonatomic, strong)QuestionReportTableViewController *vc;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@end

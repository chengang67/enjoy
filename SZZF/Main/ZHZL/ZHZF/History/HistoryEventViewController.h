//
//  HistoryEventViewController.h
//  SZZF
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseViewController.h"
#import "CheckItemTableViewCell.h"
#import "EventCheckModel.h"
#import "HistoryCountModel.h"
@interface HistoryEventViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayCount;
@property (weak, nonatomic) IBOutlet UILabel *totleCount;
@property (weak, nonatomic) IBOutlet UILabel *verityCount;
@property (weak, nonatomic) IBOutlet UILabel *checkCount;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)themeBtnClick:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *themeBtn;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *themeView;

@property(nonatomic, strong)UIView *lastView;
@property(nonatomic, assign)int pageSize;
@property(nonatomic, assign)int currentPage;
@property(nonatomic, strong)NSMutableArray *eventModelArray;

@end

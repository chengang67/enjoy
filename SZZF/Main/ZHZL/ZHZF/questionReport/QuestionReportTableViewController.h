//
//  QuestionReportTableViewController.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaiduMapViewController.h"
@interface QuestionReportTableViewController : UITableViewController<AddressControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic, strong)BeventModel2 *mBEventModel;
@property(nonatomic,strong)BaiduMapViewController *baiduMapVC;
@property(nonatomic,assign)NSInteger tag;
@end

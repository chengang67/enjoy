//
//  SCXDFileListViewController.h
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseViewController.h"
#import "FileListTableViewCell.h"
#import "DocumentListTableViewCell.h"
#import "SCXDDetailTableViewController.h"
#import "FileModel.h"
#import "DocumentModel.h"

@interface SCXDFileListViewController : BaseViewController<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *readCount;
@property (weak, nonatomic) IBOutlet UILabel *unReadCount;
@property (weak, nonatomic) IBOutlet UIView *documentView;
@property (weak, nonatomic) IBOutlet UIView *fileView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)themeBtnClick:(UIButton *)sender;

@property(nonatomic, copy)NSString *selectState;
@property(nonatomic, assign) BOOL isDocument;
@property(nonatomic, strong) NSMutableArray *listArray;
@property(nonatomic, assign)NSInteger currentPage;
@property(nonatomic, strong)SCXDDetailTableViewController *vc;
@end

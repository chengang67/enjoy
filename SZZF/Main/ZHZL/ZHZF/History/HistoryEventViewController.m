//
//  HistoryEventViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HistoryEventViewController.h"

@interface HistoryEventViewController ()

@end

@implementation HistoryEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupInterface];
    [self fetchData];
    [self fetchListDataWithType:1];
    [self ListRefresh];
    [self LoadMore];
}

-(void)setupInterface{
    self.title = @"历史案件";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.themeLabel.adjustsFontSizeToFitWidth = YES;
    self.lastView = self.themeView[0];
    self.lastView.backgroundColor = [UIColor grayColor];
    self.pageSize = PageSize;
    self.currentPage = CurrentPage;
    self.eventModelArray = [NSMutableArray arrayWithCapacity:0];
    self.myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

- (IBAction)themeBtnClick:(id)sender {
    UIButton *btn = sender;
    if (btn.tag != self.lastView.tag) {
        //如果点击了不同的主题->更新数据
        self.currentPage = CurrentPage;
        [self.eventModelArray removeAllObjects];
        [self fetchListDataWithType:btn.tag+1];
    }
    UIView *view = _themeView[btn.tag];
    self.lastView.backgroundColor = [UIColor whiteColor];
    view.backgroundColor = [UIColor grayColor];
    self.lastView = view;
}

-(void)fetchData{
    [HistoryCountModel getHistoryEventCountWithU_id:[User currentUser].u_id successed:^(id model) {
        HistoryCountModel *countModel = model;
        self.todayCount.text = [NSString stringWithFormat:@"%d",countModel.jrsbs];
        self.totleCount.text = [NSString stringWithFormat:@"%d",countModel.sbs];
        self.verityCount.text = [NSString stringWithFormat:@"%d",countModel.hss];
        self.checkCount.text = [NSString stringWithFormat:@"%d",countModel.hcs];
    } failed:^(NSString *msg) {
        
    }];
}

-(void)fetchListDataWithType:(NSInteger)type{
    [EventCheckModel getHistoryEventListWithU_id:[User currentUser].u_id limit:self.pageSize offset:self.pageSize *self.currentPage type:type successed:^(id model) {
        NSArray *tempArray = model;
        [self.eventModelArray addObjectsFromArray:tempArray];
        if (tempArray.count < PageSize) {
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.myTableView.mj_footer endRefreshing];
        }
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView reloadData];
    } failed:^(NSString *msg) {
        
    }];
}

-(void) ListRefresh{
    self.myTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = CurrentPage;
        [self.eventModelArray removeAllObjects];
        [self fetchListDataWithType:self.lastView.tag + 1];
    }];
}

-(void)LoadMore{
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self fetchListDataWithType:self.lastView.tag + 1];
    }];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.eventModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CheckItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkitemcell"];
    if (!cell) {
        cell = [[CheckItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checkitemcell"];
    }
    BeventModel2 *event = self.eventModelArray[indexPath.row];
    [cell config:event];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

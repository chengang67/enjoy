//
//  SCXDFileListViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SCXDFileListViewController.h"

@interface SCXDFileListViewController ()

@end

@implementation SCXDFileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets= NO;
    self.listArray = [NSMutableArray arrayWithCapacity:0];
    self.selectState = @"未读";
    self.currentPage = CurrentPage;
    [self initUITableView];
    [self initData:self.selectState];
    [self ListRefresh];
    [self LoadMore];
}

- (IBAction)themeBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            {
                self.documentView.hidden = NO;
                self.fileView.hidden = YES;
                self.selectState =@"未读";
                self.currentPage = CurrentPage;
                [self.listArray removeAllObjects];
                [self initData:self.selectState];
            }
            break;
        case 1:
            {
                self.documentView.hidden = YES;
                self.fileView.hidden = NO;
                self.selectState =@"已读";
                self.currentPage = CurrentPage;
                [self.listArray removeAllObjects];
                [self initData:self.selectState];
            }
            break;
        default:
            break;
    }
}

-(void)initUITableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
}

-(void)initData:(NSString *)state{
    if (self.isDocument) {
        self.title = @"公告管理";
        [DocumentModel getFileListWithState:state limit:PageSize offset:self.currentPage *PageSize successed:^(id model) {
           [self reloadUITableView:model];
        } failed:^(NSString *msg) {
            
        }];
        [DocumentModel getDoucmentCountsuccessed:^(id model) {
            DocumentModel *docModel = model;
            self.readCount.text = [NSString stringWithFormat:@"%ld 条",docModel.countRead];
            self.unReadCount.text = [NSString stringWithFormat:@"%ld 条",docModel.countUnRead];
        } failed:^(NSString *msg) {
            
        }];
    }else{
        self.title = @"公文管理";
        [FileModel getFileListWithState:state limit:PageSize offset:self.currentPage *PageSize successed:^(id model) {
            [self reloadUITableView:model];
        } failed:^(NSString *msg) {
            
        }];
        [FileModel getFileCountsuccessed:^(id model) {
            FileModel *fileModel = model;
            self.readCount.text = [NSString stringWithFormat:@"%ld 条",fileModel.countRead];
            self.unReadCount.text = [NSString stringWithFormat:@"%ld 条",fileModel.countUnRead];
        } failed:^(NSString *msg) {
            
        }];
    }
}

-(void)reloadUITableView:(id)model{
    NSArray *tempArray = model;
    [self.listArray addObjectsFromArray:tempArray];
    if (tempArray.count < PageSize) {
        [self.myTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.myTableView.mj_footer endRefreshing];
    }
    [self.myTableView.mj_header endRefreshing];
    [self.myTableView reloadData];
}

-(void) ListRefresh{
    self.myTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.currentPage = CurrentPage;
        [self.listArray removeAllObjects];
        [self initData:self.selectState];
    }];
}

-(void)LoadMore{
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self initData:self.selectState];
    }];
}

#pragma mark -- UITableViewDelegate , UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isDocument) {
        DocumentListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"documentCell"];
        if (!cell) {
            cell = [[DocumentListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"documentCell"];
        }
        [cell config:self.listArray[indexPath.row]];
        return cell;
    }else{
        FileListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
        if (!cell) {
            cell = [[FileListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fileCell"];
        }
        [cell config:self.listArray[indexPath.row]];
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (_isDocument) {
        BNotice *notice = self.listArray[indexPath.row];
        self.vc.file_id = notice.id;
    }else{
        BDocument *document = self.listArray[indexPath.row];
        self.vc.file_id = document.id;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id destVc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"documentDetail"] && [destVc isKindOfClass:[SCXDDetailTableViewController class]]) {
        self.vc = destVc;
        self.vc.isDocument = YES;
        self.vc.title = @"公告详情";
    }else if ([segue.identifier isEqualToString:@"fileDetail"] && [destVc isKindOfClass:[SCXDDetailTableViewController class]]){
        self.vc = destVc;
        self.vc.title = @"公文详情";
        self.vc.isDocument = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

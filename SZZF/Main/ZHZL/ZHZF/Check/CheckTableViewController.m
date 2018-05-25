//
//  CheckTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CheckTableViewController.h"
#import "CheckItemTableViewCell.h"
#import "EventCheckModel.h"
#import "MJRefresh.h"
#import "QuestionReportTableViewController.h"
@interface CheckTableViewController ()

@end

@implementation CheckTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInterface];
    [self fetchData];
    [self ListRefresh];
    [self LoadMore];
}

-(void)setupInterface{
    self.bEventArray = [[NSMutableArray alloc]init];
    self.title = @"现场核查";
    self.pageSize = PageSize;
    self.currentPage = CurrentPage;
}

-(void) fetchData{
    [EventCheckModel getEventListWithU_id:[User currentUser].u_id limit:self.pageSize  offset:self.currentPage * self.pageSize block:@"现场核查" successed:^(id model) {
        NSArray *tempArray = model;
        [self.bEventArray addObjectsFromArray:tempArray];
        if (tempArray.count < PageSize) {
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.myTableView.mj_footer endRefreshing];
        }
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView reloadData];
        NSLog(@"===%@",self.bEventArray);
    } failed:^(NSString *msg) {
        
    }];
}

-(void) ListRefresh{
    self.myTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
         self.currentPage = CurrentPage;
         [self.bEventArray removeAllObjects];
         [self fetchData];
    }];
}

-(void)LoadMore{
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.currentPage ++;
        [self fetchData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.bEventArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CheckItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkitemcell"];
    if (!cell) {
        cell = [[CheckItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checkitemcell"];
    }
    BeventModel2 *event = self.bEventArray[indexPath.row];
    [cell config:event];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.vc.mBEventModel = self.bEventArray[indexPath.row];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id destVc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"check"] && [destVc isKindOfClass:[QuestionReportTableViewController class]]) {
        self.vc = destVc;
        self.vc.title = @"现场核查";
        self.vc.tag = 1 ;
    }
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

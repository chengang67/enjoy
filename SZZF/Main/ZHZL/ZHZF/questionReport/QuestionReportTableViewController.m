//
//  QuestionReportTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "QuestionReportTableViewController.h"
#import "AddFileTableViewCell.h"
#import "ContentTableViewCell.h"
#import "DealTableViewCell.h"
#import "VerifyTableViewCell.h"
#import "CheckTableViewCell.h"
#import "Process.h"
#import "EventCheckModel.h"
@interface QuestionReportTableViewController ()

@end

@implementation QuestionReportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.tag == 0 ||self.tag == 3) {
        [self initData];//上报需初始化案件类，否则案件由上一级传入
    }
}

- (void)didSelectedAddress:(NSString *)Address location:(CLLocationCoordinate2D)toPt{
    self.mBEventModel.pe_address = Address;
    self.mBEventModel.pe_lat = toPt.latitude;
    self.mBEventModel.pe_lng = toPt.longitude;
    [self.tableview reloadData];
}

-(void)initData {
    self.mBEventModel = [BeventModel2 new];
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
    switch (self.tag) {
        case 0://上报页面
            return 3;
            break;
        case 1://核查页面
            return 5;
            break;
        case 2:
            return 4;
            break;
        case 3://快速上报
            return 4;
            break;
        default:
            return 0;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0 ) {
        ContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"content" forIndexPath:indexPath];
        cell.mBEventModel = self.mBEventModel;
        [cell config:self.mBEventModel];
        if (self.tag == 1) {
            cell.btn_style.enabled = NO;
            cell.btn_super.enabled = NO;
            cell.btn_litter.enabled = NO;
        }
        return cell;
    }else if (indexPath.row == 1){
        AddFileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"addfile" forIndexPath:indexPath];
        cell.mBEventModel = self.mBEventModel;
        cell.rootVC = self;
        cell.tag = 0;
        [cell config:self.mBEventModel];
        return cell;
    }else if(indexPath.row == 2){
        switch (self.tag) {
            case 0:
                {DealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"deal" forIndexPath:indexPath];
                    cell.mBEventModel = self.mBEventModel;
                    cell.rootVC = self;
                return cell;
                }
                break;
            case 1 :
                {AddFileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"addfile" forIndexPath:indexPath];
                    cell.mBEventModel = self.mBEventModel;
                    cell.rootVC = self;
                    cell.tag = 1;
                    [cell config:self.mBEventModel];
                    return cell;
                }
                break;
            case 2:
                {VerifyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"verify" forIndexPath:indexPath];
                    return cell;
                }
                break;
            case 3:
                {AddFileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"addfile" forIndexPath:indexPath];
                    cell.mBEventModel = self.mBEventModel;
                    cell.rootVC = self;
                    cell.tag = 1;
                    [cell config:self.mBEventModel];
                    return cell;
                }
                break;
            default:
                return nil;
                break;
        }
        
        
    } else if(indexPath.row == 3){
         switch (self.tag) {
            case 1:
                 {
                     CheckTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"check" forIndexPath:indexPath];
                     cell.mBevent = self.mBEventModel;
                     return cell;
                 }
                 break;

            default:
                 {
                     DealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"deal" forIndexPath:indexPath];
                     cell.tag = self.tag;
                     cell.rootVC = self;
                     cell.mBEventModel = self.mBEventModel;
                     return cell;
                 }
                 break;
         }
    }else{
        DealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"deal" forIndexPath:indexPath];
        cell.tag = self.tag;
        cell.rootVC = self;
        cell.mBEventModel = self.mBEventModel;
        return cell;
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ( indexPath.row == 0 ) {
        return 300;
    }else if ( indexPath.row == 1){
        
        return 180;
    }else if (indexPath.row == 2){
        switch (self.tag) {
            case 0:
                return 100;
                break;
            case 1:
                return 180;
                break;
            case 2:
                return 120;
                break;
            case 3:
                return 180;
                break;
            default:
                return 0;
                break;
        }
    }else if (indexPath.row == 3) {
        switch (self.tag) {
            case 1:
                return 120;
                break;
           
            default:
                return 100;
                break;
        }
    } else{
        return 100;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.baiduMapVC = segue.destinationViewController;
    self.baiduMapVC.delegate=self;
}




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

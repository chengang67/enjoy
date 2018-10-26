//
//  SCXDDetailTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SCXDDetailTableViewController.h"
#import "CirculateModel.h"
#import "NSObject+CGSize.h"
@interface SCXDDetailTableViewController ()

@end

@implementation SCXDDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self initData];
}

-(void) initData{
    if (self.isDocument) {
        [NoticeInfoModel getNoticeInfo:self.file_id successed:^(id model) {
            NSLog(@"xiangqing =%@",model);
            self.noticeModel = model;
            [self.myTableView reloadData];
        } failed:^(NSString *msg) {
            
        }];
    }else{
        [DocumentInfoModel getDocumentInfo:self.file_id successed:^(id model) {
            NSLog(@"xiangqing =%@",model);
            self.documentModel = model;
            self.documentModel.circulateProcess = [BCirculateProcess new];
            self.documentModel.document.d_circulate = nil;//将传阅人值为空，否则进入的时候就会显示传阅人数
            //self.documentModel.document.d_content = @"有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。有些爱止于唇齿，掩于岁月。";
            [self.myTableView reloadData];
        } failed:^(NSString *msg) {
            
        }];
    }
}

#pragma mark - SCXDCirculateTableViewControllerDelegate
-(void)circulateListArray:(NSMutableArray *)circulateArray{
    self.documentModel.document.d_circulate = nil;
    for (NSString *name in circulateArray) {
        if (self.documentModel.document.d_circulate == nil) {
            self.documentModel.document.d_circulate = name;
        }else{
            self.documentModel.document.d_circulate = [NSString stringWithFormat:@"%@,%@",self.documentModel.document.d_circulate,name];
        }
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isDocument) {
        return 2;
    }else{
        return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        contentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentcell"];
        if (self.isDocument) {
            [cell config:self.noticeModel];
        }else {
            [cell config:self.documentModel];
        }
        return cell;
    }else if(indexPath.row == 1){
        fileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filecell"];
        cell.rootVC = self;
        if (self.isDocument) {
            [cell config:self.noticeModel];
        }else {
            [cell config:self.documentModel];
        }
        return cell;
    }else if(indexPath.row == 2){
        flowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowcell"];
        [cell config:self.documentModel];
        return cell;
    }else if(indexPath.row == 3){
        suggestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"suggestioncell"];
        [cell config:self.documentModel];
        return cell;
    }else if(indexPath.row == 4){
        commitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commitcell"];
        [cell config:self.documentModel];
        cell.rootVC = self;
        return cell;
    }else{
        return nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            {
                CGFloat height;
                if (self.isDocument) {
                    height = [self cellContentViewWith:self.noticeModel.notice.n_content];
                }else{
                    height = [self cellContentViewWith:self.documentModel.document.d_content];
                }
                return height + 80;
            }

            break;
         case 1:
            {
                NSArray *arr;
                if (self.isDocument) {
                    arr = [StringUtils componentSeparatedByString:self.noticeModel.notice.n_attachment];
                }else {
                    arr = [StringUtils componentSeparatedByString:self.documentModel.document.d_attachment];
                }
                return 40 + 70 * arr.count;
            }
            break;
        case 2:
            {
                NSArray *arr = self.documentModel.documentprocess;
                return 50 + 80 * arr.count;
            }
            break;
        case 3:
            return 220;
            break;
        case 4:
            return 110;
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)cellContentViewWith:(NSString *)str
{
    CGFloat width = screenWidth - 30;
    CGSize size = [NSObject getSizeWithString:str labelWidth:width textFont:15];
    return size.height;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.circulateVC = segue.destinationViewController;
    self.circulateVC.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

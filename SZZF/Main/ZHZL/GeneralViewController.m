//
//  GeneralViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GeneralViewController.h"
#import "QuestionReportTableViewController.h"
@interface GeneralViewController ()

@end

@implementation GeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id destVc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"report"] && [destVc isKindOfClass:[QuestionReportTableViewController class]]) {
        QuestionReportTableViewController *vc = destVc;
        vc.title = @"问题录入";
        vc.tag =0;
    }  else if ([segue.identifier isEqualToString:@"simple"] && [destVc isKindOfClass:[QuestionReportTableViewController class]]) {
        QuestionReportTableViewController *vc = destVc;
        vc.title = @"简易案件";
        vc.tag =3;
    }
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

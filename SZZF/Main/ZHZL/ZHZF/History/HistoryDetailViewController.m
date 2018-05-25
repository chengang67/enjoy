//
//  HistoryDetailViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HistoryDetailViewController.h"
#import "SDAutoLayout.h"
@interface HistoryDetailViewController ()

@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view1 sd_addSubviews:@[self.sjbhlable,self.sjbh]];
    self.sjbh.text=@"c";
    self.sjbh.sd_layout
    .topEqualToView(self.sjbhlable)
    .leftSpaceToView(self.sjbhlable, 10)
    .autoHeightRatio(0);
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

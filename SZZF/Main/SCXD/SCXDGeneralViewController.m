//
//  ZHZLGeneralViewController.m
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SCXDGeneralViewController.h"

@interface SCXDGeneralViewController ()

@end

@implementation SCXDGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"documentPush"]) {
        SCXDFileListViewController *vc= segue.destinationViewController;
        vc.isDocument = YES;
    }else{
        SCXDFileListViewController *vc= segue.destinationViewController;
        vc.isDocument = NO;
    }
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

//
//  SettingTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SettingTableViewController.h"
#import "LoginViewController.h"
@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
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
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}


- (IBAction)forgetPswBtnClick:(id)sender {
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:@"no_remember" forKey:@"u_psd"];
    [df synchronize];
    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"login" bundle:nil];
    LoginViewController *vc = [sb instantiateViewControllerWithIdentifier:@"login"];
    self.view.window.rootViewController = vc;
}
@end

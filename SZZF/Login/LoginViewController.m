//
//  LoginViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "LoginModel.h"
#import "UIView+Toast.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClick:(id)sender {
    if (self.username.text.length == 0) {
        [self.view makeToast:@"请输入账号"];
        return;
    }
    if (self.password.text.length == 0) {
        [self.view makeToast:@"请输入密码"];
        return;
    }
    [LoginModel getHomeListWith:self.username.text u_password:self.password.text successed:^(id model) {
        UIStoryboard *sb =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"mainvc"];
        [self.navigationController pushViewController:vc animated:YES];
        if (self.rememberBtn.selected) {
            //记住密码
            NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
            [df setObject:@"remember" forKey:@"u_psd"];
            [df synchronize];
        }
    } failed:^(NSString *msg) {
        [self.view makeToast:msg];
    }];
}

- (IBAction)rememberPswBtnClick:(id)sender {
    self.rememberBtn.selected = !self.rememberBtn.selected;
    
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

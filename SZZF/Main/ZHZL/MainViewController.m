//
//  MainViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "MainViewController.h"
#import "GeneralViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    GeneralViewController *vc = [[GeneralViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
}



-(void)viewWillAppear:(BOOL)animated{
    GeneralViewController *vc = [[GeneralViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
}

- (IBAction)themeBlockClick:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
            {
                UIStoryboard *sb =[UIStoryboard storyboardWithName:@"SCXD" bundle:nil];
                ZZZXGeneralViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SCXDFileLIst"];
                [self pushToAnotherViewController:vc];
            }
            break;
        case 1:
           
            break;
        case 2:
            
            break;
        case 3:
            {
                UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ZZZX" bundle:nil];
                ZZZXGeneralViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ZZZXGeneral"];
                [self pushToAnotherViewController:vc];
            }
            break;
        case 4:
            {
                UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ZHZL" bundle:nil];
                ZZZXGeneralViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ZHZLgeneral"];
                [self pushToAnotherViewController:vc];
            }
            break;
        default:
            break;
    }
    
}

-(void)pushToAnotherViewController:(UIViewController *)vc{
    
    [self.navigationController pushViewController:vc animated:YES];
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

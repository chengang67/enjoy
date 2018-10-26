//
//  ViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SquareViewController.h"
#import "SettingTableViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadTabbarViewController];
}

-(void)loadTabbarViewController{
    //创建一个tabbar控制器
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    
    UIStoryboard *sb1 =[UIStoryboard storyboardWithName:@"ZHZL" bundle:nil];
    MainViewController *mainvc = [sb1 instantiateViewControllerWithIdentifier:@"main"];
    UINavigationController *mainnav = [[UINavigationController alloc]initWithRootViewController:mainvc];
    UITabBarItem *maintabbarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"first_normal"] selectedImage:[UIImage imageNamed:@"first_selected"]];
    mainvc.tabBarItem = maintabbarItem;
    
    UIStoryboard *sb2 =[UIStoryboard storyboardWithName:@"Square" bundle:nil];
    SquareViewController *squarevc = [sb2 instantiateViewControllerWithIdentifier:@"square"];
    UINavigationController *squarenav = [[UINavigationController alloc]initWithRootViewController:squarevc];
    UITabBarItem *squaretabbarItem = [[UITabBarItem alloc]initWithTitle:@"广场" image:[UIImage imageNamed:@"second_normal"] selectedImage:[UIImage imageNamed:@"second_selected"]];
    squarevc.tabBarItem = squaretabbarItem;
    
    UIStoryboard *sb3 =[UIStoryboard storyboardWithName:@"Setting" bundle:nil];
    SettingTableViewController *settingvc = [sb3 instantiateViewControllerWithIdentifier:@"setting"];
    UINavigationController *settingnav = [[UINavigationController alloc]initWithRootViewController:settingvc];
    UITabBarItem *settingtabbarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"third_normal"] selectedImage:[UIImage imageNamed:@"third_selected"]];
    settingvc.tabBarItem = settingtabbarItem;
    
    tabbar.viewControllers =@[mainnav, squarenav , settingnav];

    [[[UIApplication sharedApplication]delegate] window].rootViewController = tabbar;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

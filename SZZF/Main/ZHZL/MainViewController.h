//
//  MainViewController.h
//  SZZF
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZZXGeneralViewController.h"

@interface MainViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *statuses;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

- (IBAction)themeBlockClick:(id)sender;


@end

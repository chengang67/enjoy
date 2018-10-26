//
//  CheckTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckTableViewCell : UITableViewCell<UITextViewDelegate>

@property(nonatomic, strong)BeventModel *mBevent;
@property (weak, nonatomic) IBOutlet UITextView *check_option;
@property (weak, nonatomic) IBOutlet UITextField *check_result;


- (IBAction)checkResultClick:(id)sender;

@end

//
//  ContentTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperStyleModel.h"

@interface ContentTableViewCell : UITableViewCell<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *questionStyle;
@property (weak, nonatomic) IBOutlet UITextField *superStyle;
@property (weak, nonatomic) IBOutlet UITextField *litterStyle;
@property (weak, nonatomic) IBOutlet UITextField *locationGrid;
@property (weak, nonatomic) IBOutlet UITextView *contentDesc;
@property (weak, nonatomic) IBOutlet UIButton *btn_style;
@property (weak, nonatomic) IBOutlet UIButton *btn_super;
@property (weak, nonatomic) IBOutlet UIButton *btn_litter;

@property(nonatomic, strong)BeventModel2 *mBEventModel;
@property(nonatomic, strong)NSArray *superStyleModelArray;
@property(nonatomic, strong)NSArray *litterStyleModelArray;

- (IBAction)styleBtnClick:(id)sender;
- (IBAction)superStyleBtnClick:(id)sender;
- (IBAction)litterStyleBtnClick:(id)sender;

-(void)config:(BeventModel2 *)model;

@end

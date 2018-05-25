//
//  DealTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventUploadModel.h"
@interface DealTableViewCell : UITableViewCell
- (IBAction)reportBtnClick:(id)sender;
- (IBAction)saveBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reportBtn;

@property(nonatomic, assign)NSInteger tag;
@property(nonatomic, strong)UIViewController *rootVC;
@property(nonatomic, strong)BeventModel2 *mBEventModel;
@end

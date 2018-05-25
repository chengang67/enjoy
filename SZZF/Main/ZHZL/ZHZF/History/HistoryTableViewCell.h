//
//  HistoryTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestObject.h"
@interface HistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;


-(void)config:(BeventModel2 *)model row:(NSInteger)row;
@property (nonatomic, strong) TestObject *model;
@end

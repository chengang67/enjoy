//
//  FlowItemCell.h
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCirculateProcess.h"
@interface FlowItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *suggestion;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;
-(void)config:(BCirculateProcess *)model;

@end

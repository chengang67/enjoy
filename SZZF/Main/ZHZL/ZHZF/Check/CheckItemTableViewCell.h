//
//  CheckItemTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *event_no;
@property (weak, nonatomic) IBOutlet UILabel *event_type;
@property (weak, nonatomic) IBOutlet UILabel *event_super;
@property (weak, nonatomic) IBOutlet UILabel *event_litter;
@property (weak, nonatomic) IBOutlet UILabel *event_content;
@property (weak, nonatomic) IBOutlet UILabel *event_state;
@property(nonatomic, strong)BeventModel2 *eventModel;
-(void)config:(BeventModel2 *)model;
@end

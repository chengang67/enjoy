//
//  DocumentListTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNotice.h"
@interface DocumentListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;

-(void)config:(BNotice *)notice;

@end

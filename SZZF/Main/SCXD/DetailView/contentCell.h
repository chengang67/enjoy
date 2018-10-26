//
//  contentCell.h
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeInfoModel.h"
#import "DocumentInfoModel.h"
@interface contentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *readCount;
@property (weak, nonatomic) IBOutlet UIView *cutLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;
-(void)config:(id)model;

@end

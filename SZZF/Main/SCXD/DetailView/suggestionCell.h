//
//  suggestionCell.h
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentInfoModel.h"

@interface suggestionCell : UITableViewCell<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *suggestion;
@property (weak, nonatomic) IBOutlet UILabel *sign;
@property (weak, nonatomic) IBOutlet UILabel *circulateCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checkBtnArray;
@property(nonatomic, strong)DocumentInfoModel * infoModel;

- (IBAction)checkBtnClick:(id)sender;

-(void)config:(DocumentInfoModel *)model;

@end

//
//  FileItemCell.h
//  SZZF
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fileName;

-(void)config:(NSString *)fileName;
@end

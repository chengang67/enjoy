//
//  SCXDCirculateTableViewController.h
//  SZZF
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCXDCirculateTableViewControllerDelegate <NSObject>

-(void)circulateListArray:(NSMutableArray *)circulateArray;

@end

@interface SCXDCirculateTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,assign)id<SCXDCirculateTableViewControllerDelegate> delegate;
@end

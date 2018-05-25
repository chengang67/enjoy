//
//  ContradictionTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ContradictionTableViewController.h"
#import "PartyATableViewCell.h"
#import "PartyBTableViewCell.h"
#import "AddFileTableViewCell.h"
#import "DealTableViewCell.h"
@interface ContradictionTableViewController ()

@end

@implementation ContradictionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                PartyATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"partyA" forIndexPath:indexPath];
                return cell;
            }
            break;
        case 1:
            {
                PartyBTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"partyB" forIndexPath:indexPath];
                return cell;
            }
            break;
        case 2:
            {
                AddFileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"addfile" forIndexPath:indexPath];

                return cell;
            }
            break;
        case 3:
            {
                DealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"deal" forIndexPath:indexPath];
                return cell;
            }
            break;
        default:
            return nil;
            break;
    }
}




@end

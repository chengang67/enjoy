//
//  flowCell.m
//  SZZF
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "flowCell.h"

@implementation flowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  //  [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
  //  [self.flowTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    self.flowTableView.delegate = self;
//    self.flowTableView.dataSource = self;
}

-(void)config:(DocumentInfoModel*)model{
    self.infoModel = model;
    [self.flowTableView reloadData];
}


#pragma mark -- UITableViewDelegate UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoModel.documentprocess.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlowItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowitemcell"];
    BCirculateProcess *process = self.infoModel.documentprocess[indexPath.row];
    [cell config:process];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  SCXDCirculateTableViewController.m
//  SZZF
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SCXDCirculateTableViewController.h"
#import "CirculateModel.h"
#import "BUser.h"
#import "HeaderView.h"
#import "ChooseRoleCell.h"

static NSString * const ReuseIdentifierHeader = @"header";
static NSString * const ReuseIdentifierCell = @"dcell";

@interface SCXDCirculateTableViewController ()
@property(nonatomic, strong)CirculateModel *modelDic;
@property(nonatomic, strong)CirculateListModel *circulate;
@property (nonatomic, strong) NSMutableDictionary *dataDic;
@property (nonatomic, strong) NSArray             *dataArray;

@property (nonatomic, strong) NSMutableArray      *expendArray;//记录打开的分组
@property (nonatomic, strong) NSMutableArray      *selectArray;//记录选择的所有选项

@end

@implementation SCXDCirculateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self getData];
}

-(void)initView{
    self.myTableView.tableFooterView = [UIView new];
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:ReuseIdentifierHeader];
    [self.myTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClick:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

-(void)rightBtnClick:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(circulateListArray:)]) {
        [self.delegate circulateListArray:self.selectArray];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    [CirculateModel getCirculatesuccessed:^(id model) {
        [self dealData:model];
    } failed:^(NSString *msg) {
        
    }];
}

-(void)dealData:(id)model{
    self.modelDic = model;
    for (int i = 0; i < self.modelDic.data.count; i++ ) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        self.circulate = self.modelDic.data[i];
        for (int j = 0; j < self.circulate.users.count; j ++) {
            BUser *user = self.circulate.users[j];
            [array addObject:user.u_name];
        }
        [self.dataDic setObject:array forKey:self.circulate.department.dep_name];
    }
    self.dataArray = [ self.dataDic allKeys];
    [self.myTableView reloadData];
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = self.dataArray[section];
    NSArray *array = self.dataDic[key];
    
    if ([self.expendArray containsObject:key]) {
        return array.count;
    }else {
        return 0.5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *key = self.dataArray[section];
    NSArray *array = self.dataDic[key];
    HeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ReuseIdentifierHeader];
    view.nameLabel.text = key;
    view.selectButton.tag = section;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, -2, self.view.bounds.size.width, 0.3)];
    lab.backgroundColor = [UIColor blackColor];
    lab.alpha = 0.2;
    [view addSubview:lab];
    
    BOOL selectAll = YES;
    for (id object in array) {
        if (![self.selectArray containsObject:object]) {
            selectAll = NO;
        }
    }
    view.selectButton.selected = selectAll;
    [view.selectButton addTarget:self action:@selector(headerButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [view.tap addTarget:self action:@selector(headerTap:)];
    if ([self.expendArray containsObject:key]) {
        view.jiantouInageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else {
        view.jiantouInageView.transform = CGAffineTransformIdentity;
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.dataArray[indexPath.section];
    NSArray *array = self.dataDic[key];
    NSString *name = array[indexPath.row];
    
    ChooseRoleCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifierCell forIndexPath:indexPath];
    
    if ([self.selectArray containsObject:name]) {
        cell.selectImageVIew.selected = YES;
    }else {
        cell.selectImageVIew.selected = NO;
    }
    //cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    cell.nameLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *key = self.dataArray[indexPath.section];
    NSArray *array = self.dataDic[key];
    NSString *name = array[indexPath.row];
    
    if ([self.selectArray containsObject:name]) {
        [self.selectArray removeObject:name];
    }else {
        [self.selectArray addObject:name];
    }
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - private methods

- (void)headerButtonOnClick:(UIButton *)button {
    NSString *key = self.dataArray[button.tag];
    NSArray *array = self.dataDic[key];
    
    if (button.selected) {
        [self.selectArray removeObjectsInArray:array];
    }else {
        [self.selectArray addObjectsFromArray:array];
    }
    
    button.selected = !button.selected;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)headerTap:(UITapGestureRecognizer *)tap {
    HeaderView *view = (HeaderView *)tap.view;
    NSString *key = view.nameLabel.text;
    NSInteger index = [self.dataArray indexOfObject:key];
    
    if ([self.expendArray containsObject:key]) {
        [self.expendArray removeObject:key];
        [UIView animateWithDuration:0.1 animations:^{
            view.jiantouInageView.transform = CGAffineTransformIdentity;
        }];
    }else {
        [self.expendArray addObject:key];
        [UIView animateWithDuration:0.1 animations:^{
            view.jiantouInageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        }];
    }
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - getters

- (NSMutableDictionary *)dataDic {
    if (!_dataDic) {
        _dataDic = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _dataDic;
}

- (NSMutableArray *)expendArray {
    if (!_expendArray) {
        _expendArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _expendArray;
}

- (NSMutableArray *)selectArray {
    if (!_selectArray) {
        _selectArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

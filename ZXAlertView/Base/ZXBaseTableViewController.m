//
//  ZXBaseTableViewController.m
//  ZXAlertView
//
//  Created by ozx on 2018/6/2.
//  Copyright © 2018 ozx. All rights reserved.
//

#import "ZXBaseTableViewController.h"
#import <Masonry.h>
#import <NSObject+MJKeyValue.h>

@interface ZXBaseTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZXBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - setter
- (void)setDataArray:(NSMutableArray<NSString *> *)dataArray {
    _dataArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dataArray) {
        ZXContentModel *model = [ZXContentModel mj_objectWithKeyValues:dict];
        [_dataArray addObject:model];
    }
    
    [self.tableView reloadData];
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    cell.textLabel.text = self.dataArray[indexPath.row].title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    !self.cellSelectedBlock ?: self.cellSelectedBlock(indexPath.row);
}

@end

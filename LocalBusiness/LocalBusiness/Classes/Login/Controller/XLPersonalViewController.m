//
//  XLPersonalViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLPersonalViewController.h"
#import "XLPersonalHeaderView.h"
#import "XLPersonalCell.h"
#import "XLPersonalFooterView.h"

@interface XLPersonalViewController () <XLPersonalFooterViewDelegate>
/**
 *  tableHeaderView
 */
@property (nonatomic, strong) XLPersonalHeaderView *headerView;
/**
 *  tableFooterView
 */
@property (nonatomic, strong) XLPersonalFooterView *footerView;


@end

@implementation XLPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"个人中心"];
    // 隐藏右边按钮
    self.navigationItem.rightBarButtonItem = nil;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
}


#pragma mark - XLPersonalFooterViewDelegate

- (void)didClickexitButton {
    [self.navigationController popViewControllerAnimated:YES];
    [self showSuccessMessage:@"退出成功"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLPersonalCell *cell = [XLPersonalCell cellWithTableView:tableView];
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    if (indexPath.row == 0) {
        NSString *gender = [XLUserInfo sharedInfo].infoModel.gender ? @"男" : @"女";
        [para setObject:gender forKey:@"right"];
        [para setObject:@"性别" forKey:@"left"];
    }else if (indexPath.row == 1) {
        [para setObject:@"手机" forKey:@"left"];
        [para setObject: [XLUserInfo sharedInfo].infoModel.mobile forKey:@"right"];
    }
    cell.parameter = para;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 42;
}


#pragma mark - Getter & Setter

- (XLPersonalHeaderView *)headerView {
    if (!_headerView) {
        self.headerView = [XLPersonalHeaderView personalHeaderView];
    }
    return _headerView;
}

- (XLPersonalFooterView *)footerView {
    if (!_footerView) {
        self.footerView = [XLPersonalFooterView personalFooterView];
        self.footerView.delegate = self;
    }
    return _footerView;
}


@end

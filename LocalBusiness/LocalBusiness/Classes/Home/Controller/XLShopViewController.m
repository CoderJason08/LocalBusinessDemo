//
//  XLShopViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopViewController.h"
#import "XLShopHeaderView.h"
#import "XLShopGoodsViewCell.h"
#import "XLShopCommentViewCell.h"
#import "XLHeaderView.h"
#import "XLShopModel.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface XLShopViewController () <UITableViewDataSource>
/**
 *  商家模型
 */
@property (nonatomic, strong) XLShopModel *shopModel;
/**
 *  tableView头
 */
@property (nonatomic, strong) XLShopHeaderView *headerView;
@end

@implementation XLShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"商家详情"];
    [self requestShopData];
    
    // 设置tableView HeaderView
    self.tableView.tableHeaderView = self.headerView;
    // 禁用系统分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - UITableViewDatasource

/**
 *  返回分组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/**
 *  返回分组对应的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) { // 商品
        return 2;
    }else { // 用户评价
        return self.shopModel.comment_list.count;
    }
}

/**
 *  返回对应indexPath的cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    return 100;
}

/**
 *  返回对应indexPath的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) { // 商品cell
        XLShopGoodsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XLShopGoodsViewCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"XLShopGoodsViewCell" owner:nil options:nil] lastObject];
        }
        /**
         *  第一个之后隐藏顶部分隔线
         */
        if (indexPath.row != 0) {
            cell.topSepLine.hidden = YES;
        }
        /**
         *  设置模型
         */
        NSMutableDictionary *goods = [NSMutableDictionary dictionary];
        [goods setObject:@"卡布奇诺+提拉米苏" forKey:@"goodsName"];
        [goods setObject:@"温馨下午茶,享受每一个下午" forKey:@"goodsAdver"];
        [goods setObject:@"45" forKey:@"goodsPrice"];
        cell.goods = goods;
        
        return cell;
    }else  { // 评论cell
        XLShopCommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XLShopCommentViewCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"XLShopCommentViewCell" owner:nil options:nil] lastObject];
        }
        if (indexPath.row != 0) {
            cell.topSepLine.hidden = YES;
        }
        /**
         *  第一个之后隐藏顶部分隔线
         */
        cell.model = self.shopModel.comment_list[indexPath.row];
        return cell;
    }
    return nil;
}

/**
 *  返回每一个分组头高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 40;
    }
    return 0;
}

/**
 *  分组头
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) { // 商品
        XLHeaderView *view = [XLHeaderView headerViewWithTitle:@"商品" color:COLOR_RGBA(241, 97, 100, 1)];
//        view.backgroundColor = Random_COLOR;
        return view;
    }else if (section == 1) { // 用户评价
        XLHeaderView *view = [XLHeaderView headerViewWithTitle:@"用户评价" color:COLOR_RGBA(240, 112, 171, 1)];
//        view.backgroundColor = Random_COLOR;
        return view;
    }
    return nil;
}

/**
 *  返回分组底部的view高度
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 40;
    }
    return 0;
}

/**
 *  分组底部的view
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    XLBarButton *button = nil;
    if (section == 0) {
        button = [XLFactory buttonWithTitle:@"更多" image:nil type:XLButtonTypeNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:COLOR_RGBA(57, 173, 246, 1) forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    }else {
        button = [XLFactory buttonWithTitle:@"查看更多评论" image:nil type:XLButtonTypeNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:COLOR_RGBA(57, 173, 246, 1) forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    }
    return button;
}



#pragma mark - Private Function


- (void)setShopModel:(XLShopModel *)shopModel {
    _shopModel = shopModel;
    self.headerView.shopModel = shopModel;
    // 更新HeaderView的高度,先取出,修改frame之后再次赋值
    UIView *view = self.headerView;
    // 调用updateFrame方法动态计算高度
    view.frame = [self.headerView updateFrame];
    self.tableView.tableHeaderView = (XLShopHeaderView *)view;
}

/**
 *  请求商家详情数据
 */
- (void)requestShopData {
    // 设置请求参数
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:self.parameter[@"shop_id"] forKey:@"shop_id"];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"shop_id"],para[@"time"],APP_KEY];
    [para setObject:[XLFunction MD5SignWithParaArray:paraArray] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    // 显示进度
    [self showActivityHUD];
    // POST请求
    [XLNewtWorkManager XLPOST:kShopInfo parameters:para success:^(id responseObject) {
        // 请求成功,关闭进度
        [self hideActivityHUD];
        // 初始化模型数据
        self.shopModel = [[XLShopModel alloc] initWithDictionary:responseObject error:NULL];
        [self.tableView reloadData];
    } error:^(id error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    }];
}



#pragma mark - Getter & Setter

- (XLShopHeaderView *)headerView {
    if (!_headerView) {
        self.headerView = [XLShopHeaderView shopHeaderView];
//        self.headerView.backgroundColor = Random_COLOR;
    }
    return _headerView;
}

@end





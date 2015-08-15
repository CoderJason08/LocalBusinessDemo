//
//  XLShopViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopViewController.h"
#import "XLShopModel.h"

@interface XLShopViewController ()
/**
 *  商家模型
 */
@property (nonatomic, strong) XLShopModel *shopModel;
@end

@implementation XLShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"商家详情"];
    [self requestShopData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        NSLog(@"%@",self.shopModel);
        [self.tableView reloadData];
    } error:^(id error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    }];
}


@end





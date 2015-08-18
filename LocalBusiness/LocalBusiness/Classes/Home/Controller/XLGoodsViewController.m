//
//  XLGoodsViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLGoodsViewController.h"
#import "XLGoodModel.h"

@interface XLGoodsViewController ()
@property (nonatomic, strong) XLGoodModel *goodModel;
@end

@implementation XLGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"商品详情"];
    [self requestGoodsData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  请求商品详情数据
 */
- (void)requestGoodsData {
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    
    [para setObject:self.parameter[@"good_id"] forKey:@"good_id"];
    [para setObject:self.parameter[@"lon"] forKey:@"lon"];
    [para setObject:self.parameter[@"lat"] forKey:@"lat"];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"good_id"],para[@"lon"],para[@"lat"],para[@"time"],APP_KEY];
    [para setObject:[XLFunction MD5SignWithParaArray:paraArray] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    [self showActivityHUD];
    /**
     *  发送请求
     *
     *  @param responseObject 请求成功获取的数据
     *
     */
    [XLNewtWorkManager XLPOST:kGoodsInfo parameters:para success:^(id responseObject) {
        [self hideActivityHUD];
        self.goodModel = [[XLGoodModel alloc] initWithDictionary:responseObject error:NULL];
        [self.tableView reloadData];
    } error:^(id error) {
        NSLog(@"%@",error);
        [self hideActivityHUD];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [self hideActivityHUD];
    }];
}

#pragma mark - Getter & Setter 



@end

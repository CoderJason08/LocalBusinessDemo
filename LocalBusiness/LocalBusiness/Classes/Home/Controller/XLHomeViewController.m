//
//  XLHomeViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLHomeViewController.h"
#import "XLNewtWorkManager.h"
@interface XLHomeViewController ()

@end

@implementation XLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    /**
     *  设置请求参数
     */
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:@"120.38" forKey:@"lon"];
    [para setObject:@"36.06" forKey:@"lat"];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"lon"],para[@"lat"],para[@"time"],APP_KEY];
    [para setObject:[XLFunction MD5SignWithParaArray:paraArray] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    [XLNewtWorkManager XLGET:kIndexInfo parameters:para success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } error:^(id error) {
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
